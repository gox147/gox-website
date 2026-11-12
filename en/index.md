---
layout: home
titleTemplate: false
title: Gox — A JavaScript Runtime Built from Scratch in Go
description: "Gox is a JavaScript runtime implemented from scratch in Go: a complete pipeline with its own lexer / parser / bytecode VM, a single binary with zero cgo and zero external dependencies, a built-in software-rasterized GUI rendering layer, support for ES6+ and JSX, and the ability to bundle scripts into standalone executables."
hero:
  name: Gox
  text: A JavaScript Runtime Built from Scratch in Go
  tagline: A complete lexer → parser → bytecode VM pipeline built from the ground up. Single binary, zero cgo, zero external dependencies, with a built-in software-rasterized GUI rendering layer — and your finished JS can be packaged into a standalone executable for direct distribution.
  actions:
    - theme: brand
      text: Get Started in 10 Minutes →
      link: /en/guide/
    - theme: alt
      text: Component Reference
      link: /en/components/
    - theme: alt
      text: API Reference
      link: /en/api/
    - theme: alt
      text: GitHub Source
      link: https://github.com/14752222/Gox
  image:
    src: /logo-animated.svg
    alt: Gox — a JavaScript runtime built from scratch in Go
features:
  - icon: ⚙️
    title: Complete Compilation Pipeline
    details: In-house lexer / parser / compiler / bytecode VM with 109 opcodes and fixed 3-byte instruction encoding. Not a V8 binding, not JS-to-Go — every layer can be read and tested on its own.
    link: /en/api/
    linkText: See the runtime model
  - icon: ✨
    title: ES6+ Subset + JSX
    details: Closures, class, async/await, destructuring, template literals, optional chaining, nullish coalescing, ES modules; JSX is lowered to h() calls at compile time, with Temporal replacing Date.
    link: /en/guide/language
    linkText: Language basics
  - icon: 🖥️
    title: In-House GUI Rendering Layer
    details: Pure Go software rasterization, flex-style layout + JSX + signal-driven updates, dirty-rectangle partial redraw; window backends for win32 / X11 / cocoa across three platforms, with 50 built-in elements.
    link: /en/components/
    linkText: Component reference
  - icon: 🔌
    title: Host Capability Modules
    details: Node-style fs (sync + async), http client and server, global fetch, path, process — all attached to the global scope, usable without import.
    link: /en/api/host
    linkText: Host APIs
  - icon: 🧭
    title: Routing and Screen Adaptation
    details: gx/router provides route tables, :param matching, three-level guards, history stack, lazy loading, and multi-window scoping; gx/screen provides display enumeration and fold posture, with automatic dual-pane on half-folded screens.
    link: /en/api/gx
    linkText: Built-in modules
  - icon: 📦
    title: Scaffolding + Single-File Packaging
    details: gox create sets up a runnable project in one command; jsbuild embeds your script into a generated Go project compiled into a single-file program, with pure-Go cross-compilation and zero dependencies on the target machine.
    link: /en/guide/package
    linkText: Packaging guide
---

<div class="home-extra">

## Up and Running in 30 Seconds

<div class="terminal">
  <div class="terminal-bar"><i></i><i></i><i></i><span>gox — REPL / run scripts / create projects</span><CopyButton text="npm i -g @goxjs/goxjs" /></div>
  <div class="terminal-body"><span class="prompt">$</span> npm i -g @goxjs/goxjs<br><span class="prompt">$</span> gox<br>Gox REPL (ES6 subset)<br>Type :exit to quit, :help for help<br>&nbsp;<br><span class="prompt">&gt;</span> let x = 10<br><span class="prompt">&gt;</span> let y = 20<br><span class="prompt">&gt;</span> x + y<br><span class="out">&nbsp;&nbsp;30</span><br><span class="prompt">&gt;</span> [1, 2, 3].map(v =&gt; v * 2)<br><span class="out">&nbsp;&nbsp;[2, 4, 6]</span><br><span class="prompt">&gt;</span> <span class="caret"></span></div>
</div>

You can also skip the install: `npx goxjs app.js`; or build from source with `go build`. See [Installation and Creating a Project](/en/guide/install) for details.

## What It Actually Is

