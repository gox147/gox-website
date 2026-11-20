---
title: 最新发版
description: Gox 当前发布版本 v0.28.0 —— 这一次改了什么、哪些数字动了、已知缺口在哪；全部历史版本见更新日志。
---

# 最新发版

当前发布版本 **v0.28.0**（2026-11-20）。这一页只讲**最近这一次发版**；全部历史版本在[更新日志](/release/changelog)。

::: tip 三种查版本的方式
- **官网**：这页 + [更新日志](/release/changelog)（按版本倒序的全量表）
- **GitHub**：[Releases](https://github.com/14752222/Gox/releases)（原始发布正文，含校验值）
- **命令行**：`gox version` —— 打印版本号、commit 与构建工具链，报 bug 时请贴这四行
:::

## 30 秒看完

| 你在关心什么 | 这一次的答案 |
| --- | --- |
| 升级值不值 | `npm i -g @goxjs/goxjs@latest` —— 合规面继续上行、首帧又快了一点，脚本不用改 |
| 语言合规 | test262 built-ins **81.7% → 82.2%**（+128 例）、language **87.0%**、全量 **84.3% → 84.6%**，**全程零退潮** |
| 启动速度 | 首次 GC 不再挡在建窗往返上（首帧 −22%）、x11 建连预热（首帧 −4.7~8.2%）、内建 `length` 不再逐条建 map |
| 测量纪律 | 新增同机配对 A/B 工具 `perf-ab.sh` 与**分配预算闸门**，性能类提交必须带配对数据才能进 |
| 有没有坑 | 无破坏性变更；一笔优化（键位标记去线性扫描）被 20 轮验证**证否并撤回**，负结果原样记档 |

## 本版要点

### Promise 聚合族交错重写

`PerformPromiseAll` / `AllSettled` / `Any` / `Race` 此前共用一条批量收集路径，时序上会偏离规范。
这一版按规范逐条对齐「逐个 `Call` then、逐次 `then` 取 `resolveElement` 闭包」的**交错时序**，把共用路径一次性拆干净 ——
这是根因收口，不是给失败用例打补丁。built-ins 因此 +128 例。

### 首帧启动链路收口

| 改动 | 结果 |
| --- | --- |
| 首次 GC 不再挡在建窗往返上 | 首帧 −1.9ms / −22%（对外口径 −1.2ms / −6.7%） |
| 内建 `length` 不再逐条建 map | 解释器初始化 −23.7%（10/10 轮可复现） |
| x11 建连预热（先连 X server 再起字体预取） | 首帧 −0.46~0.82ms / −4.7~8.2% |

> 另有一笔「键位标记去线性扫描」的优化，经 20 轮配对验证只有 −0.13%、不足阈值，**已撤回**。
> 这种负结果也写进 Release —— 不把没收益的东西算成优化。

### 测量纪律与 GPU

- 新增同机配对 A/B 工具 `perf-ab.sh`：交替取样 + commit/dirty 身份 + 阈值门
- 新增**分配预算闸门**（`fib28` 403,269 次 / `SetupGlobals` 2,102 次，三平台进 CI）
- 性能 A/B 契约 `abcontract` 进 commit-msg 与 CI：性能类提交必须带配对数据
- `gfx` 全量 `-tags gpu` 的延迟 SIGSEGV 根因定位（wgpu `RequestAdapter` 经 goffi dlopen 真 Vulkan loader，
  loader 自建原生线程后在约 150 用例处崩）；探针改 `GOX_GPU_PROBE=1` 显式 opt-in，全量 415.6s 转绿

## 兼容性

| 项 | 影响 |
| --- | --- |
| 公共 API | 0.x 期 minor 版本即破坏位，升级前建议先跑一遍自己的测试 |
| 脚本代码 | 本版无破坏性变更 |
| npm | 主包与四个移动端子包同号推进到 `0.28.0` |
| 脚手架 | `gox create` 模板的 `@goxjs/goxjs` 依赖仍为 `latest`，跟随 npm 最新发布 |

## 升级

```bash
npm i -g @goxjs/goxjs@latest
gox version          # 确认版本、commit 与构建工具链
```

报问题时请附上 `gox version` 的完整四行输出，以及最小复现脚本。

## 继续往下看

- 想看**逐个版本**改了什么 → [更新日志](/release/changelog)
- 想看**实测数字**的口径与阈值 → [性能与合规数据](/guide/performance)
- 想看**哪里做不到** → [限制与常见误区](/components/limits)
