---
title: Changelog
description: Every Gox release, one card per version — newest first, with release dates, tags and links to GitHub Releases.
---

# Changelog

<div class="docs-version-banner" role="note">
  <span>These docs describe <b>v0.15.0</b>; the current release is <b>v0.28.0</b>.</span>
  <a href="https://github.com/14752222/Gox/releases/latest">Latest release</a>
  <a href="../release/#rel-highlights">What changed in 0.28.0</a>
</div>

Every Gox release, **newest first**, one card per version. The card header carries the version, release date and tags;
the first line is a one-sentence summary, followed by the concrete changes as a short list.

Only **shipped versions** appear here. For the current release, see [Latest Release](/en/release/).

::: tip How to read it
- **Dates** come from GitHub Releases (Asia/Shanghai). Releases up to 2026-11-06 shipped without a body, so their dates follow the release cadence.
- **Tags** are grouped by this site; `cadence` means the version number moved and engine code did not change.
- Numbered ①②③ are **parallel change clusters** in one release, not sequential steps. Link to a single release via its card heading (`#v0-28-0`).
:::

## Version index

<ul class="rel-index">
  <li><a href="./changelog#v0-28-0">0.28.0</a><span>2026-11-20</span></li>
  <li><a href="./changelog#v0-27-0">0.27.0</a><span>2026-11-19</span></li>
  <li><a href="./changelog#v0-26-0">0.26.0</a><span>2026-11-18</span></li>
  <li><a href="./changelog#v0-25-0">0.25.0</a><span>2026-11-16</span></li>
  <li><a href="./changelog#v0-24-0">0.24.0</a><span>2026-11-15</span></li>
  <li><a href="./changelog#v0-23-0">0.23.0</a><span>2026-11-13</span></li>
  <li><a href="./changelog#v0-22-0">0.22.0</a><span>2026-11-12</span></li>
  <li><a href="./changelog#v0-21-0">0.21.0</a><span>2026-11-11</span></li>
  <li><a href="./changelog#v0-20-0">0.20.0</a><span>2026-11-10</span></li>
  <li><a href="./changelog#v0-19-0">0.19.0</a><span>2026-11-08</span></li>
  <li><a href="./changelog#v0-18-0">0.18.0</a><span>2026-11-06</span></li>
  <li><a href="./changelog#v0-17-0">0.17.0</a><span>2026-11-04</span></li>
  <li><a href="./changelog#v0-16-0">0.16.0</a><span>2026-11-02</span></li>
  <li><a href="./changelog#v0-15-34">0.15.34</a><span>2026-10-30</span></li>
  <li><a href="./changelog#v0-15-30">0.15.30 ~ 0.15.33</a><span>—</span></li>
  <li><a href="./changelog#v0-15-18">0.15.18 ~ 0.15.29</a><span>—</span></li>
  <li><a href="./changelog#v0-15-1">0.15.1 ~ 0.15.17</a><span>—</span></li>
  <li><a href="./changelog#v0-15-0">0.15.0</a><span>—</span></li>
  <li><a href="./changelog#v0-14-1">0.14.1</a><span>—</span></li>
  <li><a href="./changelog#v0-14-0">0.14.0</a><span>—</span></li>
  <li><a href="./changelog#v0-13-0">0.13.0</a><span>—</span></li>
  <li><a href="./changelog#v0-12-0">0.12.0</a><span>—</span></li>
  <li><a href="./changelog#v0-11-0">0.11.0</a><span>—</span></li>
  <li><a href="./changelog#v0-10-0">0.10.0</a><span>—</span></li>
  <li><a href="./changelog#v0-9-0">0.9.0</a><span>—</span></li>
  <li><a href="./changelog#v0-8-0">0.8.0</a><span>—</span></li>
  <li><a href="./changelog#v0-7-0">0.7.0</a><span>—</span></li>
  <li><a href="./changelog#v0-6-0">0.6.0</a><span>—</span></li>
  <li><a href="./changelog#v0-5-0">0.5.0</a><span>—</span></li>
  <li><a href="./changelog#v0-4-0">0.4.0</a><span>—</span></li>
</ul>

## All versions