<div class="position-grid">
  <div class="position-card">
    <h3>What it is</h3>
    <p>A JavaScript runtime written in Go with <strong>everything implemented from scratch, from lexical analysis to the bytecode virtual machine</strong>. Not a binding for V8, and not JS translated into Go.</p>
  </div>
  <div class="position-card">
    <h3>What you can do with it</h3>
    <p>Run ES6+ scripts, write CLI tools, build desktop apps with windows, <strong>package scripts into a single executable</strong> to share with others, and use it to learn how compilers and VMs are built.</p>
  </div>
  <div class="position-card">
    <h3>What it is not</h3>
    <p>It does not aim to replace the Node ecosystem in production: no npm compatibility, no <code>require</code>, no JIT, and no DOM. Treat it as an independent small language with a built-in UI framework.</p>
  </div>
</div>

## The Compilation Pipeline

<p class="section-sub">One clear pipeline, where every layer can be read and tested on its own.</p>

<div class="pipeline">
  <div class="pipe-node"><b>.js source</b><span>UTF-8 text</span></div>
  <div class="pipe-arrow">→</div>
  <div class="pipe-node"><b>lexer</b><span>Tokenization → token stream</span></div>
  <div class="pipe-arrow">→</div>
  <div class="pipe-node"><b>parser</b><span>Parsing → AST</span></div>
  <div class="pipe-arrow">→</div>
  <div class="pipe-node"><b>compiler</b><span>Symbol table + bytecode generation</span></div>
  <div class="pipe-arrow">→</div>
  <div class="pipe-node"><b>vm</b><span>Stack-frame execution + event loop</span></div>
</div>

Key design decisions: GC-free explicit memory management (with dedicated handling for circular references), a single-threaded VM with cross-goroutine scheduling (network callbacks are re-posted, so JS is always single-threaded and lock-free), and fixed-length instruction encoding (decoding is a simple fetch).

## A Desktop GUI App in 16 Lines

```jsx
import { createSignal } from "gx/solid";
import { h, render } from "gx/gfx";

const [count, setCount] = createSignal(0);

render(
  <window title="Counter" width={400} height={300}>
    <column gap={8} padding={16}>
      <text font={20}>count: {count()}</text>
      <button onClick={() => setCount(c => c + 1)}>+1</button>
    </column>
  </window>
);
```

```bash
gox counter.js          # Run directly — opens a 400x300 window
go run ./packager counter.js --gui -o counter.exe   # Package into a standalone GUI app
```

Passing a **function** as a prop makes it a reactive binding (`value={() => x()}`), and `{count()}` inside text is already live (wrapped into a reactive child at parse time, Solid semantics): signal update → dependent nodes marked dirty → dirty rectangles merged so only affected regions are redrawn. See the [GUI desktop app tutorial](/en/guide/gui) for more.

## Capability Overview

<div class="cap-table-wrap">

| Area | What's covered | Where to look |
| --- | --- | --- |
| Language | ES6+ subset: `let`/`const`, arrow functions, class, `async`/`await`, destructuring, template literals, optional chaining, ES modules, JSX | [Tutorial · Language Basics](/en/guide/language) |
| Standard library | Object / Array / String / Map / Set / Proxy / Promise / TypedArray / Temporal … | [API · Standard Built-ins](/en/api/builtins) |
| Host modules (no import) | `console` / `fs` / `path` / `process` / `http` / `fetch` | [API · Host Modules](/en/api/host) |
| Reactivity | GetX-style `obs` / `computed`, SolidJS-style `gx/solid` signals | [Tutorial · Reactivity](/en/guide/reactive) |
| GUI | 50 built-in elements + JSX + dirty-rectangle partial redraw, routing, multi-window | [Component Reference](/en/components/) |
| Platforms | Desktop Windows / Linux / macOS (win32 / X11 / cocoa) and mobile Android / iOS / HarmonyOS — platform shell projects driving the same rendering core, with one JS UI across all of them | [Tutorial · GUI Apps](/en/guide/gui) |
| Built-in modules (import required) | `gx/solid` · `gx/gfx` · `gx/view` · `gx/router` · `gx/screen` · `gx/dialog` · `gx/storage` · `gx/dev` plus the six native-capability modules | [API · Built-in Modules](/en/api/gx) |
| Toolchain | REPL, `gox create` scaffolding, `gox dev` hot reload, jsbuild packaging, prebuilt npm binaries for five platforms | [Tutorial · Installation](/en/guide/install) |
| Measured data | Throughput vs goja / V8, UI frame-rate and GC-pause verdicts, test262 compliance, third-party compatibility matrix — methodology and thresholds fully published | [Tutorial · Performance](/en/guide/performance) |

</div>

## Versions and Current Status

