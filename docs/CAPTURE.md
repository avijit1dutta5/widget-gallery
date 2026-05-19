# 📸 Capturing screenshots & demo GIFs

The README shows placeholder frames. Replace them with real captures by
overwriting the files in `docs/screenshots/` and `docs/demo/` (keep the
same filenames so the README picks them up automatically).

Target files:

| File | Screen to capture |
|------|-------------------|
| `docs/screenshots/home.png` | Gallery home (grid of widgets) |
| `docs/screenshots/detail.png` | A widget detail (preview + code) |
| `docs/screenshots/settings.png` | Settings sheet (language / color) |
| `docs/screenshots/themes.png` | Dark mode + a different color flavor |
| `docs/demo/walkthrough.gif` | Short scroll → open widget → copy |

> Use `.png` for stills and `.gif` for the demo, then update the README
> image links from `.svg` to `.png` / `.gif` (or just run
> `tools/update_readme_media.sh`).

## Android (emulator or device)

```bash
# Still screenshot straight to file
adb exec-out screencap -p > docs/screenshots/home.png

# Record a demo, then convert to an optimized GIF
adb shell screenrecord --time-limit 12 /sdcard/demo.mp4
adb pull /sdcard/demo.mp4 /tmp/demo.mp4
ffmpeg -i /tmp/demo.mp4 -vf "fps=15,scale=320:-1:flags=lanczos" \
  -loop 0 docs/demo/walkthrough.gif
```

(`brew install ffmpeg` if you don't have it. `gifski` gives even nicer
GIFs: `ffmpeg -i /tmp/demo.mp4 -vf scale=320:-1 -f yuv4mpegpipe - | \
gifski -o docs/demo/walkthrough.gif -`.)

## Flutter (Chrome / desktop / device)

```bash
flutter run            # then press "s" in the terminal to save a screenshot
# or, for a connected device:
flutter screenshot --out=docs/screenshots/home.png
```

For a web demo GIF, use macOS screen recording (⇧⌘5) on the Chrome
window, then the same `ffmpeg` conversion as above.

## Tips for recruiter-friendly captures

- Capture **light home**, **dark detail**, and the **settings sheet** —
  it shows theming + i18n + the code view in three frames.
- Switch the language to বাংলা or हिन्दी for one shot to highlight i18n.
- Keep the GIF under ~8 MB so it loads fast on GitHub.