<div class="rel-entry" id="v0-28-0">
<h2>0.28.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-20</span><span class="rel-tag">test262</span><span class="rel-tag">performance</span><span class="rel-tag">tooling</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.28.0">Release notes</a></div>
<p class="rel-summary">Promise interleaving rewrite, first-frame startup work, and a performance A/B contract gate — <strong>23 commits</strong> on <code>main</code> since v0.27.0. (1) <strong>test262 conformance</strong>: built-ins <strong>81.7% to 82.2%</strong> (+128 cases), language <strong>87.0%</strong>, overall <strong>84.3% to 84.6%</strong>, <strong>no regressions</strong>. [B1][rwjnvX] rewrites the Promise aggregators at the root: <code>PerformPromiseAll</code> / <code>PerformPromiseAllSettled</code> / <code>PerformPromiseAny</code> / <code>PerformPromiseRace</code> now follow the spec's interleaving literally — one <code>Call</code> to <code>then</code> per element, each taking its own <code>resolveElement</code> closure — instead of the shared batch-collection path they all used to run through. (2) <strong>First-frame startup</strong>: the first GC no longer sits on the window-creation round trip (first frame -1.9ms / -22%, published figure -1.2ms / -6.7%), and built-in <code>length</code> values no longer build a map entry each (interpreter init -23.7%, reproducible in 10 of 10 runs, hot-loop ceiling intact); x11 <strong>connection prewarm</strong> connects to the X server before starting font prefetch (first frame -0.46 to -0.82ms / 4.7 to 8.2%). A batch that removed a linear scan from key registration was <strong>refuted and withdrawn</strong> after 20 rounds (-0.13%, under the threshold) — the negative result is kept on record. (3) <strong>Measurement discipline</strong>: a same-host paired A/B tool <code>perf-ab.sh</code> (alternating sampling, commit/dirty identity, threshold gate) and an <strong>allocation budget gate</strong> (<code>fib28</code> 403,269 allocations / <code>SetupGlobals</code> 2,102, wired into CI on three platforms); the performance A/B contract <code>abcontract</code> is now enforced in commit-msg and CI, so performance commits must ship paired data. (4) <strong>GPU</strong>: the delayed SIGSEGV in the full <code>-tags gpu</code> gfx run was traced to the wgpu <code>RequestAdapter</code> probe (goffi dlopen of the real Vulkan loader, which spawns its own native thread and crashes around case 150); the probe is now explicit opt-in via <code>GOX_GPU_PROBE=1</code> and the full run (415.6s) is green. The <code>gpu-present</code> gate was hardened again (executable-bit guard, component A/B in its own step, retry only on crash) and <code>gpu-track-audit.sh</code> had its executable bit restored a third time. <code>gox create</code> templates still write <code>@goxjs/goxjs: latest</code></p>
</div>


<div class="rel-entry" id="v0-27-0">
<h2>0.27.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-19</span><span class="rel-tag">test262</span><span class="rel-tag">performance</span><span class="rel-tag">GPU</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.27.0">Release notes</a></div>
<p class="rel-summary">Consecutive built-ins batches, four cold-start font-path optimisations, and GPU native handles on all three backends — <strong>32 commits</strong> on <code>main</code> since v0.26.0. (1) <strong>test262 conformance</strong>: built-ins <strong>78.6% to 81.7%</strong>, language <strong>87.0%</strong>, overall <strong>82.8% to 84.3%</strong>, with five batches adding +48/+92/+32/+95/+55 cases and <strong>zero regressions</strong> throughout — T5 second wave + B2 (Proxy static invariants, <code>[[GetOwnProperty]]</code> GetMethod, nested forwarding, String wrapper key enumeration), B5+B6 (constructor <code>.prototype</code> and constant-property descriptor normalisation, <code>Function.prototype</code> method materialisation, <code>Date</code> set-family read order), B7 (RegExp built-in <code>length</code> and <code>lastIndex</code> semantics; <code>@@match</code> / <code>@@matchAll</code> / <code>@@search</code> / <code>@@replace</code> with generalised receivers and strict <code>Set</code> end to end), B4+B3 (Iterator helper closing semantics: single <code>return</code> forwarding, finalisation, validate-before-close; <code>Object.prototype</code> Annex B legacy accessors), T6+T7 (one root cause across the abstract-operation validation family), and T5+B8 finishing (Proxy Symbol-key traps pass the original value, revoked semantics aligned, <code>in</code> walks the prototype chain with <code>has</code>; constructor identity fixes — <code>NativeError</code> constructors get <code>[[Prototype]]</code>=%Error%, <code>Map</code>/<code>Set</code>/<code>WeakMap</code>/<code>WeakSet</code>/<code>ArrayBuffer</code>/TypedArray <code>prototype.constructor</code> back-references, <code>Number.parseInt</code> is the same function as the global, <code>Set.keys</code> is <code>values</code>, TypedArray <code>toString</code> shares one function, <code>getPrototypeOf</code> boxes with ToObject). (2) <strong>Cold start</strong>: fonts are read <strong>on demand</strong> (first frame 24 to 14ms, RSS -19MB); face detection and the family index no longer build tables (first frame -17.4%, family index -82.1%); picking the default font no longer reads rejected candidates in full (first frame -13.6%, peak RSS -21.5MB); <strong>background prefetch</strong> of the default font hides 1.78ms behind window creation and tree building (first frame -0.7 to 0.95ms, faster in 45 of 48 rounds). The font cache fingerprint is now a head-3K + tail-1K composite, so "same length, same mtime" replacements on Windows are still detected. (3) <strong>Runtime</strong>: <code>OP_CALL</code> takes a stack-passing fast path for closure calls, <code>fib28</code> <strong>-3.5%</strong> (the executed-instruction denominator is now reproducible too). (4) <strong>GPU</strong>: cocoa two-stage <code>CAMetalLayer</code> wiring is complete (all native-handle exposure prerequisites in place on three platforms), x11 <code>Xlib</code> dlopen moved to goffi (fixing the linux link in the zero-cgo cross matrix), x11 swapchain end-to-end lit test plus a windowed-path BGRA format fix, and the darwin cross-compile clash fixed with goffi's official nofakecgo switch — <strong>the five-platform matrix is fully green</strong>. (5) <strong>Measurement</strong>: two harness costs were dropped from the first-frame window — a fresh X server per sample from <code>xvfb-run</code> (41ms) and a <code>date</code> fork (0.9ms): 41ms to <strong>9ms</strong> on the same host, exec-to-first-frame <strong>7.37ms</strong>; the result JSON now requires a <code>harness</code> block and a gate fails if anyone reverts to the <code>date</code> version. (6) <strong>Process</strong>: the <code>gpu-track-audit.sh</code> executable bit (100755) was restored twice (a Git Data API rebuild wrote 100644 and CI exited 126 forever), and two <code>gpu-present</code> visual-gate failures were fixed (a pipe swallowing the exit code, and a blank-guard false positive on font-poor runners). <code>gox create</code> templates still write <code>@goxjs/goxjs: latest</code></p>
</div>


