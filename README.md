
Play Lorenz Attractor
----

> Based on [Quatrefoil](https://github.com/Quatrefoil-GL/quatrefoil).

Live demo https://r.tiye.me/Quatrefoil-GL/play-lorenz-attractor/

Video demo https://www.bilibili.com/video/BV1Uw411d79p

### Workflow

https://github.com/Quatrefoil-GL/quatrefoil-workflow

### Development and migration

Use Calcit/procs 0.30.0, Caps 0.1.1, Node 24 and Yarn 4.18.0. Dependencies use
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

采用正式 Quatrefoil 0.1.8、Quaternion 0.2.14、Touch Control 0.0.31、
Pointed Prompt 0.0.19 与传递 JS FFI 0.2.3。10 处旧 Option helper 改为
公开方法或显式 some/none 分支；nil、缺失、默认值和字段检查行为保留。
Euler 方程、初始坐标、原 600000 点默认值、分段和重置参数未改。
完整 strict、原数学函数在旧/新正式图上的 native 回放、构建和默认浏览器启动
均通过；本轮未重做移动设备参数拖动，不拿旧验证当作当前交互验收。
正式 0.30.1 尚未发布，届时仍须配对升级。COS 仅用 action 内建校验，
未增加脚本、测试框架或编译器规则；原生产路径不变。

### License

MIT
