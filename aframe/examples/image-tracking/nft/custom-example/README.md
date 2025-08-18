# 🎯 自定义 NFT 图像跟踪指南

## 📋 概述
本指南将帮助您创建自己的 NFT (Natural Feature Tracking) 图像跟踪应用。

## 🚀 快速开始

### 1. 训练新图像
访问以下在线工具训练您的图像：

- **AR.js NFT Marker Creator**: https://ar-js-org.github.io/AR.js/three.js/examples/marker-training/examples/generator.html
- **NFT Marker Creator**: https://carnaux.github.io/NFT-Marker-Creator/

### 2. 训练步骤
1. **准备图像**：
   - 高质量图像（建议 512x512 像素以上）
   - 图像应具有丰富的特征点
   - 避免纯色或重复图案

2. **上传训练**：
   - 上传图像到训练工具
   - 等待训练完成（通常需要几分钟）

3. **下载文件**：
   - `.fset` - 特征集文件
   - `.fset3` - 特征集3文件
   - `.iset` - 图像集文件

### 3. 文件放置
将训练好的文件放在此文件夹中：
```
custom-example/
├── your-image.fset      # 您的训练文件
├── your-image.fset3     # 您的训练文件
├── your-image.iset      # 您的训练文件
├── your-3d-model.gltf   # 您的3D模型
├── index.html           # 此HTML文件
└── README.md            # 此说明文件
```

## 🔧 配置修改

### 修改 HTML 文件
在 `index.html` 中找到以下部分并修改：

```html
<!-- 修改图像名称 -->
<a-nft
    type="nft"
    url="your-image"  <!-- 改为您的图像名称（不包含扩展名） -->
    smooth="true"
    smoothCount="10"
    smoothTolerance=".01"
    smoothThreshold="5">
    
    <!-- 修改3D模型 -->
    <a-entity
        position="50 150 0"
        scale="5 5 5"
        gltf-model="your-3d-model.gltf">  <!-- 改为您的3D模型文件名 -->
    </a-entity>
</a-nft>
```

### 参数说明
- `url`: 您的图像名称（不包含 .fset 等扩展名）
- `smooth`: 是否启用平滑跟踪
- `smoothCount`: 平滑帧数
- `smoothTolerance`: 平滑容差
- `smoothThreshold`: 平滑阈值

## 📱 测试方法

### 1. 本地测试
- 访问: http://localhost:8080/aframe/examples/image-tracking/nft/custom-example/
- 在桌面浏览器中查看基本功能

### 2. 移动设备测试
- 在手机或平板电脑上访问相同地址
- 允许摄像头权限
- 将摄像头对准您训练的图像
- 应该能看到3D模型出现在图像上

## 🎨 3D 模型支持

### 支持的格式
- **GLTF/GLB**: 推荐格式，支持动画和材质
- **OBJ**: 基本几何体
- **DAE**: Collada 格式
- **PLY**: 点云数据

### 模型要求
- 文件大小建议小于 10MB
- 面数建议少于 100,000 面
- 纹理分辨率建议 1024x1024 以下

## 🐛 常见问题

### 1. 图像无法识别
- 检查训练文件是否正确放置
- 确保图像质量足够高
- 检查光照条件是否与训练时相似

### 2. 3D 模型不显示
- 检查模型文件路径是否正确
- 确认模型格式是否支持
- 检查模型是否过大

### 3. 跟踪不稳定
- 调整 `smoothCount` 和 `smoothTolerance` 参数
- 改善环境光照
- 确保图像特征丰富

## 📚 进阶功能

### 1. 多图像跟踪
```html
<a-nft url="image1">
    <a-box position="0 0 0" color="red"></a-box>
</a-nft>
<a-nft url="image2">
    <a-sphere position="0 0 0" color="blue"></a-sphere>
</a-nft>
```

### 2. 交互事件
```html
<a-nft url="your-image">
    <a-box 
        position="0 0 0" 
        color="red"
        animation="property: rotation; to: 0 360 0; dur: 2000; loop: true"
        onclick="alert('点击了模型！')">
    </a-box>
</a-nft>
```

### 3. 动态加载
```javascript
// 动态加载NFT图像
const nftEntity = document.querySelector('a-nft');
nftEntity.setAttribute('url', 'new-image');
```

## 🔗 相关资源

- [AR.js 官方文档](https://ar-js-org.github.io/AR.js-Docs/)
- [A-Frame 文档](https://aframe.io/docs/)
- [NFT 训练工具](https://carnaux.github.io/NFT-Marker-Creator/)
- [3D 模型资源](https://sketchfab.com/)

## 📞 技术支持

如果遇到问题，请：
1. 检查浏览器控制台错误信息
2. 确认所有文件路径正确
3. 参考 AR.js 官方文档
4. 在 GitHub 上提交 Issue

---

**祝您使用愉快！** 🎉