<div class="rel-entry" id="v0-26-0">
<h2>0.26.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-18</span><span class="rel-tag">test262</span><span class="rel-tag">performance</span><span class="rel-tag">GPU</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.26.0">Release notes</a></div>
<p class="rel-summary">test262 T1-T5 root-cause batches, a third cold-start/performance round, and the GPU on-screen path — <strong>30 commits</strong> on <code>main</code> since v0.25.0. (1) <strong>test262 conformance</strong>: T1 (register the missing <code>EvalError</code> / <code>encodeURI</code> global family), T2 (fall back to the regexp2 engine when the native compiler fails; named groups and subclass overrides, modifier-group dotAll scoping and flag removal, non-<code>u</code> dot-code-unit materialisation), T3 (TypedArray family prototype wiring plus immutable ArrayBuffer), T4+T5 (<code>IsConstructor</code> / <code>IsCallable</code> validation gaps and Proxy trap <code>GetMethod</code> dispatch), plus the C-4 batch fixing <code>String.prototype</code> protocol dispatch with abrupt argument propagation, and direct <code>eval</code> early errors (<code>var arguments</code> is a <code>SyntaxError</code> outside a simple parameter list). Every batch was A/B checked with <strong>zero regressions</strong>. Conformance is now <strong>82.8%</strong> overall and <strong>78.6%</strong> for built-ins. (2) <strong>Cold start</strong>: concurrent family-index construction 41.3ms to 13.8ms (2.99x), directory scanning no longer pre-reads font bytes (first font use 51.8 to 0.7ms), two duplicate disk reads removed from the font stack (first frame -10.3%, first font use -44%), and built-in <code>length</code> application moved to a zero-allocation path (549 fewer heap allocations per init); the gate now uses a self-calibrating ratio so 2-core runners stop producing false reds. (3) <strong>Runtime</strong>: booleans use a process-wide singleton (one less boxing per <code>fib28</code> iteration, -11%). (4) <strong>GPU</strong>: the three hard prerequisites of path A landed — real swapchain presentation, the optional native-handle interface, and an <code>Xlib</code> <code>Display*</code> dlopen approach via purego with zero cgo; added a 26-component CPU-vs-GPU pixel-level A/B visual gate wired into CI, plus an offline rasterisation feasibility probe (glyph atlas, draw-call census, SDF pixel A/B). (5) <strong>Process</strong>: a pre-work guard rejects a stale or dirty tree, and externally published performance numbers are generated from a single golden source and gated in PRs. Projects generated by <code>gox create</code> keep <code>@goxjs/goxjs: latest</code> in <code>package.json</code> so they follow the npm dist-tag instead of pinning a version</p>
</div>


<div class="rel-entry" id="v0-25-0">
<h2>0.25.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-16</span><span class="rel-tag">tooling</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.25.0">Release notes</a></div>
<p class="rel-summary">Cadence release (version bump) plus a CI gate fix — both commits reaching <code>main</code> concern the <code>gpu-present</code> pipeline: <code>f6c64d3</code> adds a skip guard <code>if: vars.GPU_HARDWARE_RUNNER == 'true'</code> to the <code>hardware</code> (trusted-basis) job in <code>gpu-present.yml</code>. Previously the only guard was the <code>runs-on: [self-hosted, gpu-hardware]</code> label, so with no such runner in the repo the job sat in <code>queued</code> until the 30-minute timeout turned it red (hit for real on the 2026-11-15 first run); it is now opt-in through a repository variable and skips by default. <code>99cce03</code> records the 11-15 re-run audit in <code>docs/gpu-track-audit.md</code> — all three track outputs match the 11-08 baseline item by item (<code>nogpu=none</code> / <code>wgpu=software</code> fallback / <code>cgo=none</code>), <code>go test ./gfx/gpu</code> and <code>go test -tags gpu ./gfx/gpu</code> both pass, the <code>--xcompile</code> matrix is ok for windows/amd64 and linux/arm64, and the darwin/arm64 fakecgo symbol clash plus the js/wasm build-constraint exclusion stand as before. No engine or runtime code changed: the binaries are identical to <code>0.24.0</code> apart from the version string printed by <code>gox version</code>. The main npm package and the four mobile platform sub-packages move to <code>0.25.0</code> in lockstep, and the <code>gox create</code> templates still depend on <code>latest</code>. The test262 C-4 batch (<code>String.prototype</code> protocol dispatch + abrupt argument propagation) is still parked on <code>nightly/c4-20261113</code> (<strong>fourth release in a row with no CI record</strong>) and has not passed the gate into <code>main</code>, so it is not part of this release (version bump only).</p>
</div>


