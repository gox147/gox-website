---
title: 更新日志
description: Gox 全部版本的发版记录 —— 一版一卡，按时间倒序，带发版日期、标签与 Release 链接。
---

# 更新日志

<div class="docs-version-banner" role="note">
  <span>本站文档对应 <b>v0.15.0</b>，当前已发布 <b>v0.28.0</b>。</span>
  <a href="https://github.com/14752222/Gox/releases/latest">看最新发布</a>
  <a href="/release/#rel-highlights">看 0.28.0 改了什么</a>
</div>

Gox 的发版记录，**按时间倒序**，一版一张卡片。卡片头部是版本号、发版日期和标签，正文第一行是一句话摘要，
下面按「① ② ③」逐条列出这一版实际动了什么。点版本号右侧的 Release 可以拿到原始发布正文。

本页只记录**已发布的版本**。想先看最近几版，见[最新发版](/release/)；想看某个版本对应的文档，用导航栏右上角的版本切换器。

::: tip 读法
- **日期**取自 GitHub Releases 的发布时间（Asia/Shanghai）。2026-11-06 及更早的版本发布时没带正文，日期按发版节奏标注。
- **标签**是本站整理的分组，一个版本可以有多条；`发版节奏` 表示这次只是推进版本号、引擎代码零变更。
- 带 ① ② ③ 编号的是同一版里的**并列改动簇**，不是先后步骤。每一版都有固定地址（`#v0-28-0`），可直接引用。
:::

## 版本索引

<ul class="rel-index">
  <li><a href="/release/changelog#v0-28-0">v0.28.0</a><span>2026-11-20</span></li>
  <li><a href="/release/changelog#v0-27-0">v0.27.0</a><span>2026-11-19</span></li>
  <li><a href="/release/changelog#v0-26-0">v0.26.0</a><span>2026-11-18</span></li>
  <li><a href="/release/changelog#v0-25-0">v0.25.0</a><span>2026-11-16</span></li>
  <li><a href="/release/changelog#v0-24-0">v0.24.0</a><span>2026-11-15</span></li>
  <li><a href="/release/changelog#v0-23-0">v0.23.0</a><span>2026-11-13</span></li>
  <li><a href="/release/changelog#v0-22-0">v0.22.0</a><span>2026-11-12</span></li>
  <li><a href="/release/changelog#v0-21-0">v0.21.0</a><span>2026-11-11</span></li>
  <li><a href="/release/changelog#v0-20-0">v0.20.0</a><span>2026-11-10</span></li>
  <li><a href="/release/changelog#v0-19-0">v0.19.0</a><span>2026-11-08</span></li>
  <li><a href="/release/changelog#v0-18-0">v0.18.0</a><span>2026-11-06</span></li>
  <li><a href="/release/changelog#v0-17-0">v0.17.0</a><span>2026-11-04</span></li>
  <li><a href="/release/changelog#v0-16-0">v0.16.0</a><span>2026-11-02</span></li>
  <li><a href="/release/changelog#v0-15-34">v0.15.34</a><span>2026-10-30</span></li>
  <li><a href="/release/changelog#v0-15-30">v0.15.30 ~ 0.15.33</a><span>—</span></li>
  <li><a href="/release/changelog#v0-15-18">v0.15.18 ~ 0.15.29</a><span>—</span></li>
  <li><a href="/release/changelog#v0-15-1">v0.15.1 ~ 0.15.17</a><span>—</span></li>
  <li><a href="/release/changelog#v0-15-0">v0.15.0</a><span>—</span></li>
  <li><a href="/release/changelog#v0-14-1">v0.14.1</a><span>—</span></li>
  <li><a href="/release/changelog#v0-14-0">v0.14.0</a><span>—</span></li>
  <li><a href="/release/changelog#v0-13-0">v0.13.0</a><span>—</span></li>
  <li><a href="/release/changelog#v0-12-0">v0.12.0</a><span>—</span></li>
  <li><a href="/release/changelog#v0-11-0">v0.11.0</a><span>—</span></li>
  <li><a href="/release/changelog#v0-10-0">v0.10.0</a><span>—</span></li>
  <li><a href="/release/changelog#v0-9-0">v0.9.0</a><span>—</span></li>
  <li><a href="/release/changelog#v0-8-0">v0.8.0</a><span>—</span></li>
  <li><a href="/release/changelog#v0-7-0">v0.7.0</a><span>—</span></li>
  <li><a href="/release/changelog#v0-6-0">v0.6.0</a><span>—</span></li>
  <li><a href="/release/changelog#v0-5-0">v0.5.0</a><span>—</span></li>
  <li><a href="/release/changelog#v0-4-0">v0.4.0</a><span>—</span></li>
</ul>

## 全部版本

