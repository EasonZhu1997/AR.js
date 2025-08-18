#!/bin/bash

# AR.js 项目部署脚本
# 作者: AI Assistant
# 日期: $(date)

echo "🚀 开始部署 AR.js 项目..."

# 检查 Node.js 是否安装
if ! command -v node &> /dev/null; then
    echo "❌ 错误: 未找到 Node.js，请先安装 Node.js"
    exit 1
fi

# 检查 npm 是否安装
if ! command -v npm &> /dev/null; then
    echo "❌ 错误: 未找到 npm，请先安装 npm"
    exit 1
fi

echo "✅ 环境检查通过"
echo "📦 正在安装依赖..."

# 安装依赖
npm install

if [ $? -ne 0 ]; then
    echo "❌ 依赖安装失败"
    exit 1
fi

echo "✅ 依赖安装完成"
echo "🔨 正在构建项目..."

# 构建项目
npm run build

if [ $? -ne 0 ]; then
    echo "❌ 项目构建失败"
    exit 1
fi

echo "✅ 项目构建完成"

# 检查构建文件
echo "🔍 检查构建文件..."

BUILD_FILES=(
    "aframe/build/aframe-ar.js"
    "aframe/build/aframe-ar-nft.js"
    "three.js/build/ar-threex.js"
    "three.js/build/ar.js"
)

MISSING_FILES=()

for file in "${BUILD_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        MISSING_FILES+=("$file")
    fi
done

if [ ${#MISSING_FILES[@]} -gt 0 ]; then
    echo "⚠️  警告: 以下构建文件缺失:"
    for file in "${MISSING_FILES[@]}"; do
        echo "   - $file"
    done
else
    echo "✅ 所有构建文件检查通过"
fi

# 启动服务器
echo "🌐 启动本地服务器..."
echo "📱 服务器地址: http://localhost:8080"
echo "🧪 测试页面: http://localhost:8080/test-deployment.html"
echo ""
echo "💡 提示:"
echo "   - 按 Ctrl+C 停止服务器"
echo "   - 在浏览器中打开测试页面验证部署"
echo "   - 在移动设备上测试 AR 功能"
echo ""

# 启动服务器
npm run server