<div class="rel-entry" id="v0-24-0">
<h2>0.24.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-15</span><span class="rel-tag">tooling</span><span class="rel-tag">performance</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.24.0">Release notes</a></div>
<p class="rel-summary">Cadence release (version bump) plus the performance story going public — the only commit reaching <code>main</code> is <code>8656d39</code> ([T3-7] measurement basis laid down): <code>docs/performance.md</code> gains the 11-14 local + CI double-run archive (<code>bench-20261114-122312</code> / <code>122404</code> / <code>perf-stress-20261114-122532</code>), and the "interpreter performance on par with goja" acceptance item <strong>turns green for the first time</strong> — <code>fib28</code> pure-compute gox/goja = <strong>1.22×</strong> (247 / 203 ms on the CI runner), finally inside the ×1.25 threshold of §3.1 (history: 2.39× → 1.7× → 1.32× → 1.22×). The performance tables in <code>README.md</code> / <code>README.en.md</code> move off the stale 10-28 baseline to the 11-14 CI four-stack snapshot, the verdict becomes "pure compute on par with goja", and every bun / node comparison carries a "pure interpreter vs JIT" disclaimer. The 3× red line against node (raw CI basis 247/36 ≈ <strong>6.9×</strong>) is <strong>still not met</strong> — the docs say so plainly, noting that startup noise dominates and the red-line basis needs renegotiation. The engine binaries are identical to <code>0.23.0</code> apart from the version string printed by <code>gox version</code>; the main npm package and the four mobile platform sub-packages move to <code>0.24.0</code> in lockstep, and the <code>gox create</code> templates still depend on <code>latest</code>. The test262 C-4 batch from the 11-13 nightly run (<code>String.prototype</code> protocol dispatch + abrupt argument propagation) remains on <code>nightly/c4-20261113</code> (still no CI record on that branch) and has not passed the gate into <code>main</code>, so it is not part of this release (version bump only).</p>
</div>


<div class="rel-entry" id="v0-23-0">
<h2>0.23.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-13</span><span class="rel-tag">cadence</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.23.0">Release notes</a></div>
<p class="rel-summary">Cadence release (version bump only) — <code>main</code> carries no new feature or fix commits since <code>0.22.0</code>, so the binaries shipped here are identical to <code>0.22.0</code> apart from the version string printed by <code>gox version</code>; the main npm package and the four mobile platform sub-packages move to <code>0.23.0</code> in lockstep, and the <code>gox create</code> templates still depend on <code>latest</code>. The test262 C-4 batch from the 11-13 nightly run (<code>String.prototype</code> protocol dispatch + abrupt argument propagation) lives on the <code>nightly/c4-20261113</code> branch and has not passed the gate into <code>main</code>, so it is not part of this release (version bump only).</p>
</div>


<div class="rel-entry" id="v0-22-0">
<h2>0.22.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-12</span><span class="rel-tag">performance</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.22.0">Release notes</a></div>
<p class="rel-summary">Third batch of VM hot-path work (T3-4) — three changes, each on a measured hot path: (1) the <code>globalThis</code> memo now invalidates <strong>by name</strong> instead of on the whole global environment version (<code>Environment</code> gains a dedicated <code>globalThisVer</code> counter that only advances on binding writes where <code>name == "globalThis"</code>; nameless paths such as <code>CopyTo</code> bump it unconditionally as a backstop, and the VM compares <code>GlobalThisVer</code> plus the <code>globals</code> pointer to avoid cross-environment aliasing) — so a top-level <code>t = add(t, i)</code> assignment no longer blows the cache away every iteration, forcing a fresh <code>Get("globalThis")</code> string lookup; (2) <code>Stack.Pop</code> no longer nils out the interface slot — the GC only scans <code>[0, len)</code>, so the dangling reference left above the stack top was never visible, and the paths that actually need clearing (frame-boundary <code>Truncate</code> / <code>unwindFramesTo</code>) already zero slot by slot; every Pop was paying for a write barrier (Pop sat at ~14% CPU in profiles); (3) <code>addValues</code> / <code>binaryArithmetic</code> / <code>relationalCompare</code> gain a number×number fast path doing plain double arithmetic, skipping the String×2 / Array / BigInt×2 assertion chain and the two interface dispatches into <code>isTemporalValue</code> (<code>toNumber(*Number)</code> is just a field read, so results are bit-for-bit identical). Local A/B (EPYC 9K65, median of 11 runs, relative to the start of the batch): <code>fib28</code> <strong>309.5ms → 280.1ms (-9.5%)</strong>, pure recursion <code>200×fib24</code> <strong>6505ms → 5718ms (-12.1%)</strong>; the archived nightly figure is <code>fib28</code> <strong>276ms</strong>, i.e. <strong>1.14×</strong> goja raw (first time inside the 1.25× threshold; absolute numbers are host-local, CI bench re-measurement is authoritative). test262 case-by-case A/B on one snapshot (<code>2e58f87</code>): language <strong>20580/23832 = 86.3545%</strong>, built-ins <strong>18057/23879 = 75.6187%</strong>, all <strong>38637/47711 = 80.9813%</strong>, <strong>zero regressions and zero flips either way</strong> — the performance work is completely neutral for compliance. Also fixes three references in <code>docs/performance.md</code> that pointed at non-existent commits</p>
</div>


