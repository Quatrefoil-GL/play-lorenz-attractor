Play Lorenz Attractor
----

基于 Quatrefoil 的 Lorenz 吸引子可视化。
Live demo: https://r.tiye.me/Quatrefoil-GL/play-lorenz-attractor/
Video: https://www.bilibili.com/video/BV1Uw411d79p

### 使用者影响

配对升级正式 Calcit CLI/procs 0.32.1、Quatrefoil 0.2.0、Quaternion 0.2.19、
Touch Control 0.0.35、Pointed Prompt 0.0.24，传递 JS-FFI 0.2.9。
类型标注通过官方 CLI 迁移；slice 终点按新合同以 Option :some 包装原值。
Euler 方程、初始坐标、600000 点默认值、分段边界、相机和缩放均不变。
`hud!` 页面报错与成功提示保留，没有改成 raise。

原 14 个项目定义中，仅 app.math/split-segments 的两处终点表达式变化；
schema、元数据和原附带测试未变。native/JS 继续执行相同的五项数学断言，
只将原共享 runner 对齐到已发布的 0.32.1，不新增验证框架或排除项。

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

实际 IAB 验收保留原默认相机与规模：初始曲线极小，使用原 w 键靠近后可见
完整双翼曲线，a 键改变视角，刷新恢复默认；控制台无警告/错误。
桌面初始取景改进见 [issue #8](https://github.com/Quatrefoil-GL/play-lorenz-attractor/issues/8)，不借本轮类型迁移改变 VR 世界坐标。
不宣称所有参数拖动、VR/gamepad、移动设备性能或跨 GPU 已验收。

VITE_BASE_URL 设置 CDN base，默认相对路径。COS v1.2.0 使用内置 public-base-url
校验，无独立上传校验脚本；PR 前缀隔离，main 才使用原 rsync 路径。
远端实际 Actions/COS 结果在 PR 记录，本地构建不代替部署验收。

Workflow: https://github.com/Quatrefoil-GL/quatrefoil-workflow

### License

MIT