<div class="rel-entry" id="v0-28-0">
<h2>v0.28.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-20</span><span class="rel-tag">test262</span><span class="rel-tag">性能</span><span class="rel-tag">工程化</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.28.0">Release</a></div>
<p class="rel-summary">test262 Promise 交错重写 + 首帧启动链路收口 + 性能 A/B 契约闸门 —— 自 v0.27.0 起 <code>main</code> 累计 <strong>23 个提交</strong></p>
<ul class="rel-points">
<li>① <strong>test262 合规</strong>：built-ins <strong>81.7% → 82.2%</strong>（+128 例）、language <strong>87.0%</strong>、全量 <strong>84.3% → 84.6%</strong>，<strong>全程零退潮</strong></li>
<li>[B1][rwjnvX] Promise 聚合族交错重写，<code>PerformPromiseAll</code> / <code>PerformPromiseAllSettled</code> / <code>PerformPromiseAny</code> / <code>PerformPromiseRace</code> 按规范逐条对齐「逐个 <code>Call</code> then、逐次 <code>then</code> 取 <code>resolveElement</code> 闭包」的交错时序，此前共用的批量收集路径一次性拆干净（根因收口，不是打补丁）</li>
<li>② <strong>首帧启动</strong>：两次 GC 相关优化</li>
<li>首次 GC 不再挡在建窗往返上（首帧 −1.9ms / −22%，对外口径 −1.2ms / −6.7%），内建 <code>length</code> 不再逐条建 map（解释器初始化 −23.7%，10/10 轮可复现，热循环上限守住）</li>
<li>x11 <strong>建连预热</strong>（先连 X server 再起字体预取，首帧 −0.46~−0.82ms / 4.7~8.2%）</li>
<li>键登记去线性扫描的批次经 20 轮验证被<strong>证否并撤回</strong>（−0.13%，不足阈值）</li>
<li>该负结果原样记档</li>
<li>③ <strong>测量纪律</strong>：新增同机配对 A/B 工具 <code>perf-ab.sh</code>（交替取样 + commit/dirty 身份 + 阈值门）与<strong>分配预算闸门</strong>（<code>fib28</code> 403,269 次 / <code>SetupGlobals</code> 2,102 次，进 CI 三平台）</li>
<li>性能 A/B 契约 <code>abcontract</code> 进 commit-msg 与 CI，性能类提交必须带配对数据</li>
<li>④ <strong>GPU</strong>：<code>gfx</code> 全量 <code>-tags gpu</code> 的延迟 SIGSEGV 根因定位（wgpu <code>RequestAdapter</code> 经 goffi dlopen 真 Vulkan loader，loader 自建原生线程后约 150 用例处崩），探针改 <code>GOX_GPU_PROBE=1</code> 显式 opt-in，全量 415.6s 转绿</li>
<li><code>gpu-present</code> 闸门再加固（脚本可执行位守卫 + 组件 A/B 独立 step + 仅崩溃一次重跑），<code>gpu-track-audit.sh</code> 可执行位第三次修复。<code>gox create</code> 模板仍写 <code>@goxjs/goxjs: latest</code></li>
</ul>
</div>


<div class="rel-entry" id="v0-27-0">
<h2>v0.27.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-19</span><span class="rel-tag">test262</span><span class="rel-tag">性能</span><span class="rel-tag">GPU</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.27.0">Release</a></div>
<p class="rel-summary">test262 内建族连打 + 冷启动字体链路四连优化 + GPU 三平台句柄就位 —— 自 v0.26.0 起 <code>main</code> 累计 <strong>32 个提交</strong></p>
<ul class="rel-points">
<li>① <strong>test262 合规</strong>：built-ins <strong>78.6% → 81.7%</strong>、language <strong>87.0%</strong>、全量 <strong>82.8% → 84.3%</strong>，五个批次连续 +48/+92/+32/+95/+55 例且<strong>全程零退潮</strong></li>
<li>T5 第二波 + B2（Proxy statics 不变式、<code>[[GetOwnProperty]]</code> GetMethod、嵌套转发，String 包装对象键枚举）、B5+B6（构造器 <code>.prototype</code> 与常量属性描述符规范化、<code>Function.prototype</code> 方法物化、<code>Date</code> set 系列读值顺序）、B7（RegExp 内建 <code>length</code> 与 <code>lastIndex</code> 语义，<code>@@match</code> / <code>@@matchAll</code> / <code>@@search</code> / <code>@@replace</code> 泛化 receiver + 全链路严格 Set）、B4+B3（Iterator helpers 关闭语义：<code>return</code> 单次转发 / 终态化 / 校验先关闭，<code>Object.prototype</code> Annex B 遗留访问器）、T6+T7（抽象操作校验族同源攻坚）、T5+B8 收尾（Proxy Symbol 键 trap 原值传递、revoked 语义对齐、<code>in</code> 算子原型链 <code>has</code></li>
<li>构造器 identity 修复</li>
<li><code>NativeError</code> 构造器 <code>[[Prototype]]</code>=%Error%、Map/Set/WeakMap/WeakSet/ArrayBuffer/TypedArray 的 <code>prototype.constructor</code> 回引、<code>Number.parseInt</code> 与全局同函数、<code>Set.keys</code> 与 <code>values</code> 同函数、TA <code>toString</code> 同函数、<code>getPrototypeOf</code> 的 ToObject 装箱）</li>
<li>② <strong>冷启动</strong>：字体改<strong>按需读表</strong>（首帧 24 → 14ms、RSS −19MB）</li>
<li>判面与族索引不再建表（首帧 −17.4%、族索引 −82.1%）</li>
<li>选默认字体不再整份读被否掉的候选（首帧 −13.6%、峰值 RSS −21.5MB）</li>
<li>默认字体<strong>后台预取</strong>把 1.78ms 藏到建窗建树之后（首帧 −0.7~0.95ms，45/48 轮更快）。字体缓存指纹改「头 3K + 尾 1K」拼贴</li>
<li>Windows 上「等长内容 + 原 mtime」的替换也能认出</li>
<li>③ <strong>运行时</strong>：<code>OP_CALL</code> 闭包调用走栈直传快路径，<code>fib28</code> <strong>−3.5%</strong>（执行条数分母同时改为可复现）</li>
<li>④ <strong>GPU</strong>：cocoa 两段式 <code>CAMetalLayer</code> 接线完成（三平台原生句柄暴露的代码前提全部就位）、x11 <code>Xlib</code> dlopen 换 goffi（修真零 cgo 交叉矩阵的 linux 链接）、x11 swapchain 端到端点亮测试 + 窗口化路径 BGRA 格式修复、darwin 交叉编译冲突用 goffi nofakecgo 官方开关修掉</li>
<li><strong>五平台矩阵全通</strong></li>
<li>⑤ <strong>测量口径</strong>：首帧口径剔除两笔支架成本</li>
<li><code>xvfb-run</code> 每样本新起 X server（41ms）与 <code>date</code> fork（0.9ms）不再计入 gox：同机 41ms → <strong>9ms</strong>，exec→首帧 <strong>7.37ms</strong></li>
<li>结果 JSON 强制带 <code>harness</code> 块并加闸门，退回 <code>date</code> 版本立刻红</li>
<li>⑥ <strong>工程化</strong>：<code>gpu-track-audit.sh</code> 可执行位（100755）两次修复（Git Data API 重建误写 100644 导致 CI 恒 exit 126）、<code>gpu-present</code> 视觉闸门两处失效修复（管道吞退出码 + runner 字体贫瘠误杀空白守卫）。<code>gox create</code> 模板仍写 <code>@goxjs/goxjs: latest</code></li>
</ul>
</div>