<div class="rel-entry" id="v0-21-0">
<h2>0.21.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-11</span><span class="rel-tag">test262</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.21.0">Release notes</a></div>
<p class="rel-summary">test262 C-4 batch sweep — three root causes, each unlocking a cluster: (1) member calls with spread, <code>obj.m(...args)</code> / <code>obj[k](...args)</code>, fell into the generic bare-call path and lost the receiver to <code>undefined</code>; both member-call branches now route through <code>OP_CALL_METHOD_SPREAD</code> (arguments-object family +9, Temporal subclassing-ignored family +25 — the largest single root cause this batch); (2) the parser treated out-of-range float literals such as <code>1E+309</code> as syntax errors (<code>ParseFloat</code>'s <code>ErrRange</code> misread as a parse error), and now yields <code>±Infinity</code> per spec (indexOf / lastIndexOf integer-limit family); (3) <code>stdlib/array</code>: <code>toSpliced</code> panicked on the <code>args[2:]</code> slice when fewer than two arguments were passed (crash level, 4 cases), <code>copyWithin</code> skipped <code>ToInteger</code> on the empty-array early return and ignored abrupt completion from get/set/delete inside the copy loop, and <code>keys</code>/<code>values</code>/<code>entries</code> gained the generic <code>CreateArrayIterator</code> path (any object, including resizable TypedArrays, as receiver; <code>length</code> re-read on every <code>next</code>). A/B on the same test262 snapshot (128 shards × 32 concurrency): language <strong>86.3125% → 86.3545%</strong> (20570→20580, +10), built-ins <strong>75.3992% → 75.6590%</strong> (17991→18053, +62), all <strong>80.8525% → 81.0035%</strong> (38561→38633, +72), zero regressions case-by-case</p>
</div>


<div class="rel-entry" id="v0-20-0">
<h2>0.20.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-10</span><span class="rel-tag">performance</span><span class="rel-tag">test262</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.20.0">Release notes</a></div>
<p class="rel-summary">Faster global access (T3-4, second batch) — two VM optimisations stack up: (1) a versioned <code>globalThis</code> cache removes the <code>Environment.Get("globalThis")</code> string lookup from every sloppy-mode bare call (pprof showed that path at ~14% CPU); (2) a store-through global inline cache, so a <code>STORE_GLOBAL</code> no longer invalidates every following read of the same name and hot top-level loops like <code>t = add(t, i)</code> stop refilling the cache each iteration. Local A/B on <code>fib28</code>: median <strong>176ms → 155ms (-12.0%)</strong>, ratio vs goja 1.38× → 1.21× (pure-interpreter basis; CI runner re-measurement is authoritative). Also closes the test262 long-tail attribution: <code>--top 500 --depth 3</code> yields 438 clusters over 5869 failures, and the surface shifts from cluster-dominated to a flat long tail (Top1 1708 cases / 11.15% → 256 / 4.36%), split into semantic deviation 4372 (74.5%) and feature-not-implemented 1483 (25.3%). After deducting out-of-scope areas (Intl / Atomics / SharedArrayBuffer / BigInt, 495 cases) the reachable ceiling is <strong>97.93%</strong>, with heuristic estimates of ≈28 person-days for 80%, ≈98 for 90% and ≈170 for 95%. All three compliance views show zero drift: language <strong>86.3125%</strong> / built-ins <strong>75.4034%</strong> / all <strong>80.8546%</strong>; harness dependencies 369 → 0, crashes 52 → 6, false positives 20 → 8. Tooling: bench and test262 now gate PR merges (<code>fbcf4d6</code>)</p>
</div>


<div class="rel-entry" id="v0-19-0">
<h2>0.19.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-08</span><span class="rel-tag">performance</span><span class="rel-tag">foldables</span><span class="rel-tag">GPU</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.19.0">Release notes</a></div>
<p class="rel-summary">First wave of globals lazy-materialisation for cold start — <code>Temporal</code> (~12%) and the TypedArray family (~11%) of the <code>SetupGlobals</code> profile were two object trees that minimal scripts almost never touch, yet were built in full on every start. <code>Binding</code> gains a lazy flag plus <code>DeclareLazy</code>/<code>materialize</code>: the name is declared up front (so <code>BindingNames</code>/<code>typeof</code>/<code>hasOwnProperty</code> visibility is bit-for-bit identical to eager declaration) and the factory only runs on the first <code>Get</code>; the five reflective write paths materialise first, so descriptor semantics are unchanged; the TypedArray family shares one factory across its names and back-fills <code>length</code>, the prototype chain and <code>@@species</code> on materialisation. A/B (250×2 interleaved): <code>startup_idle</code> median <strong>-10.4%</strong>, min -12.6%, RSS -4.3%; the early <code>3000×EvalFileVM</code> probe went 2.31s → 1.16s; fib28 / timers10k within noise, no regression; test262 language 86.3125% bit-for-bit unchanged. Foldables: <code>apps/foldable-demo</code> collapses into one window + posture bar + four tabs — S1 driven by the scene's own width signal for real reflow, S2 fold ruler A/B (<code>avoidReserved="all"</code>), S3 <code>isTabletop(posture, hinge)</code> composite predicate, S4 <code>screens()</code>/<code>screenOf()</code>/<code>bounds().displayId</code> multi-screen sketch, plus a 10-frame 30000ms demo GIF; two kernel defects fixed along the way (<code>avoidReserved</code> not re-laying-out after <code>reportPosture</code>; stale ghost when a structural slot switches branch). GPU: one <code>TestBackendTrackReport</code> per track (nogpu / gpu / cgo) pins the path actually taken, <code>gpu-track-audit.sh</code> adds cross-compile spot checks and <code>gpu-present.yml</code> a hardware-free fallback run; measurement corrected — the windowed present path has not wired the swapchain yet, offscreen compose + Readback is the real path today</p>
</div>


<div class="rel-entry" id="v0-18-0">
<h2>0.18.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-06</span><span class="rel-tag">test262</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.18.0">Release notes</a></div>
<p class="rel-summary">The test262 C-3 "crash / hang" sweep lands, with one root cause fixing a whole cluster: array indices are now routed by the spec index test (canonical integers 0…2^32-2), so out-of-range stores fall back to ordinary properties and anything past the dense-array ceiling raises an honest <code>RangeError</code> instead of materialising 2^32 elements and exhausting memory; <code>Array.length</code> writes gain the ToUint32≠ToNumber check; <code>arraySpeciesCreate</code> gains the length ceiling check; the <code>Promise</code> self-resolution check moves ahead of the pending branch (it was unreachable, so the <code>resolve-self</code> family hung forever); iterator helpers (<code>forEach</code>/<code>some</code>/<code>every</code>/<code>find</code>/<code>includes</code>) switch from eager collection to lazy driving with <code>IteratorClose</code> on short-circuit; iterator <code>next()</code> / <code>value</code> getter throws are no longer swallowed as <code>(undefined, not-done)</code>; <code>JSON.stringify</code> cycle detection moves from a static <code>hasCycle</code> to a recursion path stack, covering cycles built dynamically by <code>toJSON</code>/<code>replacer</code>; two infinite loops (<code>unshift</code> with no args, <code>replaceAll</code> on an empty match) are fixed. A/B: hangs <strong>83 → 6</strong>, crashed 0, built-ins <strong>75.08% → 75.40%</strong> (17914 → 17992, +78), all 80.69% → 80.85%, language 86.3125% bit-for-bit unchanged; batch floors raised to language 86.0125, built-ins 75.1034, all 80.5546</p>
</div>


<div class="rel-entry" id="v0-17-0">
<h2>0.17.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-04</span><span class="rel-tag">performance</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.17.0">Release notes</a></div>
<p class="rel-summary">Closure-free frame <code>Locals</code> are now pooled and reused with the frame (<code>acquireFrame</code> hands back the backing array and clears it to preserve TDZ semantics; all four escape paths are blocked by a no-closures check, a pending-generator check and a backing-pointer comparison, and pathological frames above 512 slots stay out of the pool) — fib28 heap allocations <strong>−88%</strong>, wall time <strong>418ms → 341ms (−18%)</strong>; cold start's <code>splitDots</code> switched from per-character concatenation to <code>IndexByte</code> sub-slicing, cutting roughly 40k small allocations per <code>SetupGlobals</code> run, startup 10ms → 9ms; the test262 baseline is refreshed against <code>2b499cc</code> with language compliance at 86.3%, still above the batch floor</p>
</div>


<div class="rel-entry" id="v0-16-0">
<h2>0.16.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-02</span><span class="rel-tag">language</span><span class="rel-tag">test262</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.16.0">Release notes</a></div>
<p class="rel-summary"><code>ArrayBuffer.prototype.transfer</code> / <code>transferToFixedLength</code> (ES2024) land — detached-transfer semantics with TypedArray view sync; test262 metric reconciliation: <code>docs/test262-gate.md</code> is now the single authoritative definition, batch floors (language 85% / built-ins 50% / all 80%) are enforced as a CI gate (<code>test262-gate-floors.json</code> + hardened <code>check-compliance.py</code>), every previously unregistered harness is registered and <code>skipped</code> driven to zero; freshly built run: language 86.3%, built-ins 75.1%, all 80.7%</p>
</div>


<div class="rel-entry" id="v0-15-34">
<h2>0.15.34</h2>
<div class="rel-meta"><span class="rel-date">2026-10-30</span><span class="rel-tag">GUI</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.15.34">Release notes</a></div>
<p class="rel-summary">New <code>apps/devtools/</code> interactive GUI debugging panel (Inspector v2, pure script, zero kernel changes): expandable/selectable element tree with multi-window switcher, node props &amp; layout box queried by path, console retention with level filtering, a stateful <code>devEval</code> REPL (100-entry history), and a <code>devSnapshot</code> perf summary line; added to the headless apps smoke suite</p>
</div>


<div class="rel-entry" id="v0-15-30">
<h2>0.15.30 ~ 0.15.33</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">test262</span><span class="rel-tag">tooling</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.15.30 ~ 0.15.33">Release notes</a></div>
<p class="rel-summary">Engine: test262 batches 23–26 land (RegExp <code>unicodeSets</code> <code>v</code> flag, closure outer bindings read through a live binding cell, <code>Number.prototype.toString</code> shortest round-trip in any radix, <code>Math.f16round</code> (ES2024), <code>Error.prototype</code> chain wiring with per-instance <code>name</code>/<code>message</code> override semantics), built-ins compliance 73.9% → 75.0%. Tooling: <code>release.yml</code> de-duplication upgraded to a package-level <code>versions</code> cross-check (a flaky single <code>npm view</code> can no longer be misread as "not published"); the <code>pages.yml</code> version gate now keeps the site's own two displays (<code>config.mts</code> ↔ homepage) as a hard gate while downgrading npm drift to a warning; the <code>@goxjs/goxjs</code> dependency in <code>gox create</code> scaffolding moved from a pinned <code>^0.5.0</code> to <code>latest</code>, so new projects track the newest npm release</p>
</div>


<div class="rel-entry" id="v0-15-18">
<h2>0.15.18 ~ 0.15.29</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">test262</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.15.18 ~ 0.15.29">Release notes</a></div>
<p class="rel-summary">Patch series: test262 batches 11–22 land continuously (Map/Set iterator <code>next</code>, <code>Promise.allKeyed</code> / <code>allSettledKeyed</code>, thenable adoption, Date setter coercion fixes — built-ins compliance 71.1% → 73.9%); the mobile <code>libgox</code> dual-ABI NDK rebuild from scratch and density render scaling; engine/platform-shell paired release gates aligned (<code>engineVersionRange</code> 0.15.x)</p>
</div>


<div class="rel-entry" id="v0-15-1">
<h2>0.15.1 ~ 0.15.17</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">test262</span><span class="rel-tag">mobile</span><span class="rel-tag">performance</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.15.1 ~ 0.15.17">Release notes</a></div>
<p class="rel-summary"></p>
</div>


<div class="rel-entry" id="v0-15-0">
<h2>0.15.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">test262</span><span class="rel-tag">foldables</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.15.0">Release notes</a></div>
<p class="rel-summary"><strong>test262 <code>language</code> compliance raised to 97%</strong> (up another 11.4pp from 85.6% in 0.14.x); <code>gfx/hostbridge</code> converges the three-platform host protocol so host-contract tests run on the desktop; two structural defects in foldable regression fixed (APK missing x86_64 ABI, skip gate never effective); three-platform regression matrix made probe-based, removing hardcoded runner assumptions; a batch of <code>parser</code> / <code>object</code> / <code>gfx</code> fixes (props no longer null, dual-channel children, regex <code>\u</code> escapes, undefined keys treated as absent)</p>
</div>


<div class="rel-entry" id="v0-14-1">
<h2>0.14.1</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><span class="rel-tag">foldables</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.14.1">Release notes</a></div>
<p class="rel-summary">X11 backend fixes (PutImage row-band splitting, event type-switch value types); permission semantics aligned across all three platforms (spec pinned + exhaustive mocks); foldable adaptation landed: foldable_demo sample, 20-round lifecycle regression, adaptation guide; README hero example switched to an adaptive one/two-column list page with a new English README.en.md; three-platform regression matrix in CI</p>
</div>


<div class="rel-entry" id="v0-14-0">
<h2>0.14.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.14.0">Release notes</a></div>
<p class="rel-summary">JSX interpolation children are reactive (Solid semantics): <code>&lt;text&gt;count: { count()}&lt;/text&gt;</code> is wrapped into a function child at parse time — no more handwritten <code>{() =&gt; …}</code> closures; constants, explicit functions and bare identifiers stay as-is; <code>gox lint</code>'s <code>snapshot-child</code> now targets handwritten <code>h()</code> snapshots</p>
</div>


<div class="rel-entry" id="v0-13-0">
<h2>0.13.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.13.0">Release notes</a></div>
<p class="rel-summary">Prism design system (S0–S8): a full visual redesign of the base widgets — layered design tokens (semantic / component / prism presets), control refinements (capsule slider track with a larger knob, 36px field rows, adaptive table column widths, real shadows and an animation heartbeat for drawers/dialogs), feedback components (animated ring spinner, colour-interpolated skeletons, reduced-motion support), touch-mode hit-area inflation and unified density constants</p>
</div>


<div class="rel-entry" id="v0-12-0">
<h2>0.12.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><span class="rel-tag">performance</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.12.0">Release notes</a></div>
<p class="rel-summary">Coverage-based antialiasing in the raster pipeline: diagonal lines, arcs and rings are no longer hard-edged (<code>fillRingAA</code> / <code>fillDiscAA</code> and other AA primitives)</p>
</div>


<div class="rel-entry" id="v0-11-0">
<h2>0.11.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><span class="rel-tag">media</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.11.0">Release notes</a></div>
<p class="rel-summary">Media tags that actually play: <code>&lt;video&gt;</code> / <code>&lt;audio&gt;</code> ship with <code>gfx/softmedia</code>, a pure-Go software media backend (GIF / MJPEG video, WAV + PulseAudio audio) enabled in the default Linux build; <code>&lt;audio&gt;</code> is a new tag and <code>&lt;video&gt;</code> gained <code>fit</code>, with the honest-downgrade path unchanged elsewhere; <code>gx/datav</code> dashboard component library; GPU presentation backend prototype (<code>-tags gpu</code>, experimental); <code>for...in</code> destructuring bindings; a foldable-screen demo app</p>
</div>


<div class="rel-entry" id="v0-10-0">
<h2>0.10.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">foldables</span><span class="rel-tag">GUI</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.10.0">Release notes</a></div>
<p class="rel-summary">Foldable-screen adaptation: <code>posture</code> / <code>hinge</code> / <code>regions</code> / <code>splitRatio</code> / <code>hingeOrientation</code> readouts in <code>gx/screen</code>, <code>reservedRegions</code> / <code>hasFold</code> / <code>layoutMode</code> / <code>widthClass</code> in <code>gx/viewport</code>, opt-in <code>avoidReserved</code> hinge avoidance; Android / iOS / HarmonyOS hosts all report fold state; <code>scroll vlist</code> virtualised long lists; three breakpoints (compact / medium / expanded)</p>
</div>


<div class="rel-entry" id="v0-9-0">
<h2>0.9.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><span class="rel-tag">toolchain</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.9.0">Release notes</a></div>
<p class="rel-summary"><code>table</code> / <code>tree</code> / <code>list-item</code> data-display components, <code>tabs</code>, and <code>tooltip</code>; design tokens and a theme system (32 colour tokens, dark preset, runtime switching); <code>gx/update</code> v1.1 auto-update (streaming download / resume / progress callbacks / <code>pre</code> channel); <code>gox create --ts</code> TypeScript / TSX template; <code>var</code> declarations and class expressions; runtime errors carry source-frame locations</p>
</div>


<div class="rel-entry" id="v0-8-0">
<h2>0.8.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">test262</span><span class="rel-tag">toolchain</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.8.0">Release notes</a></div>
<p class="rel-summary">Test262 compliance pipeline (scheduled <code>language</code> suite runs, badge auto-writeback); <code>gox vs node</code> performance benchmark harness; stress and frame-budget tests (10k-timer storm / concurrent fetch / 489-node render budget); 3 sample apps (TODO / dashboard / Snake); computed property names; draggable scrollbars and horizontal scrolling</p>
</div>


<div class="rel-entry" id="v0-7-0">
<h2>0.7.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">toolchain</span><span class="rel-tag">mobile</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.7.0">Release notes</a></div>
<p class="rel-summary"><code>gox cert</code> to generate signing certificates for all platforms in one step, <code>gox build android</code> auto-wires signing, <code>gox create</code> generates a certs/ directory; <code>gox build macos --arch universal</code> (merged amd64+arm64); ordered multi-select photo picking on iOS and multi-file preview in media.preview</p>
</div>


<div class="rel-entry" id="v0-6-0">
<h2>0.6.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><span class="rel-tag">toolchain</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.6.0">Release notes</a></div>
<p class="rel-summary">macOS window backend cocoa (desktop GUI now covers all three platforms); <code>gox dev</code> hot reload, <code>gox.json</code> project config, unified <code>gox build</code> entry point</p>
</div>


<div class="rel-entry" id="v0-5-0">
<h2>0.5.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">native</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.5.0">Release notes</a></div>
<p class="rel-summary">Six built-in native-capability modules (gx/device · gx/app · gx/geo · gx/media · gx/permission · gx/viewport)</p>
</div>


<div class="rel-entry" id="v0-4-0">
<h2>0.4.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">toolchain</span><span class="rel-tag">GUI</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/v0.4.0">Release notes</a></div>
<p class="rel-summary"><code>gox create</code> scaffolding; routing <code>gx/router</code> and screen <code>gx/screen</code> become built-in modules</p>
</div>

::: info Known Gaps
Rich text (inline mixed styling) is not yet wrapped (virtualized long lists landed as [`<scroll vlist>`](/en/components/layout#scroll)); parts of the native-capability layer that depend on real devices (camera / location / photo library / permissions) honestly report `unsupported` on desktop and are provided by the platform shells on mobile. See [Limits & Common Pitfalls](/en/components/limits).
:::
