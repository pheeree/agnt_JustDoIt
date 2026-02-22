# 🛠️ 환경설정 가이드

Just Do It Agent를 사용하기 위한 개발 환경 설정 가이드입니다.

---

## 📋 필수 요구사항

| 도구                  | 최소 버전 | 용도               |
| --------------------- | --------- | ------------------ |
| **macOS**             | 12+       | 운영체제           |
| **Git**               | 2.30+     | 버전 관리          |
| **Homebrew**          | 4.0+      | 패키지 관리        |
| **GitHub CLI (`gh`)** | 2.0+      | GitHub 저장소 관리 |
| **Claude Code**       | 최신      | 에이전트 실행      |

---

## 1. Homebrew 설치

macOS용 패키지 관리자입니다. 터미널에서 실행:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

설치 후 셸 PATH에 추가:

```bash
# Apple Silicon (M1/M2/M3/M4)
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Intel Mac
echo 'eval "$(/usr/local/bin/brew shellenv zsh)"' >> ~/.zprofile
eval "$(/usr/local/bin/brew shellenv zsh)"
```

설치 확인:

```bash
brew --version
```

---

## 2. GitHub CLI 설치

```bash
brew install gh
```

설치 확인:

```bash
gh --version
```

---

## 3. GitHub 인증

```bash
gh auth login
```

인증 옵션 선택:
1. **GitHub.com** 선택
2. **HTTPS** 프로토콜 선택
3. **Login with a web browser** 선택
4. 표시되는 인증 코드를 브라우저에서 입력

인증 상태 확인:

```bash
gh auth status
```

---

## 4. Git 사용자 설정

커밋에 표시될 이름과 이메일을 설정합니다:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

현재 설정 확인:

```bash
git config --global --list
```

---

## 5. Claude Code 설치

[공식 문서](https://docs.anthropic.com/en/docs/claude-code)를 참고하여 설치합니다.

```bash
npm install -g @anthropic-ai/claude-code
```

---

## 6. 프로젝트 클론 및 사용

```bash
# 저장소 클론
gh repo clone pheeree/agnt_JustDoIt

# 글로벌 커맨드 설치 (모든 프로젝트에서 사용)
mkdir -p ~/.claude/commands
cp agnt_JustDoIt/.claude/commands/*.md ~/.claude/commands/

# 사용
cd your-project
claude
# 프롬프트에서: /justdoit 나만의 할일 관리 웹앱을 만들고 싶어
```

---

## 📌 자주 쓰는 `gh` CLI 명령어

### 저장소 관리

```bash
gh repo view                    # 현재 저장소 정보
gh repo view --web              # 브라우저에서 열기
gh repo list                    # 내 저장소 목록
gh repo clone <repo>            # 저장소 클론
```

### 이슈 관리

```bash
gh issue list                   # 이슈 목록
gh issue create --title "제목"   # 이슈 생성
gh issue close <number>         # 이슈 닫기
```

### PR 관리

```bash
gh pr list                      # PR 목록
gh pr create --title "제목"      # PR 생성
gh pr merge <number>            # PR 머지
gh pr checkout <number>         # PR 체크아웃
```

### 릴리스

```bash
gh release list                 # 릴리스 목록
gh release create v1.0.0        # 릴리스 생성
```

---

## 🔧 문제 해결

### `brew` 명령어를 찾을 수 없음

```bash
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
```

위 명령어를 `~/.zprofile`에 추가했는지 확인하세요.

### `gh auth` 인증 실패

```bash
gh auth logout
gh auth login
```

토큰을 재발급받으려면 로그아웃 후 다시 로그인하세요.

### Git 커밋 작성자 정보 오류

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git commit --amend --reset-author  # 마지막 커밋 수정
```

---

*💡 더 자세한 정보는 [GitHub CLI 공식 문서](https://cli.github.com/manual/)를 참고하세요.*
