<!-- caveman-begin -->
Respond terse like smart caveman. All technical substance stay. Only fluff die.

Rules:
- Answer first: Answer, then reason, then next step.
- Kill ceremony: No greeting, hedging, pleasantries, recap, or closer.
- Short word: "fix" not "implement a solution for".
- Articles optional, meaning never: Drop a/an/the when the sentence still reads in one pass.
- One idea per sentence: ASD-STE100 is the floor: 20 words max, active voice, imperative for instructions, one term per thing, pronoun only with an obvious referent.
- Payload verbatim: Code blocks unchanged.
- Tool runs: bounded status: No text between routine calls.
- User's language: Compress the style, not the language.
- Never perform caveman: No "caveman mode on", no "me think", no "Caveman:" prefix, no normal answer plus caveman copy.

Switch: /caveman (default), /ultracave (fragments, each fact once), /megacave (Classical Chinese 文言文)
Stop: "stop caveman" or "normal mode"

Auto-Clarity: plain prose for security warnings, irreversible actions, step order a fragment could scramble, user confused. Resume after.

Boundaries: code, comments, commits, PRs, docs written normal.
Floor: code, commands, paths, numbers and error strings verbatim; never drop not/never/no/only.
<!-- caveman-end -->

# FishTools CEP AI Agent Guidelines

## 1. System Architecture & Component Map
- `client/`: Frontend CEP panel interface (HTML5, CSS3, ES6 modules).
  - `client/index.html`: Main extension panel window.
  - `client/js/modules/`: Decoupled UI modules (easing curves, conversion controls, auto save UI).
  - `client/js/modules/modal.js`: Universal popup and dialog controller.
- `host/`: ExtendScript (`.jsx`) host engine running inside Adobe After Effects:
  - Communicates with After Effects DOM via `CSInterface.evalScript`.
  - Handles keyframe interpolation, project save automation, composition cropping, and expression baking.
- `CSXS/manifest.xml`: CEP extension bundle manifest configuring `com.cutefish.tools.panel`.
- `Installer/`:
  - `Installer/Windows/`: Inno Setup script (`OpenFishTools_Setup.iss`) compiling `OpenFishTools_Setup.exe`.
  - `Installer/Mac/`: Shell builder (`build_pkg.sh`) producing `OpenFishTools.pkg`.
- `package.json`: Single source of truth for repository version.
- `changelog.md`: Changelog following Keep a Changelog standard.

## 2. ExtendScript & Host Safety Rules
- **Non-blocking Execution**: ExtendScript helper functions in `host/` must catch exceptions internally and fail gracefully without crashing or freezing the After Effects UI thread.
- **Timeline Boundary Guards**: Apply `inPoint` / `outPoint` timeline boundary guards on all dynamic expression generators.
- **Machine-Wide Target Directory**: Extension installations must strictly target machine-wide CEP folders:
  - Windows: `C:\Program Files (x86)\Common Files\Adobe\CEP\extensions\OpenFishTools`
  - macOS: `/Library/Application Support/Adobe/CEP/extensions/OpenFishTools`
  - Never install to user AppData.

## 3. Strict File Manipulation Tooling (NO SCRIPT-BASED EDITS)
- **STRICTLY FORBIDDEN**: Using Python scripts, Node.js scripts, `sed`, `awk`, `echo >`, `cat << 'EOF'`, or shell redirection to edit or generate code files.
- **MANDATORY**: All file creations and code modifications MUST strictly use the agent's native tool calls (`replace_file_content` or `write_to_file`).

## 4. Error Investigation & Diagnostic Protocol
When debugging CEP panel or ExtendScript issues:
1. **Enable Debug Mode**: Ensure `PlayerDebugMode` is set to `1` in OS registry/plist for CEP extensions.
2. **Inspect Chromium Console**: Open CEP remote debugger via `.debug` port (e.g. `http://localhost:8088`).
3. **Safe Evaluation Logging**: Wrap ExtendScript `evalScript` calls with structured logging and try/catch handlers.

## 5. Versioning & SSOT
- **Single Source of Truth**: Repository version is defined in `package.json`.
- **Syncing Versions**: When updating version, keep `package.json`, `CSXS/manifest.xml`, installer scripts, and `changelog.md` aligned.
- **NO Hardcoded Fallbacks**: Never hardcode fallback version literals in library files.

## 6. Strict Git Safety & Working Tree Protection
- **Zero Silent Git Changes**: STRICTLY FORBIDDEN to run `git checkout`, `git restore`, `git reset`, `git clean`, `git pull`, `git switch`, or any Git command that alters or discards local changes without explicit user consent.
- **Preserve Uncommitted Work**: Always respect and preserve active uncommitted edits and untracked files in the working directory.
- **Zero Emojis**: Git commit messages, comments, and documentation must never contain emojis.
