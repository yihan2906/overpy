# Compile guide

- Quick check for this repo:
  - Source: `examples/random-abilities.from_txt.opy`
  - Output: `examples/random-abilities.from_txt.compiled.txt`

- Install OverPy CLI (once): `pnpm i -g overpy`
  - You can also use `npx overpy --help` for a one-off install.

- Compile an `.opy` file to Workshop text (replace `<source>` with your `.opy` file path, including extension):
  - `overpy compile -i <source> -o <source_without_ext>.compiled.txt`
  - In this repo, local fallback: `node out/overpy_cli.js compile -i <source> -o <source_without_ext>.compiled.txt`

Notes:

- `out/overpy_standalone.js` is the runtime bundle, not the CLI entrypoint, so use `out/overpy_cli.js` for local command-line compilation.

- The command also works from stdin/stdout:
  - `Get-Content <source> | overpy compile > <source_without_ext>.compiled.txt`
- In VS Code with the OverPy extension, save the `.opy` file and use the extension's compile step (it writes Workshop text automatically).

# Random abilities maintenance

- For `examples/random-abilities.from_txt.opy`, prefer moving edited Interact abilities into dedicated rules instead of changing the decompiled `on use` jump table.
- The large `on use`, `roll_ability`, and `clear_ability` sections contain decompiled `goto loc+[ ... ]` / `Skip(...)` jump tables. Do not casually delete or insert actions inside those jump-table bodies; offsets and labels can break later abilities.
- Treat Workshop player/global variable slots and persistent HUD text, in-world text, icon, and effect slots as scarce resources. Avoid adding new variables or persistent visual objects unless the behavior genuinely needs them; prefer existing state, messages, or changing parameters on already-created objects. Any persistent object must have a clear cleanup path.
- When an ability needs custom use logic:
  - Add a dedicated rule such as `rule "[ability name] use":`.
  - Gate it with `abilityNames[eventPlayer.ability] == AbilityName`.
  - Exclude that ability from the generic `on use` rule, usually by name and, when safe, by removing its class id from the `on use` selector arrays.
  - Leave the old unreachable jump-table block in place unless doing a full offset recalculation/refactor.
  - Do not rely on old jump-table blocks for edited behavior. If a behavior moves to dedicated rules, keep jump-table structure stable and remove the dependency by turning the old block into a true no-op with the same compiled shape when possible.
  - A true no-op must not mutate ability state, cleanup ids, player targets, cooldowns, HUD visibility drivers, or other runtime behavior. Prefer same-shape self-assign placeholders over resetting variables.
  - Long-term maintenance goal: remove the decompiled jump tables entirely and migrate ability start/use/end behavior to dedicated, readable rules.
- When creating or editing a specific ability, update the host-only debug force rule to target that ability so the host can quickly test it. Adjust any ability-specific press counters or button gates so the debug shortcut itself does not immediately consume/fire the ability unless that is intentional.
- For dedicated ability rules with HUD/effect/text support:
  - Prefer a reusable model: create persistent HUD text, in-world text, icons, and effects once while the player has the ability, store their ids in existing cleanup arrays such as `text_ids`, `effect_ids`, or `icon_ids`, then show/hide/move/update them through reevaluated visibility, position, and string variables.
  - Do not create/destroy persistent HUD text, in-world text, icons, or effects on every ability activation unless there is a measured reason; repeated create/destroy costs Workshop slots and can leak if a cleanup path is missed.
  - Prefer updating existing ability-scoped state or scratch variables over adding new player/global variables. Add a variable only when existing state cannot safely represent the behavior.
  - Use persistent reevaluated HUD or in-world text for stable instructions or status that should remain visible; use transient `smallMessage`/`bigMessage` only for one-shot notifications.
- After any `.opy` edit, compile with:
  - `node out/overpy_cli.js compile -i examples/random-abilities.from_txt.opy -o examples/random-abilities.from_txt.compiled.txt`
