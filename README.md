
Play Lorenz Attractor
----

> Based on [Quatrefoil](https://github.com/Quatrefoil-GL/quatrefoil).

Live demo https://r.tiye.me/Quatrefoil-GL/play-lorenz-attractor/

Video demo https://www.bilibili.com/video/BV1Uw411d79p

### Workflow

https://github.com/Quatrefoil-GL/quatrefoil-workflow

### Development and migration

Use Calcit/procs 0.30.1, Caps 0.1.1, Node 24 and Yarn 4.18.0. Dependencies use
published module tags, strict Caps resolution and immutable Yarn installation.
Maintain calcit.cirru/deps.cirru; generated js-out is ignored. The old editor
source and retired compact.cirru remain recoverable from Git history.

```sh
caps --strict --ci
yarn install --immutable
caps verify --toolchain
yarn compile
yarn dev
```

For live source compilation, run `calcit -w js` in a separate terminal.

Euler equations, initial coordinates and the original 600000-point default
remain unchanged. Native replay passes initial steps, xyz scaling, reset
configuration, odd-sized segment tails and the full original default count.
The b control now writes b rather than the unused ab key, with a real browser
parameter update and corresponding curve change verified.

All 208 definitions and the complete strict gate pass. Mobile detection is an
explicit JS binding with a declared host method and explicit host nullability;
desktop/iPhone/iPad cases passed during the previous 0.29.3 migration. The current
0.30.0 default application starts and refreshes without browser errors. Previous control tests
used an ignored source copy with phone UA input and closer camera framing only;
production scale/camera and point count were not changed. VR/gamepad and actual
mobile hardware performance were not tested. Eight open type positions remain
in five definitions; this is not a claim of complete type closure.

`VITE_BASE_URL` sets the CDN base, defaulting to relative assets. The workflow
uses full gates and COS v1.2.0 built-in public-base-url verification, with no
separate upload verifier. PR prefixes are isolated; only main uses the original
rsync destination. Verify actual Actions/COS and production deployment before
declaring deployment acceptance; local build results alone are insufficient.

### 本轮使用者影响

配对升级正式 Calcit/procs 0.30.1、Quatrefoil 0.1.10、Quaternion 0.2.16、
Touch Control 0.0.32、Pointed Prompt 0.0.20；传递 JS FFI 为 0.2.5。
上轮迁移的公开 Option 方法和显式 some/none 分支保留。
Euler 方程、初始坐标、原 600000 点默认值、相机、分段和重置参数未改；
`hud!` 的页面报错与成功提示也保留，没有改成 `raise`。

原临时数学回放收为 `gen-lorenz-seq` 的一个定义附着测试，包含五个断言：
首步缩放、第二步 Euler 数值、完整 600000 点数量、奇数分段尾部和重置 size。
CI 复用 Calcit 0.30.1 已发布的 runner，在 native/JS 执行同一份测试，
不另建验证脚本或框架；完整 strict 的失败状态/诊断会使 CI 失败。
测试不代表 VR/gamepad、移动硬件性能或移动端参数拖动已经重新验收。
COS 仅用 action 内建校验；PR 上传隔离前缀，原生产路径不变。

### License

MIT
