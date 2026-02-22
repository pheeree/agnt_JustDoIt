#!/bin/bash
# Just Do It Agent — 프로젝트 스캐폴딩 스크립트
# Usage: ./scaffold.sh <project-path> <type> [project-name]
# Types: web, api, cli, library, python, fullstack

set -e

PROJECT_PATH="${1:?❌ 프로젝트 경로를 입력해주세요. 사용법: ./scaffold.sh <경로> <타입> [프로젝트명]}"
PROJECT_TYPE="${2:?❌ 프로젝트 타입을 입력해주세요. (web|api|cli|library|python|fullstack)}"
PROJECT_NAME="${3:-$(basename "$PROJECT_PATH")}"

# 색상 정의
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${BLUE}🏗️  Just Do It — 프로젝트 스캐폴딩${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "📂 경로: ${YELLOW}${PROJECT_PATH}${NC}"
echo -e "📦 타입: ${CYAN}${PROJECT_TYPE}${NC}"
echo -e "📛 이름: ${PROJECT_NAME}"
echo ""

# 프로젝트 디렉토리 생성 (없으면)
mkdir -p "$PROJECT_PATH"
cd "$PROJECT_PATH"

# 공통 디렉토리 생성
create_common() {
    mkdir -p docs
    mkdir -p tests

    # .editorconfig
    cat > .editorconfig << 'EOF'
root = true

[*]
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
charset = utf-8
indent_style = space
indent_size = 2

[*.py]
indent_size = 4

[*.md]
trim_trailing_whitespace = false
EOF

    echo -e "${GREEN}  ✅ 공통 파일 생성 (.editorconfig, docs/, tests/)${NC}"
}

# Web 프로젝트
scaffold_web() {
    mkdir -p src/{components,styles,assets}

    cat > .gitignore << 'EOF'
node_modules/
dist/
.env
.env.local
*.log
.DS_Store
EOF

    cat > package.json << EOF
{
  "name": "${PROJECT_NAME}",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "echo 'TODO: 개발 서버 설정 필요'",
    "build": "echo 'TODO: 빌드 스크립트 설정 필요'",
    "test": "echo 'TODO: 테스트 프레임워크 설정 필요'"
  }
}
EOF

    cat > src/index.html << EOF
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${PROJECT_NAME}</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <div id="app">
        <h1>🚀 ${PROJECT_NAME}</h1>
        <p>Just Do It! 개발을 시작하세요.</p>
    </div>
    <script src="main.js"></script>
</body>
</html>
EOF

    cat > src/styles/main.css << 'EOF'
* { margin: 0; padding: 0; box-sizing: border-box; }
body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: #fff;
}
#app { text-align: center; padding: 2rem; }
h1 { font-size: 2.5rem; margin-bottom: 1rem; }
EOF

    touch src/main.js
    echo -e "${GREEN}  ✅ Web 프로젝트 스캐폴딩 완료${NC}"
}

# API 프로젝트 (Node.js)
scaffold_api() {
    mkdir -p src/{routes,middleware,models,utils}

    cat > .gitignore << 'EOF'
node_modules/
dist/
.env
*.log
.DS_Store
EOF

    cat > package.json << EOF
{
  "name": "${PROJECT_NAME}",
  "version": "0.1.0",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "node --watch src/server.js",
    "start": "node src/server.js",
    "test": "echo 'TODO: 테스트 프레임워크 설정 필요'"
  }
}
EOF

    cat > src/server.js << 'EOF'
// 🚀 Just Do It — API Server
// TODO: Express나 Fastify 등 프레임워크 설치 후 구현

console.log('🚀 서버 시작 준비 완료!');
console.log('TODO: npm install express 실행 후 서버 구현');
EOF

    echo -e "${GREEN}  ✅ API 프로젝트 스캐폴딩 완료${NC}"
}

