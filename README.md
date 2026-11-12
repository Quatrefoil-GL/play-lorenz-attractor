Play Lorenz Attractor
----

基于 Quatrefoil 的 Lorenz 吸引子可视化。
Live demo: https://r.tiye.me/Quatrefoil-GL/play-lorenz-attractor/
Video: https://www.bilibili.com/video/BV1Uw411d79p

### Calcit 0.42.0 使用说明

升级时配套使用正式 Calcit 与 `@calcit/procs` 0.42.0，重新安装依赖并构建。
本地开发若保留旧热重载会话，请刷新页面以重建状态。
首次载入仍使用 600000 点和缩放 4，点击重置仍使用 3000 点和缩放 1。

场景参数由六个数值字段组成。直接游标和旧 `:states` pair 仍可传入旧数值 Map，
缺字段或类型错误会在写入前拒绝。只有 `[:lorenz]` 游标能更新本页的场景参数。

### 历史：0.34.2 迁移

配对升级正式 Calcit CLI/procs 0.34.2、Quatrefoil 0.3.0、Quaternion 0.2.19、
Touch Control 0.0.36、Pointed Prompt 0.0.24，传递 JS-FFI 0.2.9。
轨迹生成结果从任意长度的 List Number 明确为三坐标 Tuple；分段函数改为真正保留元素
类型 T 的泛型，不限定输入必须为三维点，原单项列表分段调用继续支持。
Euler 方程、初始坐标、600000 点默认值、分段边界、相机和缩放均不变。
`hud!` 页面报错与成功提示保留，没有改成 raise。

通过官方 CLI 迁移类型形式，除格式之外，14 个原定义中仅三个有预期改动：
gen-lorenz-seq 的返回/循环合同及真实三项字面量标注、split-segments 的泛型合同及
局部返回提示、组件中分段回调的 Tuple 元素合同。原测试和 FFI 元数据保持不变。
共享 runner 对齐官方 0.34.2，native/JS 各执行原 1 项用例中的五个断言，无排除、无新框架。
完整 600000 点计数、两步 Euler 数值、原单项列表分段尾部和重置 size 均通过。

临时 Vite 内存检查使用真实 Three 和合成 32 点状态，两条各 16 点的线与原 Euler 输出一致，
重置回调仍派发同一 cursor，恢复原 size=3000。模块初始化使用 div/键盘监听占位，
记录 WebSocket 绑定限制和重复 Three 警告；不将它当作 DOM 命中、WebGL 绘制或控件交互验收。
最终 PR CI/COS 结果待远端执行，本轮不合并或部署应用。

### 开发与检查

使用 Caps 0.1.1、Node 24、Yarn 4.18.0，包龄明确为 60 分钟。
维护 calcit.cirru/deps.cirru，不提交生成目录或 compact.cirru。

```sh
caps --strict --ci
yarn install --immutable
caps verify --toolchain
yarn compile
yarn dev
```

需要监听源码时另开终端运行 `calcit -w js`。
完整 strict、208/208 定义、14/14 公开定义、工具链配对、immutable 安装和构建通过。
原数学测试在 native/JS 各 1/1、无排除：首步缩放、第二步 Euler 数值、
完整 600000 点数量、奇数分段尾部和重置 size。开放状态/派发类型仍保留，
不声称完整类型闭合。

此前 0.32.1 的实际 IAB 验收保留原默认相机与规模：初始曲线极小，使用原 w 键靠近后可见
完整双翼曲线，a 键改变视角，刷新恢复默认；控制台无警告/错误。
桌面初始取景改进见 [issue #8](https://github.com/Quatrefoil-GL/play-lorenz-attractor/issues/8)，不借本轮类型迁移改变 VR 世界坐标。
不宣称所有参数拖动、VR/gamepad、移动设备性能或跨 GPU 已验收。

VITE_BASE_URL 设置 CDN base，默认相对路径。COS v1.2.0 使用内置 public-base-url
校验，无独立上传校验脚本；PR 前缀隔离，main 才使用原 rsync 路径。
远端实际 Actions/COS 结果在 PR 记录，本地构建不代替部署验收。

Workflow: https://github.com/Quatrefoil-GL/quatrefoil-workflow

### License

MIT