Current version **v0.21.0**; see [GitHub Releases](https://github.com/14752222/Gox/releases) for the full changelog.

| Version | Highlights |
| --- | --- |
| 0.21.0 | test262 C-4 batch sweep — three root causes, each unlocking a cluster: (1) member calls with spread, `obj.m(...args)` / `obj[k](...args)`, fell into the generic bare-call path and lost the receiver to `undefined`; both member-call branches now route through `OP_CALL_METHOD_SPREAD` (arguments-object family +9, Temporal subclassing-ignored family +25 — the largest single root cause this batch); (2) the parser treated out-of-range float literals such as `1E+309` as syntax errors (`ParseFloat`'s `ErrRange` misread as a parse error), and now yields `±Infinity` per spec (indexOf / lastIndexOf integer-limit family); (3) `stdlib/array`: `toSpliced` panicked on the `args[2:]` slice when fewer than two arguments were passed (crash level, 4 cases), `copyWithin` skipped `ToInteger` on the empty-array early return and ignored abrupt completion from get/set/delete inside the copy loop, and `keys`/`values`/`entries` gained the generic `CreateArrayIterator` path (any object, including resizable TypedArrays, as receiver; `length` re-read on every `next`). A/B on the same test262 snapshot (128 shards × 32 concurrency): language **86.3125% → 86.3545%** (20570→20580, +10), built-ins **75.3992% → 75.6590%** (17991→18053, +62), all **80.8525% → 81.0035%** (38561→38633, +72), zero regressions case-by-case |
| 0.20.0 | Faster global access (T3-4, second batch) — two VM optimisations stack up: (1) a versioned `globalThis` cache removes the `Environment.Get("globalThis")` string lookup from every sloppy-mode bare call (pprof showed that path at ~14% CPU); (2) a store-through global inline cache, so a `STORE_GLOBAL` no longer invalidates every following read of the same name and hot top-level loops like `t = add(t, i)` stop refilling the cache each iteration. Local A/B on `fib28`: median **176ms → 155ms (-12.0%)**, ratio vs goja 1.38× → 1.21× (pure-interpreter basis; CI runner re-measurement is authoritative). Also closes the test262 long-tail attribution: `--top 500 --depth 3` yields 438 clusters over 5869 failures, and the surface shifts from cluster-dominated to a flat long tail (Top1 1708 cases / 11.15% → 256 / 4.36%), split into semantic deviation 4372 (74.5%) and feature-not-implemented 1483 (25.3%). After deducting out-of-scope areas (Intl / Atomics / SharedArrayBuffer / BigInt, 495 cases) the reachable ceiling is **97.93%**, with heuristic estimates of ≈28 person-days for 80%, ≈98 for 90% and ≈170 for 95%. All three compliance views show zero drift: language **86.3125%** / built-ins **75.4034%** / all **80.8546%**; harness dependencies 369 → 0, crashes 52 → 6, false positives 20 → 8. Tooling: bench and test262 now gate PR merges (`fbcf4d6`) |
| 0.19.0 | First wave of globals lazy-materialisation for cold start — `Temporal` (~12%) and the TypedArray family (~11%) of the `SetupGlobals` profile were two object trees that minimal scripts almost never touch, yet were built in full on every start. `Binding` gains a lazy flag plus `DeclareLazy`/`materialize`: the name is declared up front (so `BindingNames`/`typeof`/`hasOwnProperty` visibility is bit-for-bit identical to eager declaration) and the factory only runs on the first `Get`; the five reflective write paths materialise first, so descriptor semantics are unchanged; the TypedArray family shares one factory across its names and back-fills `length`, the prototype chain and `@@species` on materialisation. A/B (250×2 interleaved): `startup_idle` median **-10.4%**, min -12.6%, RSS -4.3%; the early `3000×EvalFileVM` probe went 2.31s → 1.16s; fib28 / timers10k within noise, no regression; test262 language 86.3125% bit-for-bit unchanged. Foldables: `apps/foldable-demo` collapses into one window + posture bar + four tabs — S1 driven by the scene's own width signal for real reflow, S2 fold ruler A/B (`avoidReserved="all"`), S3 `isTabletop(posture, hinge)` composite predicate, S4 `screens()`/`screenOf()`/`bounds().displayId` multi-screen sketch, plus a 10-frame 30000ms demo GIF; two kernel defects fixed along the way (`avoidReserved` not re-laying-out after `reportPosture`; stale ghost when a structural slot switches branch). GPU: one `TestBackendTrackReport` per track (nogpu / gpu / cgo) pins the path actually taken, `gpu-track-audit.sh` adds cross-compile spot checks and `gpu-present.yml` a hardware-free fallback run; measurement corrected — the windowed present path has not wired the swapchain yet, offscreen compose + Readback is the real path today |
| 0.18.0 | The test262 C-3 "crash / hang" sweep lands, with one root cause fixing a whole cluster: array indices are now routed by the spec index test (canonical integers 0…2^32-2), so out-of-range stores fall back to ordinary properties and anything past the dense-array ceiling raises an honest `RangeError` instead of materialising 2^32 elements and exhausting memory; `Array.length` writes gain the ToUint32≠ToNumber check; `arraySpeciesCreate` gains the length ceiling check; the `Promise` self-resolution check moves ahead of the pending branch (it was unreachable, so the `resolve-self` family hung forever); iterator helpers (`forEach`/`some`/`every`/`find`/`includes`) switch from eager collection to lazy driving with `IteratorClose` on short-circuit; iterator `next()` / `value` getter throws are no longer swallowed as `(undefined, not-done)`; `JSON.stringify` cycle detection moves from a static `hasCycle` to a recursion path stack, covering cycles built dynamically by `toJSON`/`replacer`; two infinite loops (`unshift` with no args, `replaceAll` on an empty match) are fixed. A/B: hangs **83 → 6**, crashed 0, built-ins **75.08% → 75.40%** (17914 → 17992, +78), all 80.69% → 80.85%, language 86.3125% bit-for-bit unchanged; batch floors raised to language 86.0125, built-ins 75.1034, all 80.5546 |
| 0.17.0 | Closure-free frame `Locals` are now pooled and reused with the frame (`acquireFrame` hands back the backing array and clears it to preserve TDZ semantics; all four escape paths are blocked by a no-closures check, a pending-generator check and a backing-pointer comparison, and pathological frames above 512 slots stay out of the pool) — fib28 heap allocations **−88%**, wall time **418ms → 341ms (−18%)**; cold start's `splitDots` switched from per-character concatenation to `IndexByte` sub-slicing, cutting roughly 40k small allocations per `SetupGlobals` run, startup 10ms → 9ms; the test262 baseline is refreshed against `2b499cc` with language compliance at 86.3%, still above the batch floor |
| 0.16.0 | `ArrayBuffer.prototype.transfer` / `transferToFixedLength` (ES2024) land — detached-transfer semantics with TypedArray view sync; test262 metric reconciliation: `docs/test262-gate.md` is now the single authoritative definition, batch floors (language 85% / built-ins 50% / all 80%) are enforced as a CI gate (`test262-gate-floors.json` + hardened `check-compliance.py`), every previously unregistered harness is registered and `skipped` driven to zero; freshly built run: language 86.3%, built-ins 75.1%, all 80.7% |
| 0.15.34 | New `apps/devtools/` interactive GUI debugging panel (Inspector v2, pure script, zero kernel changes): expandable/selectable element tree with multi-window switcher, node props & layout box queried by path, console retention with level filtering, a stateful `devEval` REPL (100-entry history), and a `devSnapshot` perf summary line; added to the headless apps smoke suite |
| 0.15.30 ~ 0.15.33 | Engine: test262 batches 23–26 land (RegExp `unicodeSets` `v` flag, closure outer bindings read through a live binding cell, `Number.prototype.toString` shortest round-trip in any radix, `Math.f16round` (ES2024), `Error.prototype` chain wiring with per-instance `name`/`message` override semantics), built-ins compliance 73.9% → 75.0%. Tooling: `release.yml` de-duplication upgraded to a package-level `versions` cross-check (a flaky single `npm view` can no longer be misread as "not published"); the `pages.yml` version gate now keeps the site's own two displays (`config.mts` ↔ homepage) as a hard gate while downgrading npm drift to a warning; the `@goxjs/goxjs` dependency in `gox create` scaffolding moved from a pinned `^0.5.0` to `latest`, so new projects track the newest npm release |
| 0.15.1 ~ 0.15.29 | Patch series: test262 batches 11–22 land continuously (Map/Set iterator `next`, `Promise.allKeyed` / `allSettledKeyed`, thenable adoption, Date setter coercion fixes — built-ins compliance 71.1% → 73.9%); the mobile `libgox` dual-ABI NDK rebuild from scratch and density render scaling; engine/platform-shell paired release gates aligned (`engineVersionRange` 0.15.x) |
| 0.15.0 | **test262 `language` compliance raised to 97%** (up another 11.4pp from 85.6% in 0.14.x); `gfx/hostbridge` converges the three-platform host protocol so host-contract tests run on the desktop; two structural defects in foldable regression fixed (APK missing x86_64 ABI, skip gate never effective); three-platform regression matrix made probe-based, removing hardcoded runner assumptions; a batch of `parser` / `object` / `gfx` fixes (props no longer null, dual-channel children, regex `\u` escapes, undefined keys treated as absent) |
| 0.14.1 | X11 backend fixes (PutImage row-band splitting, event type-switch value types); permission semantics aligned across all three platforms (spec pinned + exhaustive mocks); foldable adaptation landed: foldable_demo sample, 20-round lifecycle regression, adaptation guide; README hero example switched to an adaptive one/two-column list page with a new English README.en.md; three-platform regression matrix in CI |
| 0.14.0 | JSX interpolation children are reactive (Solid semantics): `<text>count: { count()}</text>` is wrapped into a function child at parse time — no more handwritten `{() => …}` closures; constants, explicit functions and bare identifiers stay as-is; `gox lint`'s `snapshot-child` now targets handwritten `h()` snapshots |
| 0.13.0 | Prism design system (S0–S8): a full visual redesign of the base widgets — layered design tokens (semantic / component / prism presets), control refinements (capsule slider track with a larger knob, 36px field rows, adaptive table column widths, real shadows and an animation heartbeat for drawers/dialogs), feedback components (animated ring spinner, colour-interpolated skeletons, reduced-motion support), touch-mode hit-area inflation and unified density constants |
| 0.12.0 | Coverage-based antialiasing in the raster pipeline: diagonal lines, arcs and rings are no longer hard-edged (`fillRingAA` / `fillDiscAA` and other AA primitives) |
| 0.11.0 | Media tags that actually play: `<video>` / `<audio>` ship with `gfx/softmedia`, a pure-Go software media backend (GIF / MJPEG video, WAV + PulseAudio audio) enabled in the default Linux build; `<audio>` is a new tag and `<video>` gained `fit`, with the honest-downgrade path unchanged elsewhere; `gx/datav` dashboard component library; GPU presentation backend prototype (`-tags gpu`, experimental); `for...in` destructuring bindings; a foldable-screen demo app |
| 0.10.0 | Foldable-screen adaptation: `posture` / `hinge` / `regions` / `splitRatio` / `hingeOrientation` readouts in `gx/screen`, `reservedRegions` / `hasFold` / `layoutMode` / `widthClass` in `gx/viewport`, opt-in `avoidReserved` hinge avoidance; Android / iOS / HarmonyOS hosts all report fold state; `scroll vlist` virtualised long lists; three breakpoints (compact / medium / expanded) |
| 0.9.0 | `table` / `tree` / `list-item` data-display components, `tabs`, and `tooltip`; design tokens and a theme system (32 colour tokens, dark preset, runtime switching); `gx/update` v1.1 auto-update (streaming download / resume / progress callbacks / `pre` channel); `gox create --ts` TypeScript / TSX template; `var` declarations and class expressions; runtime errors carry source-frame locations |
| 0.8.0 | Test262 compliance pipeline (scheduled `language` suite runs, badge auto-writeback); `gox vs node` performance benchmark harness; stress and frame-budget tests (10k-timer storm / concurrent fetch / 489-node render budget); 3 sample apps (TODO / dashboard / Snake); computed property names; draggable scrollbars and horizontal scrolling |
| 0.7.0 | `gox cert` to generate signing certificates for all platforms in one step, `gox build android` auto-wires signing, `gox create` generates a certs/ directory; `gox build macos --arch universal` (merged amd64+arm64); ordered multi-select photo picking on iOS and multi-file preview in media.preview |
| 0.6.0 | macOS window backend cocoa (desktop GUI now covers all three platforms); `gox dev` hot reload, `gox.json` project config, unified `gox build` entry point |
| 0.5.0 | Six built-in native-capability modules (gx/device · gx/app · gx/geo · gx/media · gx/permission · gx/viewport) |
| 0.4.0 | `gox create` scaffolding; routing `gx/router` and screen `gx/screen` become built-in modules |

::: info Known Gaps
Rich text (inline mixed styling) is not yet wrapped (virtualized long lists landed as [`<scroll vlist>`](/en/components/layout#scroll)) — the table / tree / tooltip / icon / spinner / tabs data-display and feedback widgets all landed in 0.9.0; parts of the native-capability layer that depend on real devices (camera / location / photo library / permissions) honestly report `unsupported` on desktop; on mobile they are provided by the platform shell projects (Android verified on emulator, iOS pending, HarmonyOS still stubbed). See [Limitations and Common Pitfalls](/en/components/limits) for the itemized list.
:::

</div>
