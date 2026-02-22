#!/bin/bash
# Just Do It Agent — GitHub 저장소 생성 스크립트
# Usage: ./create-repo.sh <repo-name> <description> [public|private]

set -e

REPO_NAME="${1:?❌ 저장소 이름을 입력해주세요. 사용법: ./create-repo.sh <이름> <설명> [public|private]}"
DESCRIPTION="${2:-"Just Do It! 🚀"}"
VISIBILITY="${3:-public}"

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Just Do It — GitHub 저장소 생성${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# gh CLI 설치 확인
if ! command -v gh &> /dev/null; then
    echo -e "${RED}❌ GitHub CLI(gh)가 설치되어 있지 않습니다.${NC}"
    echo ""
    echo "설치 방법:"
    echo "  macOS:  brew install gh"
    echo "  Ubuntu: sudo apt install gh"
    echo "  기타:   https://cli.github.com/"
    echo ""
    echo "설치 후 인증: gh auth login"
    exit 1
fi

# 인증 상태 확인
if ! gh auth status &> /dev/null; then
    echo -e "${RED}❌ GitHub에 로그인되어 있지 않습니다.${NC}"
    echo ""
    echo "다음 명령어로 로그인하세요:"
    echo "  gh auth login"
    exit 1
fi

# 현재 GitHub 사용자명 가져오기
GH_USER=$(gh api user --jq '.login' 2>/dev/null)
echo -e "${GREEN}✅ GitHub 인증 확인: ${GH_USER}${NC}"

# Visibility 플래그 설정
if [ "$VISIBILITY" = "private" ]; then
    VIS_FLAG="--private"
    VIS_LABEL="🔒 Private"
else
    VIS_FLAG="--public"
    VIS_LABEL="🌐 Public"
fi

echo -e "📂 저장소:   ${YELLOW}${REPO_NAME}${NC}"
echo -e "📝 설명:     ${DESCRIPTION}"
echo -e "👁️  공개범위: ${VIS_LABEL}"
echo ""

# 저장소 생성
echo -e "${BLUE}📦 저장소 생성 중...${NC}"
gh repo create "$REPO_NAME" $VIS_FLAG --description "$DESCRIPTION" --clone

echo ""
echo -e "${GREEN}✅ 저장소가 생성되었습니다!${NC}"
echo -e "📁 로컬 경로: $(pwd)/${REPO_NAME}"
echo -e "🔗 GitHub:    https://github.com/${GH_USER}/${REPO_NAME}"
echo ""
echo -e "${YELLOW}💡 다음 단계: cd ${REPO_NAME} && 개발 시작!${NC}"