<div class="rel-entry" id="v0-26-0">
<h2>v0.26.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-18</span><span class="rel-tag">test262</span><span class="rel-tag">性能</span><span class="rel-tag">GPU</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.26.0">Release</a></div>
<p class="rel-summary">test262 T1–T5 根因单连打 + 冷启动/性能第三批 + GPU 上屏链路打通 —— 自 v0.25.0 起 <code>main</code> 累计 <strong>30 个提交</strong></p>
<ul class="rel-points">
<li>① <strong>test262 合规</strong>：依次收掉 T1（全局内建注册补齐 <code>EvalError</code> / <code>encodeURI</code> 家族）、T2（正则编译失败引入 regexp2 降级引擎</li>
<li>命名捕获组与子类覆写合规、修饰符组 dotAll 作用域与标志减除、非 u 模式点号码元物化）、T3（TypedArray 家族原型挂载 + immutable ArrayBuffer）、T4+T5（<code>IsConstructor</code> / <code>IsCallable</code> 校验缺口、Proxy trap <code>GetMethod</code> 分发），另有 C-4 批次 <code>String.prototype</code> 协议派发与参数 abrupt 传播、直接 <code>eval</code> 早错补全（<code>var arguments</code> 在非简单形参列表下应报 <code>SyntaxError</code>）</li>
<li>每一批 A/B 均<strong>零退潮</strong>。合规率全量 <strong>82.8%</strong>、built-ins <strong>78.6%</strong></li>
<li>② <strong>冷启动</strong>：族索引建立并发化 41.3ms → 13.8ms（2.99×）、目录扫描不再预读字体字节（首次用字体 51.8 → 0.7ms）、字体栈去掉两处重复读盘（首帧 -10.3%、首次用字体 -44%）、内建 <code>length</code> 应用改零分配路径（每次初始化少 549 次堆分配），闸门改为自校准比值以免 2 核 runner 假红</li>
<li>③ <strong>运行时性能</strong>：布尔原始值改用进程级单例（<code>fib28</code> 全程少一次装箱，-11%）</li>
<li>④ <strong>GPU</strong>：A 路径三个硬前提落地</li>
<li>swapchain 真上屏接线、原生句柄可选接口、x11 <code>Xlib</code> <code>Display*</code> 的 dlopen 方案（purego 零 cgo）</li>
<li>新增 26 组件 CPU vs GPU 双轨像素级 A/B 视觉闸门并接入 CI</li>
<li>光栅化可行性探针离线三件套（字形图集 / 绘制普查 / SDF 像素 A/B）</li>
<li>⑤ <strong>工程化</strong>：开工前防返工闸门（落后 <code>origin/main</code> 或脏树一律拦下）、性能对外数字改由 golden 单一真相源生成并纳入 PR 闸门。<code>gox create</code> 脚手架的 <code>package.json</code> 依赖字段固定写 <code>@goxjs/goxjs: latest</code>，跟随 npm dist-tag、不钉版本号</li>
</ul>
</div>


<div class="rel-entry" id="v0-25-0">
<h2>v0.25.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-16</span><span class="rel-tag">工程化</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.25.0">Release</a></div>
<p class="rel-summary">节奏性发版（版本号推进）+ CI 闸门缺陷修复 —— 本版进入 <code>main</code> 的是两笔与 <code>gpu-present</code> 流水线相关的改动：<code>f6c64d3</code> 给 <code>gpu-present.yml</code> 的 <code>hardware</code>（硬件可信口径）作业补上 skip 守卫 <code>if: vars.GPU_HARDWARE_RUNNER == 'true'</code>，此前只靠 <code>runs-on: [self-hosted, gpu-hardware]</code> 的标签守卫，仓库里没有这类 runner 时作业会一直停在 <code>queued</code> 直到 30 分钟 timeout 报红（2026-11-15 首跑实测踩中），现在改由仓库变量显式开启、默认直接 skip；<code>99cce03</code> 在 <code>docs/gpu-track-audit.md</code> 补记 11-15 复跑核销 —— 三轨输出与 11-08 基线逐项一致（<code>nogpu=none</code> / <code>wgpu=software</code> 兜底口径 / <code>cgo=none</code>），<code>go test ./gfx/gpu</code> 与 <code>go test -tags gpu ./gfx/gpu</code> 双绿，<code>--xcompile</code> 矩阵 windows/amd64、linux/arm64 ok，darwin/arm64 的 fakecgo 符号冲突与 js/wasm 构建约束排除维持既有结论</p>
<ul class="rel-points">
<li>引擎与运行时代码零变更，本版二进制与 <code>0.24.0</code> 除 <code>gox version</code> 打印的版本串外完全一致</li>
<li>npm 主包与四个移动端子包同号推进到 <code>0.25.0</code>，<code>gox create</code> 模板的 <code>@goxjs/goxjs</code> 依赖仍为 <code>latest</code>。test262 C-4 批次（<code>String.prototype</code> 协议派发 + 参数 abrupt 传播）仍停在 <code>nightly/c4-20261113</code>（<strong>连续第四版无 CI 记录</strong>），未过闸合入 <code>main</code>，因此不在本版内容内（仅版本号推进）</li>
</ul>
</div>


