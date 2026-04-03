# Compile guide

- Quick check for this repo:
  - Source: `examples/random-abilities.from_txt.opy`
  - Output: `examples/random-abilities.from_txt.compiled.txt`

- Install OverPy CLI (once): `pnpm i -g overpy`
  - You can also use `npx overpy --help` for a one-off install.

- Compile an `.opy` file to Workshop text (replace `<source>` with your `.opy` file path, including extension):
  - `overpy compile -i <source> -o <source_without_ext>.compiled.txt`
  - In this repo, local fallback: `node out/overpy_standalone.js compile -i <source> -o <source_without_ext>.compiled.txt`

Notes:

- The command also works from stdin/stdout:
  - `Get-Content <source> | overpy compile > <source_without_ext>.compiled.txt`
- In VS Code with the OverPy extension, save the `.opy` file and use the extension's compile step (it writes Workshop text automatically).

