---
title: Latest Release
description: The current Gox release, v0.28.0 — what changed, which numbers moved and where the known gaps are; full history lives in the changelog.
---

# Latest Release

Current release: **v0.28.0** (2026-11-20). This page covers the **most recent release only**; every earlier version is in the [changelog](/en/release/changelog).

::: tip Three ways to look up a version
- **This site**: this page + the [changelog](/en/release/changelog) (everything, newest first)
- **GitHub**: [Releases](https://github.com/14752222/Gox/releases) — the original notes, including checksums
- **Command line**: `gox version` — prints the version, commit and toolchain; paste all four lines in a bug report
:::

## In 30 seconds

<div class="rel-table-wrap">

| What you care about | The answer for this release |
| --- | --- |
| Is upgrading worth it | `npm i -g @goxjs/goxjs@latest` — conformance keeps climbing and startup got faster again; no code changes needed |
| Language conformance | test262 built-ins **81.7% → 82.2%** (+128 cases), language **87.0%**, overall **84.3% → 84.6%**, with **zero regressions** |
| Startup time | First GC no longer blocks window creation (first frame -22%), X11 connect warm-up (first frame -4.7 to 8.2%), built-in `length` no longer builds per-item maps |
| Measurement discipline | A paired A/B tool `perf-ab.sh` and an **allocation budget gate** land; performance commits must carry paired data |
| Any pitfalls | No breaking changes; one optimisation (linear-scan key markers) was **disproved and reverted** after 20 rounds and recorded as a negative result |

</div>

## Highlights {#rel-highlights}

### Promise combinators rewritten for interleaving

`PerformPromiseAll` / `AllSettled` / `Any` / `Race` shared one batch-collection path, which drifted from the specified
ordering. This release aligns each combinator with the spec's **interleaved timing** ("call `then` one by one, take the
`resolveElement` closure one by one") and removes the shared path entirely — a root-cause fix rather than patches for
failing cases. built-ins gained +128 cases because of it.

### First-frame startup work

<div class="rel-table-wrap">

| Change | Result |
| --- | --- |
| First GC no longer blocks on the window round trip | First frame -1.9ms / -22% (public figure -1.2ms / -6.7%) |
| Built-in `length` no longer builds a map per property | Interpreter init -23.7% (reproducible in 10/10 runs) |
| X11 connect warm-up (connect before starting font prefetch) | First frame -0.46 to 0.82ms / -4.7 to 8.2% |

</div>

> One further optimisation — removing the linear scan for key markers — measured only -0.13% over 20 paired runs,
> below threshold, and was **reverted**. The negative result is recorded in the release notes; no unproven gain is
> reported as a win.

### Measurement discipline and GPU

- New same-machine paired A/B tool `perf-ab.sh`: interleaved sampling + commit/dirty identity + threshold gate
- New **allocation budget gate** (`fib28` 403,269 allocations / `SetupGlobals` 2,102, wired into CI on three platforms)
- Performance A/B contract `abcontract` in commit-msg and CI: performance commits must carry paired data
- Root-caused the delayed SIGSEGV in the full `gfx` `-tags gpu` suite (wgpu `RequestAdapter` dlopens the real Vulkan
  loader via goffi; the loader spawns a native thread and the suite crashed around case 150); the probe is now explicit
  opt-in via `GOX_GPU_PROBE=1`, and the full suite (415.6s) is green

## Compatibility

| Item | Impact |
| --- | --- |
| Public API | During 0.x a minor release may break things — run your own tests before upgrading |
| Scripts | No breaking changes in this release |
| npm | Main package and the four mobile sub-packages move to `0.28.0` together |
| Scaffolding | The `gox create` template keeps `@goxjs/goxjs: latest`, following npm's latest release |

## Upgrade

```bash
npm i -g @goxjs/goxjs@latest
gox version          # confirm version, commit and toolchain
```

When reporting an issue, include the full four lines from `gox version` plus a minimal repro script.

## Keep reading

- **Version by version** → [Changelog](/en/release/changelog)
- **How the numbers are measured** → [Performance and Compliance Data](/en/guide/performance)
- **Where Gox falls short** → [Limits & Common Pitfalls](/en/components/limits)