<div class="rel-entry" id="v0-24-0">
<h2>v0.24.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-15</span><span class="rel-tag">工程化</span><span class="rel-tag">性能</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.24.0">Release</a></div>
<p class="rel-summary">节奏性发版（版本号推进）+ 性能对外口径定稿 —— 本版进入 <code>main</code> 的唯一变更是 <code>8656d39</code>（[T3-7] 对外口径落地）：<code>docs/performance.md</code> 新增 11-14 本机 + CI 双跑存档（<code>bench-20261114-122312</code> / <code>122404</code> / <code>perf-stress-20261114-122532</code>），「解释器性能达 goja 同级」这条验收项<strong>首次翻绿</strong> —— <code>fib28</code> 纯计算口径 gox/goja = <strong>1.22×</strong>（247 / 203 ms，CI runner），首次落进 §3.1 的 ×1.25 阈值（历史轨迹 2.39× → 1.7× → 1.32× → 1.22×）；<code>README.md</code> / <code>README.en.md</code> 的性能表由 10-28 旧基线整体换成 11-14 CI 四栈快照，结论改为「纯计算达 goja 同级」，bun / node 对比数字一律附「纯解释器 vs JIT」免责段；对 node 的 3× 红线（CI 原值口径 247/36 ≈ <strong>6.9×</strong>）<strong>仍未达标</strong>，文档里如实注明启动噪声主导、红线口径待重议，不粉饰</p>
<ul class="rel-points">
<li>引擎二进制与 <code>0.23.0</code> 除 <code>gox version</code> 打印的版本串外无差异</li>
<li>npm 主包与四个移动端子包同号推进到 <code>0.24.0</code>，<code>gox create</code> 模板的 <code>@goxjs/goxjs</code> 依赖仍为 <code>latest</code>。11-13 夜批的 test262 C-4 批次（<code>String.prototype</code> 协议派发 + 参数 abrupt 传播）仍在 <code>nightly/c4-20261113</code> 分支（该分支至今没有 CI 记录），未过闸合入 <code>main</code>，因此不在本版内容内（仅版本号推进）</li>
</ul>
</div>


<div class="rel-entry" id="v0-23-0">
<h2>v0.23.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-13</span><span class="rel-tag">发版节奏</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.23.0">Release</a></div>
<p class="rel-summary">节奏性发版（版本号推进）—— <code>0.22.0</code> 之后 <code>main</code> 上没有新的功能或修复提交，本版二进制与 <code>0.22.0</code> 除 <code>gox version</code> 打印的版本串外完全一致；npm 主包与四个移动端子包同号推进到 <code>0.23.0</code>，<code>gox create</code> 模板的 <code>@goxjs/goxjs</code> 依赖仍为 <code>latest</code></p>
<ul class="rel-points">
<li>11-13 夜批的 test262 C-4 批次（<code>String.prototype</code> 协议派发 + 参数 abrupt 传播）提交在 <code>nightly/c4-20261113</code> 分支，尚未过闸合入 <code>main</code>，因此不在本版内容内（仅版本号推进）</li>
</ul>
</div>


<div class="rel-entry" id="v0-22-0">
<h2>v0.22.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-12</span><span class="rel-tag">性能</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.22.0">Release</a></div>
<p class="rel-summary">虚拟机热点优化第三批（T3-4）—— 三笔改动都压在实测热路径上：① <code>globalThis</code> 的 memo 失效判据由「全局环境整体 version」改为<strong>按名字失效</strong>（<code>Environment</code> 新增 <code>globalThisVer</code> 专用计数器，只在 <code>name=="globalThis"</code> 的绑定写路径自增，<code>CopyTo</code> 等无名字路径无条件自增兜底；VM 侧比对 <code>GlobalThisVer</code> + <code>globals</code> 指针防跨环境串值），顶层循环里的 <code>t = add(t, i)</code> 全局赋值不再每轮打穿缓存、重做 <code>Get("globalThis")</code> 字符串查表；② <code>Stack.Pop</code> 去掉逐次接口槽 <code>nil</code> 清写 —— GC 只扫 <code>[0, len)</code>，弹栈留下的悬挂引用本不可见，真正要清的帧边界 <code>Truncate</code> / <code>unwindFramesTo</code> 一直是逐槽清零，此前每次 Pop 的 <code>nil</code> 写入都在白付写屏障（剖面上 Pop 合计约占 CPU 14%）；③ <code>addValues</code> / <code>binaryArithmetic</code> / <code>relationalCompare</code> 三个入口加「数字对数字」专用快路径，直接 double 运算，跳过 String×2 / Array / BigInt×2 的类型断言链与 <code>isTemporalValue</code> 的两次接口动态分派（<code>toNumber(*Number)</code> 即取值，语义逐位一致）</p>
<ul class="rel-points">
<li>本机 A/B（EPYC 9K65，runs=11 取中位，相对本批起点）<code>fib28</code> <strong>309.5ms → 280.1ms（-9.5%）</strong>、纯递归 <code>200×fib24</code> <strong>6505ms → 5718ms（-12.1%）</strong></li>
<li>夜批存档口径 <code>fib28</code> <strong>276ms</strong>、与 goja 原值比 <strong>1.14×</strong>（首次落进 1.25× 阈值，绝对值为本机口径，以 CI bench 复测为准）。test262 同快照逐用例 A/B（<code>2e58f87</code>）：language <strong>20580/23832 = 86.3545%</strong>、built-ins <strong>18057/23879 = 75.6187%</strong>、全量 <strong>38637/47711 = 80.9813%</strong>，<strong>零退潮、零转绿</strong></li>
<li>性能改动对合规面完全中性。另修正 <code>docs/performance.md</code> 里三处指向不存在提交的引用</li>
</ul>
</div>


