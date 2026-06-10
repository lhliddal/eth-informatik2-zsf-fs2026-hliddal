#!/usr/bin/env python3
"""Re-compress graphics for smaller repo/build I/O. Backs up originals under _scratch/."""

from __future__ import annotations

import argparse
import io
import shutil
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path

from PIL import Image, ImageFile

ImageFile.LOAD_TRUNCATED_IMAGES = True

IMAGE_SUFFIXES = {".png", ".jpg", ".jpeg", ".webp"}


@dataclass(frozen=True)
class Result:
    path: Path
    before: int
    after: int
    changed: bool


def _png_bytes(im: Image.Image) -> bytes:
    buf = io.BytesIO()
    im.save(buf, format="PNG", optimize=True, compress_level=9)
    return buf.getvalue()


def _jpeg_bytes(im: Image.Image, quality: int) -> bytes:
    buf = io.BytesIO()
    if im.mode in ("RGB", "L"):
        to_save = im
    else:
        to_save = im.convert("RGB")
    to_save.save(buf, format="JPEG", quality=quality, optimize=True, progressive=True)
    return buf.getvalue()


def optimize_one(path: Path, jpeg_quality: int) -> Result:
    before = path.stat().st_size
    suffix = path.suffix.lower()

    with Image.open(path) as im:
        im.load()
        if suffix == ".png":
            data = _png_bytes(im)
        elif suffix in (".jpg", ".jpeg"):
            data = _jpeg_bytes(im, jpeg_quality)
        elif suffix == ".webp":
            buf = io.BytesIO()
            im.save(buf, format="WEBP", method=6, quality=90)
            data = buf.getvalue()
        else:
            return Result(path=path, before=before, after=before, changed=False)

    after = len(data)
    if after < before:
        path.write_bytes(data)
        return Result(path=path, before=before, after=after, changed=True)
    return Result(path=path, before=before, after=before, changed=False)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    project_root = Path(__file__).resolve().parent.parent
    parser.add_argument(
        "--graphics-dir",
        type=Path,
        action="append",
        help="Bildverzeichnis(se). Mehrfach angebbar. Default: Images/ und figures/.",
    )
    parser.add_argument("--jpeg-quality", type=int, default=90)
    args = parser.parse_args()

    graphics_dirs: list[Path] = args.graphics_dir or [
        project_root / "Images",
        project_root / "figures",
    ]
    graphics_dirs = [d for d in graphics_dirs if d.is_dir()]
    if not graphics_dirs:
        raise SystemExit("Keines der Bildverzeichnisse existiert.")

    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    backup_root = project_root / "_scratch" / f"graphics_backup_{stamp}"
    backup_root.mkdir(parents=True, exist_ok=True)

    results: list[Result] = []
    for graphics_dir in graphics_dirs:
        sub_backup = backup_root / graphics_dir.name
        sub_backup.mkdir(parents=True, exist_ok=True)
        for path in sorted(graphics_dir.rglob("*")):
            if not path.is_file():
                continue
            if path.suffix.lower() not in IMAGE_SUFFIXES:
                continue
            rel = path.relative_to(graphics_dir)
            dest = sub_backup / rel
            dest.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(path, dest)
            results.append(optimize_one(path, args.jpeg_quality))

    total_before = sum(r.before for r in results)
    total_after = sum(r.after if r.changed else r.before for r in results)
    changed = [r for r in results if r.changed]

    print(f"backup: {backup_root}")
    print(f"files: {len(results)}  changed: {len(changed)}")
    print(f"total: {total_before / 1024 / 1024:.2f} MB -> {total_after / 1024 / 1024:.2f} MB")
    for r in sorted(changed, key=lambda x: (x.before - x.after), reverse=True):
        saved = r.before - r.after
        print(
            f"  {r.path.name}: {r.before/1024/1024:.2f} MB -> {r.after/1024/1024:.2f} MB "
            f"(-{saved/1024/1024:.2f} MB)"
        )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
