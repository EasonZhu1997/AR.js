# AR.js 项目部署指南

## 项目概述
AR.js 是一个轻量级的Web增强现实库，支持图像跟踪、基于位置的AR和标记跟踪等功能。

## 部署步骤

### 1. 环境要求
- Node.js (推荐 v16 或更高版本)
- npm 或 yarn

### 2. 安装依赖
```bash
npm install
```

### 3. 构建项目
```bash
# 生产环境构建
npm run build

# 开发环境构建（带监听模式）
npm run build:dev
```

### 4. 构建输出文件

#### A-Frame 版本 (aframe/build/)
- `aframe-ar.js` - 标记跟踪 + 基于位置的AR
- `aframe-ar-nft.js` - 图像跟踪 + 基于位置的AR  
- `aframe-ar-location-only.js` - 仅基于位置的AR
- `aframe-ar-new-location-only.js` - 新版基于位置的AR

#### Three.js 版本 (three.js/build/)
- `ar.js` - AR.js 命名空间
- `ar-threex.js` - 图像跟踪 + 标记跟踪
- `ar-threex-location-only.js` - 仅基于位置的AR

### 5. 本地测试
```bash
# 启动本地服务器
npm run server
```
服务器将在 http://localhost:8080 启动

### 6. 生产部署

#### 选项1: 静态文件托管
将以下目录部署到任何静态文件服务器：
- `aframe/build/` - A-Frame 构建文件
- `three.js/build/` - Three.js 构建文件
- `aframe/examples/` - 示例文件
- `three.js/examples/` - 示例文件

#### 选项2: CDN 部署
使用 GitHub Pages 或其他 CDN 服务：
```html
<!-- A-Frame 版本 -->
<script src="https://raw.githack.com/AR-js-org/AR.js/master/aframe/build/aframe-ar.js"></script>

<!-- Three.js 版本 -->
<script src="https://raw.githack.com/AR-js-org/AR.js/master/three.js/build/ar-threex.js"></script>
```

#### 选项3: npm 包
```bash
npm install @ar-js-org/ar.js
```

### 7. 使用示例

#### 基本 A-Frame 使用
```html
<!DOCTYPE html>
<html>
<head>
    <script src="https://aframe.io/releases/1.6.0/aframe.min.js"></script>
    <script src="aframe/build/aframe-ar.js"></script>
</head>
<body style="margin: 0; overflow: hidden;">
    <a-scene embedded arjs="sourceType: webcam; debugUIEnabled: false;">
        <a-marker preset="hiro">
            <a-box position="0 0.5 0" material="color: yellow;"></a-box>
        </a-marker>
        <a-entity camera></a-entity>
    </a-scene>
</body>
</html>
```

#### 基本 Three.js 使用
```html
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
    <script src="three.js/build/ar-threex.js"></script>
</head>
<body>
    <script>
        // AR.js 代码
    </script>
</body>
</html>
```

### 8. 注意事项

- 确保在 HTTPS 环境下运行（生产环境要求）
- 移动设备需要摄像头权限
- 某些功能需要 WebGL 支持
- 图像跟踪需要预先训练的 NFT 文件

### 9. 故障排除

#### 常见问题
1. **构建失败**: 检查 Node.js 版本和依赖安装
2. **运行时错误**: 确保正确引入了依赖库
3. **性能问题**: 考虑使用代码分割和懒加载

#### 调试模式
在开发环境中启用调试：
```bash
npm run build:dev
```

### 10. 更多资源

- [官方文档](https://ar-js-org.github.io/AR.js-Docs/)
- [GitHub 仓库](https://github.com/AR-js-org/AR.js)
- [示例代码](aframe/examples/)

---

**部署完成！** 🎉

您的 AR.js 项目已成功构建并可以部署使用。