<div class="rel-entry" id="v0-21-0">
<h2>v0.21.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-11</span><span class="rel-tag">test262</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.21.0">Release</a></div>
<p class="rel-summary">test262 C-4 批次清扫 —— 三条根因各带一批：① 编译器 <code>obj.m(...args)</code> / <code>obj<a href="...args">k</a></code> 带 spread 的成员调用此前落入通用裸调用路径、接收者丢失成 <code>undefined</code>，两个成员调用分支改走 <code>OP_CALL_METHOD_SPREAD</code>（arguments-object 族 +9、Temporal subclassing-ignored 族 +25，本批最大单根因）；② 解析器把 <code>1E+309</code> 这类超范围浮点字面量误判为语法错误（<code>ParseFloat</code> 的 <code>ErrRange</code> 被当成 parse error），改为按规范取 <code>±Infinity</code>（indexOf / lastIndexOf 整数极限族）；③ <code>stdlib/array</code>：<code>toSpliced</code> 在参数少于 2 个时 <code>args[2:]</code> 越界 panic（crash 级 4 例）、<code>copyWithin</code> 空数组早退跳过 <code>ToInteger</code> 且拷贝循环不查 get/set/delete 的 abrupt completion、<code>keys</code>/<code>values</code>/<code>entries</code> 补 <code>CreateArrayIterator</code> 泛型路径（任意对象含 resizable TypedArray 可作接收者、每次 <code>next</code> 动态读 length）</p>
<ul class="rel-points">
<li>A/B（同一 test262 快照，128 分片 × 32 并发）：language <strong>86.3125% → 86.3545%</strong>（20570→20580，+10）、built-ins <strong>75.3992% → 75.6590%</strong>（17991→18053，+62）、全量 <strong>80.8525% → 81.0035%</strong>（38561→38633，+72），三项逐用例 diff <strong>零退潮</strong></li>
</ul>
</div>


<div class="rel-entry" id="v0-20-0">
<h2>v0.20.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-10</span><span class="rel-tag">性能</span><span class="rel-tag">test262</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.20.0">Release</a></div>
<p class="rel-summary">全局变量访问提速（T3-4 第二批）—— 两笔虚拟机优化叠加：① <code>globalThis</code> 版本化缓存，消除 sloppy 模式下每次裸调用的 <code>Environment.Get("globalThis")</code> 字符串查表（pprof 显示该路径曾占 CPU ~14%）；② 全局内联缓存（IC）写后直通，<code>STORE_GLOBAL</code> 赋值不再整体打穿后续同名读，<code>t = add(t, i)</code> 这类顶层热循环免于每轮重填缓存</p>
<ul class="rel-points">
<li><code>fib28</code> 本机 A/B 中位 <strong>176ms → 155ms（-12.0%）</strong>，与 goja 比值 1.38× → 1.21×（纯解释器口径，最终以 CI runner 复测为准）。同时 test262 长尾归因收口：<code>--top 500 --depth 3</code> 聚出 438 簇、失败 5869 条，失败面由「大簇主导」转为「扁平长尾」（Top1 1708 条 / 11.15% → 256 条 / 4.36%），语义偏差 4372 条（74.5%）+ 功能零实现 1483 条（25.3%）</li>
<li>扣除不做项（Intl / Atomics / SharedArrayBuffer / BigInt，495 条）后可达天花板 <strong>97.93%</strong>，并给出 80% ≈ 28 人日 / 90% ≈ 98 人日 / 95% ≈ 170 人日的阶梯估时。合规率三口径零漂移：language <strong>86.3125%</strong> / built-ins <strong>75.4034%</strong> / 全量 <strong>80.8546%</strong></li>
<li>harness 依赖 369 → 0、crash 52 → 6、假阳性 20 → 8。工程化：bench 与 test262 进 PR 合并门（<code>fbcf4d6</code>）</li>
</ul>
</div>


<div class="rel-entry" id="v0-19-0">
<h2>v0.19.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-08</span><span class="rel-tag">性能</span><span class="rel-tag">折叠屏</span><span class="rel-tag">GPU</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.19.0">Release</a></div>
<p class="rel-summary">冷启动第一批 globals 惰性化 —— <code>Temporal</code>（~12%）与 TypedArray 家族（~11%）两棵几乎总不被最小脚本触碰的对象树改为按需物化：<code>Binding</code> 新增 lazy 字段与 <code>DeclareLazy</code>/<code>materialize</code>，名字立即声明占位（<code>BindingNames</code>/<code>typeof</code>/<code>hasOwnProperty</code> 可见性与立即声明逐位一致），首次 <code>Get</code> 才调工厂；五条写反射路径先物化，描述符语义不变；TypedArray 家族多名字共享工厂、物化时补齐 <code>length</code>/原型链/<code>@@species</code></p>
<ul class="rel-points">
<li>A/B（250×2 交错）：<code>startup_idle</code> 中位 <strong>-10.4%</strong>、min -12.6%、RSS -4.3%，早期探针 <code>3000×EvalFileVM</code> 累计 2.31s → 1.16s，fib28 / timers10k 噪声内无回归，test262 language 86.3125% 与基线逐位一致。折叠屏：<code>apps/foldable-demo</code> 收口为「一个窗口 + 形态栏 + 四个 Tab」，S1 由场景自身宽度信号驱动真重排、S2 折痕标尺 A/B（<code>avoidReserved="all"</code>）、S3 <code>isTabletop(posture, hinge)</code> 组合判据、S4 <code>screens()</code>/<code>screenOf()</code>/<code>bounds().displayId</code> 多屏示意，并生成 10 帧 30000ms 演示 GIF</li>
<li>顺手修掉两处内核缺陷（<code>reportPosture</code> 后 <code>avoidReserved</code> 不重算布局、结构槽位换支留残影）。GPU：三轨（nogpu / gpu / cgo）各一个 <code>TestBackendTrackReport</code> 钉住实际路径，新增 <code>gpu-track-audit.sh</code> 交叉编译抽查与 <code>gpu-present.yml</code> 无硬件兜底跑批</li>
<li>口径修正</li>
<li>窗口化上屏最后一跳尚未接 swapchain，离屏合成 + Readback 才是当前真实路径</li>
</ul>
</div>