# CLI 프로젝트
scaffold_cli() {
    mkdir -p src/{commands,utils}

    cat > .gitignore << 'EOF'
node_modules/
dist/
.env
*.log
.DS_Store
EOF

    cat > package.json << EOF
{
  "name": "${PROJECT_NAME}",
  "version": "0.1.0",
  "type": "module",
  "bin": {
    "${PROJECT_NAME}": "./src/cli.js"
  },
  "scripts": {
    "start": "node src/cli.js",
    "test": "echo 'TODO: 테스트 프레임워크 설정 필요'"
  }
}
EOF

    cat > src/cli.js << 'EOF'
#!/usr/bin/env node
// 🚀 Just Do It — CLI Entry Point

console.log('🚀 CLI 앱 시작 준비 완료!');
console.log('TODO: commander 또는 yargs 설치 후 구현');
EOF
    chmod +x src/cli.js

    echo -e "${GREEN}  ✅ CLI 프로젝트 스캐폴딩 완료${NC}"
}

# Python 프로젝트
scaffold_python() {
    mkdir -p src/"${PROJECT_NAME//-/_}"
    mkdir -p tests

    cat > .gitignore << 'EOF'
__pycache__/
*.py[cod]
*.so
.env
venv/
.venv/
dist/
build/
*.egg-info/
.DS_Store
EOF

    cat > pyproject.toml << EOF
[project]
name = "${PROJECT_NAME}"
version = "0.1.0"
description = ""
requires-python = ">=3.9"
dependencies = []

[project.optional-dependencies]
dev = ["pytest", "ruff"]
EOF

    PKG_NAME="${PROJECT_NAME//-/_}"
    cat > "src/${PKG_NAME}/__init__.py" << 'EOF'
"""🚀 Just Do It!"""
EOF

    cat > "src/${PKG_NAME}/main.py" << 'EOF'
"""메인 엔트리포인트"""


def main():
    print("🚀 Just Do It! 개발을 시작하세요.")


if __name__ == "__main__":
    main()
EOF

    cat > tests/test_main.py << EOF
"""기본 테스트"""
from ${PKG_NAME}.main import main


def test_main():
    """main 함수가 에러 없이 실행되는지 확인"""
    main()
EOF

    echo -e "${GREEN}  ✅ Python 프로젝트 스캐폴딩 완료${NC}"
}

# Library 프로젝트
scaffold_library() {
    mkdir -p src lib

    cat > .gitignore << 'EOF'
node_modules/
dist/
.env
*.log
.DS_Store
EOF

    cat > package.json << EOF
{
  "name": "${PROJECT_NAME}",
  "version": "0.1.0",
  "type": "module",
  "main": "src/index.js",
  "exports": {
    ".": "./src/index.js"
  },
  "scripts": {
    "test": "echo 'TODO: 테스트 프레임워크 설정 필요'",
    "build": "echo 'TODO: 빌드 설정 필요'"
  }
}
EOF

    cat > src/index.js << 'EOF'
// 🚀 Just Do It — Library Entry Point

export function hello() {
  return '🚀 Just Do It!';
}
EOF

    echo -e "${GREEN}  ✅ Library 프로젝트 스캐폴딩 완료${NC}"
}

# Fullstack 프로젝트
scaffold_fullstack() {
    scaffold_web
    mkdir -p server/{routes,middleware,models}

    cat > server/index.js << 'EOF'
// 🚀 Just Do It — Backend Server
// TODO: Express나 Fastify 등 프레임워크 설치 후 구현

console.log('🚀 백엔드 서버 시작 준비 완료!');
EOF

    echo -e "${GREEN}  ✅ Fullstack 프로젝트 스캐폴딩 완료${NC}"
}

# 공통 파일 생성
create_common

# 타입별 스캐폴딩 실행
case "$PROJECT_TYPE" in
    web)       scaffold_web ;;
    api)       scaffold_api ;;
    cli)       scaffold_cli ;;
    python)    scaffold_python ;;
    library)   scaffold_library ;;
    fullstack) scaffold_fullstack ;;
    *)
        echo -e "${YELLOW}⚠️  알 수 없는 프로젝트 타입: ${PROJECT_TYPE}${NC}"
        echo "지원되는 타입: web, api, cli, library, python, fullstack"
        echo "기본 구조만 생성합니다."
        mkdir -p src
        ;;
esac

echo ""
echo -e "${GREEN}🎉 스캐폴딩 완료!${NC}"
echo -e "📂 ${PROJECT_PATH}"
echo ""
echo -e "${YELLOW}💡 이제 개발을 시작하세요! Just Do It! 🚀${NC}"
