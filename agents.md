# Compile guide

- Install OverPy CLI (once): `pnpm i -g overpy`
  - You can also use `npx overpy --help` for a one-off install.
- Compile `examples/basic_syntax.from_txt.opy` to Workshop text:
  - `overpy compile -i examples/basic_syntax.from_txt.opy -o examples/basic_syntax.from_txt.compiled.txt`

Notes:

- The command also works from stdin/stdout: `Get-Content examples/basic_syntax.from_txt.opy | overpy compile > examples/basic_syntax.from_txt.compiled.txt`
- In VS Code with the OverPy extension, save the `.opy` file and use the extension’s compile step (it writes Workshop text automatically).