<div class="rel-entry" id="v0-18-0">
<h2>v0.18.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-06</span><span class="rel-tag">test262</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.18.0">Release</a></div>
<p class="rel-summary">test262 C-3「crash 超时挂死」清扫完成 —— 一条根因带动一批：数组索引按规范判据（0…2^32-2 规范整数）分流，越界落普通属性、超密实上限如实抛 <code>RangeError</code> 快失败，不再物化 2^32 元素吃爆内存；<code>Array.length</code> 写入补 ToUint32≠ToNumber 校验；<code>arraySpeciesCreate</code> 补长度上限校验；<code>Promise</code> 自解析检查前移到 pending 分支之前（此前永不可达，<code>resolve-self</code> 族永久挂死）；迭代器 helper（<code>forEach</code>/<code>some</code>/<code>every</code>/<code>find</code>/<code>includes</code>）由 eager 收集改惰性驱动 + 短路即 <code>IteratorClose</code>；迭代器 <code>next()</code>/<code>value</code> getter 抛错不再被吞成 <code>(undefined, not-done)</code>；<code>JSON.stringify</code> 环检测由静态 <code>hasCycle</code> 改递归路径栈，覆盖 <code>toJSON</code>/<code>replacer</code> 动态造环；<code>unshift</code> 空参、<code>replaceAll</code> 空匹配两处死循环修复</p>
<ul class="rel-points">
<li>A/B：超时挂死 <strong>83 → 6</strong>、crashed 0，built-ins <strong>75.08% → 75.40%</strong>（17914 → 17992，+78）、全量 80.69% → 80.85%，language 86.3125% 逐位持平零回归</li>
<li>批末地板抬升 language 85.0 → 86.0125、built-ins 50.0 → 75.1034、全量 80.0 → 80.5546</li>
</ul>
</div>


<div class="rel-entry" id="v0-17-0">
<h2>v0.17.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-04</span><span class="rel-tag">性能</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.17.0">Release</a></div>
<p class="rel-summary">通用帧 Locals 随帧池化复用（<code>acquireFrame</code> 命中即复用底层数组、命中时清零保 TDZ 语义，四条逃逸路径用闭包空判定 + 生成器前导帧判定 + 底层指针判等逐一拦下，容量 &gt;512 的病态大帧不入池）—— fib28 堆分配 <strong>-88%</strong>、wall <strong>418ms → 341ms（-18%）</strong>；冷启动 <code>splitDots</code> 由逐字符拼接改为 <code>IndexByte</code> 子串切分，<code>SetupGlobals</code> 每次少约 4 万次小分配，启动 10ms → 9ms；test262 基线随 <code>2b499cc</code> 刷新，language 86.3% 守住批次地板</p>
</div>


<div class="rel-entry" id="v0-16-0">
<h2>v0.16.0</h2>
<div class="rel-meta"><span class="rel-date">2026-11-02</span><span class="rel-tag">语言</span><span class="rel-tag">test262</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.16.0">Release</a></div>
<p class="rel-summary"><code>ArrayBuffer.prototype.transfer</code> / <code>transferToFixedLength</code>（ES2024）落地 —— 分离转移语义与 TypedArray 视图同步；test262 口径核销完成：<code>docs/test262-gate.md</code> 成为合规率唯一权威口径，批次地板（language 85% / built-ins 50% / 全量 80%）进 CI 闸门（<code>test262-gate-floors.json</code> + <code>check-compliance.py</code> 强化），未登记 harness 全部登记、skipped 归零；现编现跑 language 86.3%、built-ins 75.1%、全量 80.7%</p>
</div>


<div class="rel-entry" id="v0-15-34">
<h2>v0.15.34</h2>
<div class="rel-meta"><span class="rel-date">2026-10-30</span><span class="rel-tag">GUI</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.15.34">Release</a></div>
<p class="rel-summary">新增 <code>apps/devtools/</code> 交互式 GUI 调试面板（Inspector v2，纯脚本零内核改动）：元素树展开/选中/多窗口切换、按 path 回查节点 props 与布局盒、console 留存级别过滤、<code>devEval</code> 跨调用保持状态的 REPL（历史 100 条）、<code>devSnapshot</code> 性能摘要行；纳入 apps 无头冒烟套件</p>
</div>


<div class="rel-entry" id="v0-15-30">
<h2>v0.15.30 ~ 0.15.33</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">test262</span><span class="rel-tag">工程化</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.15.30 ~ 0.15.33">Release</a></div>
<p class="rel-summary">补丁系列：test262 批次 23~26 + 发版流水线三处修订</p>
<ul class="rel-points">
<li>引擎：test262 批次 23~26 入库（正则 unicodeSets <code>v</code> 标志、闭包外层绑定读取走活 binding cell、<code>Number.prototype.toString</code> 任意进制最短往返、<code>Math.f16round</code>（ES2024）、<code>Error.prototype</code> 原型链装配与实例 <code>name</code>/<code>message</code> 覆写语义），built-ins 合规率 73.9% → 75.0%。工程化：<code>release.yml</code> 判重升级为包级 <code>versions</code> 列表交叉核对（防单条 <code>npm view</code> 抖动误判未发布）</li>
<li><code>pages.yml</code> 版本闸门修订</li>
<li>官网自身两处展示（<code>config.mts</code> ↔ 首页）保持硬闸门，npm 主包漂移降级为 warning，不再每晚必红</li>
<li><code>gox create</code> 脚手架的 <code>@goxjs/goxjs</code> 依赖由钉死 <code>^0.5.0</code> 改为 <code>latest</code>（新建工程直接跟随 npm 最新发布）</li>
</ul>
</div>


<div class="rel-entry" id="v0-15-18">
<h2>v0.15.18 ~ 0.15.29</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">test262</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.15.18 ~ 0.15.29">Release</a></div>
<p class="rel-summary">补丁系列：test262 批次 17~22 + 引擎与平台壳成对发布闸门</p>
<ul class="rel-points">
<li>补丁系列：test262 批次 17~22 持续入库（Map/Set 迭代器 next 补齐、Promise.allKeyed / allSettledKeyed、thenable 采纳、Date setter 族参数强转修复，built-ins 合规率 71.1% → 73.9%）</li>
<li>引擎与平台壳成对发布闸门对齐（engineVersionRange 0.15.x）</li>
</ul>
</div>


<div class="rel-entry" id="v0-15-1">
<h2>v0.15.1 ~ 0.15.17</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">test262</span><span class="rel-tag">移动端</span><span class="rel-tag">性能</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.15.1 ~ 0.15.17">Release</a></div>
<p class="rel-summary">补丁系列：test262 批次 11~16 + 移动端 libgox 双 ABI 重建</p>
<ul class="rel-points">
<li>补丁系列：test262 批次 11~16 持续入库（含 Map/Set 品牌检查）</li>
<li>移动端 libgox 双 ABI NDK 从零重建兑付、density 渲染换算落地</li>
<li>性能收益保持复核（fib28 ~211ms）</li>
<li>C11 SAB.prototype 台账订正</li>
</ul>
</div>


<div class="rel-entry" id="v0-15-0">
<h2>v0.15.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">test262</span><span class="rel-tag">折叠屏</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.15.0">Release</a></div>
<p class="rel-summary">language 合规率跨过 97%，foldable 适配链路成型</p>
<ul class="rel-points">
<li><strong>test262 <code>language</code> 合规率提到 97%</strong>（较 0.14.x 的 85.6% 再提 11.4pp）</li>
<li><code>gfx/hostbridge</code> 收敛三端宿主协议，宿主契约测试在桌面即可跑</li>
<li>修折叠态回归两个结构性缺陷（APK 缺 x86_64 ABI、skip 闸门从未生效）</li>
<li>三端回归矩阵改探测式、消除 runner 环境硬编码</li>
<li><code>parser</code> / <code>object</code> / <code>gfx</code> 一批修复（props 不再为 null、children 双通道、正则 <code>\u</code> 转义、undefined 键视同没给）</li>
</ul>
</div>


<div class="rel-entry" id="v0-14-1">
<h2>v0.14.1</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><span class="rel-tag">折叠屏</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.14.1">Release</a></div>
<p class="rel-summary">X11 修复与折叠屏适配落地，官网首页示例同步换成自适应列表页</p>
<ul class="rel-points">
<li>X11 后端修复（PutImage 行带切分、事件 type-switch 值类型）</li>
<li>权限三端语义对齐（spec 写死 + mock 穷举）</li>
<li>折叠屏适配落地：foldable_demo 示例、20 轮生命周期回归、适配教程</li>
<li>README 首屏示例改为单双栏自适应列表页、新增英文版 README.en.md</li>
<li>三端回归矩阵进 CI</li>
</ul>
</div>


<div class="rel-entry" id="v0-14-0">
<h2>v0.14.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.14.0">Release</a></div>
<p class="rel-summary">JSX 插值子节点自动响应式，写法更接近 Solid</p>
<ul class="rel-points">
<li>JSX 插值子节点自动响应式（Solid 语义）：<code>&lt;text&gt;count: { count()}&lt;/text&gt;</code> 在解析期自动包成函数子节点，不再需要 <code>{() =&gt; …}</code> 手写闭包</li>
<li>常量 / 显式函数 / 裸标识符三类不包</li>
<li><code>gox lint</code> 的 <code>snapshot-child</code> 改抓手写 <code>h()</code> 快照</li>
</ul>
</div>


<div class="rel-entry" id="v0-13-0">
<h2>v0.13.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.13.0">Release</a></div>
<p class="rel-summary">Prism 设计系统落地，GUI 组件整体重绘一遍</p>
<ul class="rel-points">
<li>Prism 设计系统（S0–S8）：GUI 基础组件全面重设计</li>
<li>设计 token 分层（语义色 / 组件色 / prism 预设）、控件细节（滑块胶囊轨道与大旋钮、字段行高 36、表格列宽自适应、抽屉/弹窗真实阴影与动画心跳）、反馈组件（spinner 环形动画 / skeleton 色彩插值 / reduced-motion 支持）、触控模式命中区放大与密度常量统一</li>
</ul>
</div>


<div class="rel-entry" id="v0-12-0">
<h2>v0.12.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><span class="rel-tag">性能</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.12.0">Release</a></div>
<p class="rel-summary">光栅链路接上覆盖率抗锯齿，斜线与圆弧不再硬边</p>
<ul class="rel-points">
<li>光栅链路接上覆盖率抗锯齿：斜线 / 圆弧 / 环带不再是硬边（<code>fillRingAA</code> / <code>fillDiscAA</code> 等 AA 图元）</li>
</ul>
</div>


<div class="rel-entry" id="v0-11-0">
<h2>v0.11.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><span class="rel-tag">媒体</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.11.0">Release</a></div>
<p class="rel-summary">媒体组件真的能播；GPU 呈现后端原型开工</p>
<ul class="rel-points">
<li>媒体组件真的能播：<code>&lt;video&gt;</code> / <code>&lt;audio&gt;</code> 配上 <code>gfx/softmedia</code> 软件媒体后端（视频 GIF / MJPEG，音频 WAV + PulseAudio，Linux 默认构建启用），<code>&lt;audio&gt;</code> 为新标签、<code>&lt;video&gt;</code> 新增 <code>fit</code>，缺能力依旧诚实降级</li>
<li><code>gx/datav</code> 大屏可视化组件库</li>
<li>GPU 呈现后端原型（<code>-tags gpu</code>，实验轨）</li>
<li><code>for...in</code> 解构绑定</li>
<li>折叠屏四场景演示应用</li>
</ul>
</div>


<div class="rel-entry" id="v0-10-0">
<h2>v0.10.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">折叠屏</span><span class="rel-tag">GUI</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.10.0">Release</a></div>
<p class="rel-summary">折叠屏适配 API 落地，三端宿主接上姿态上报</p>
<ul class="rel-points">
<li>折叠屏适配：<code>gx/screen</code> 的 <code>posture</code> / <code>hinge</code> / <code>regions</code> / <code>splitRatio</code> / <code>hingeOrientation</code> 读数，<code>gx/viewport</code> 的 <code>reservedRegions</code> / <code>hasFold</code> / <code>layoutMode</code> / <code>widthClass</code>，opt-in 的 <code>avoidReserved</code> 折痕避让</li>
<li>Android / iOS / 鸿蒙三端宿主均已接姿态上报</li>
<li><code>scroll vlist</code> 虚拟化长列表</li>
<li>三档断点（compact / medium / expanded）</li>
</ul>
</div>


<div class="rel-entry" id="v0-9-0">
<h2>v0.9.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><span class="rel-tag">工具链</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.9.0">Release</a></div>
<p class="rel-summary">数据展示与反馈组件成批落地，主题系统可用</p>
<ul class="rel-points">
<li><code>table</code> / <code>tree</code> / <code>list-item</code> 数据展示组件、<code>tabs</code> 选项卡、<code>tooltip</code> 悬停提示</li>
<li>设计 token 与主题系统（32 项颜色 token、暗色预设、运行时切换）</li>
<li><code>gx/update</code> v1.1 自动更新（流式下载 / 断点续传 / 进度回调 / pre 通道）</li>
<li><code>gox create --ts</code> TypeScript / TSX 模板</li>
<li><code>var</code> 声明与 class 表达式</li>
<li>运行时错误带源码帧定位</li>
</ul>
</div>


<div class="rel-entry" id="v0-8-0">
<h2>v0.8.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">test262</span><span class="rel-tag">工具链</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.8.0">Release</a></div>
<p class="rel-summary">test262 流水线与性能基准 harness 上线</p>
<ul class="rel-points">
<li>Test262 合规率流水线（定时跑 language 套件、徽章自动回写）</li>
<li><code>gox vs node</code> 性能基准 harness</li>
<li>压力与帧预算测试（万级定时器风暴 / 并发 fetch / 489 节点渲染预算）</li>
<li>3 个示例应用（TODO / 仪表盘 / 贪吃蛇）</li>
<li>计算属性名</li>
<li>滚动条可拖拽与横向滚动</li>
</ul>
</div>


<div class="rel-entry" id="v0-7-0">
<h2>v0.7.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">工具链</span><span class="rel-tag">移动端</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.7.0">Release</a></div>
<p class="rel-summary">签名与打包链路打通，移动端构建自动化</p>
<ul class="rel-points">
<li><code>gox cert</code> 一键生成各平台签名证书、<code>gox build android</code> 自动接入签名、<code>gox create</code> 生成 certs/ 目录</li>
<li><code>gox build macos --arch universal</code>（amd64+arm64 合并）</li>
<li>iOS 相册多选保序与 media.preview 多文件预览</li>
</ul>
</div>


<div class="rel-entry" id="v0-6-0">
<h2>v0.6.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">GUI</span><span class="rel-tag">工具链</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.6.0">Release</a></div>
<p class="rel-summary">macOS 窗口后端补齐，桌面三平台齐</p>
<ul class="rel-points">
<li>macOS 窗口后端 cocoa（桌面 GUI 三平台齐）；<code>gox dev</code> 热更新、<code>gox.json</code> 项目配置、<code>gox build</code> 统一构建入口</li>
</ul>
</div>


<div class="rel-entry" id="v0-5-0">
<h2>v0.5.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">原生能力</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.5.0">Release</a></div>
<p class="rel-summary">原生能力层六个模块一次性落地</p>
<ul class="rel-points">
<li>原生能力层六个内置模块（gx/device · gx/app · gx/geo · gx/media · gx/permission · gx/viewport）</li>
</ul>
</div>


<div class="rel-entry" id="v0-4-0">
<h2>v0.4.0</h2>
<div class="rel-meta"><span class="rel-date">—</span><span class="rel-tag">工具链</span><span class="rel-tag">GUI</span><a class="rel-link" href="https://github.com/14752222/Gox/releases/tag/vv0.4.0">Release</a></div>
<p class="rel-summary">脚手架与路由成为内置模块</p>
<ul class="rel-points">
<li>脚手架 <code>gox create</code>；路由 <code>gx/router</code> 与屏幕 <code>gx/screen</code> 成为内置模块</li>
</ul>
</div>

::: info 已知缺口
富文本（行内混排样式）尚未封装（虚拟化长列表已在 [`<scroll vlist>`](/components/layout#scroll) 落地）；原生能力层里依赖真机的部分（相机 / 定位 / 相册 / 权限）在桌面上诚实报 `unsupported`，移动端由平台壳工程提供（Android 已模拟器实测、iOS 待验收、鸿蒙仍是桩）。逐项见[限制与常见误区](/components/limits)。
:::
