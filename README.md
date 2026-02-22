# 🚀 Just Do It Agent

**생각만 많고 실행 못하는 당신을 위한 Claude Code 에이전트**

아이디어를 입력하면, 계획 수립 → GitHub 저장소 생성 → 프로젝트 셋업 → 다음 스텝 제안까지 자동으로 해줍니다.

> *"아이디어는 넘치는데, 첫 발을 못 떼겠다."*  
> 이 에이전트가 그 첫 발을 대신 떼어줍니다.

---

## 📦 설치

### 사전 요구사항

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) 설치 완료
- (선택) [GitHub CLI (`gh`)](https://cli.github.com/) — 저장소 자동 생성에 필요
  ```bash
  brew install gh
  gh auth login
  ```

### 방법 1: 글로벌 설치 (추천 ⭐)

모든 프로젝트에서 `/justdoit` 커맨드를 사용할 수 있습니다.

```bash
# 저장소 클론
git clone https://github.com/pheeree/agnt_JustDoIt.git

# 커맨드 파일을 글로벌 디렉토리에 복사
mkdir -p ~/.claude/commands
cp agnt_JustDoIt/.claude/commands/*.md ~/.claude/commands/
```

설치 후 아무 폴더에서나 `claude`를 실행하면 `/justdoit` 커맨드를 사용할 수 있습니다.

### 방법 2: 프로젝트별 설치

특정 프로젝트에서만 사용하고 싶을 때:

```bash
# 원하는 프로젝트 폴더로 이동
cd /path/to/your/project

# 커맨드 파일 복사
mkdir -p .claude/commands
cp /path/to/agnt_JustDoIt/.claude/commands/*.md .claude/commands/
```

### 방법 3: 헬퍼 스크립트 포함 설치

스캐폴딩 스크립트까지 함께 사용하고 싶을 때:

```bash
cd /path/to/your/project
cp -r /path/to/agnt_JustDoIt/.claude .claude
cp -r /path/to/agnt_JustDoIt/scripts scripts
cp -r /path/to/agnt_JustDoIt/templates templates
```

---

## ⚡ 사용법

### `/justdoit <아이디어>` — 메인 커맨드

Claude Code를 열고 아이디어를 입력하세요:

```
/justdoit 나만의 할일 관리 웹앱을 만들고 싶어
```

에이전트가 자동으로 5단계를 수행합니다:

| Phase                    | 설명                                               |
| ------------------------ | -------------------------------------------------- |
| 📋 **분석 & 계획**        | 아이디어 → 프로젝트명, 기술 스택, 핵심 기능 구조화 |
| 🔍 **실행 가능성 검토**   | MVP 범위 정의, 난이도/리스크 분석                  |
| 📂 **GitHub 저장소 생성** | `gh repo create`로 자동 생성                       |
| 🏗️ **프로젝트 스캐폴딩**  | 기술 스택에 맞는 파일/디렉토리 구조 생성           |
| 🚀 **다음 스텝 제안**     | 시간·난이도 포함 3~5개 액션 아이템                 |

### `/refine <피드백>` — 계획 수정

이미 만든 계획을 피드백으로 다듬습니다:

```
/refine 백엔드는 Python으로 바꾸고 싶어
```

### `/nextstep` — 다음 할 일 제안

현재 프로젝트의 진행 상황을 분석하고 다음에 할 일을 제안합니다:

```
/nextstep
```

---

## 📁 프로젝트 구조

```
agnt_JustDoIt/
├── .claude/commands/       # Claude Code 슬래시 커맨드
│   ├── justdoit.md         # 🎯 메인: 아이디어 → 프로젝트 생성
│   ├── refine.md           # 계획 수정
│   └── nextstep.md         # 다음 스텝 제안
├── .agents/workflows/      # 🌀 Antigravity 워크플로우
│   ├── justdoit.md         # 🎯 메인 (강화 버전)
│   ├── refine.md           # 계획 수정
│   ├── nextstep.md         # 다음 스텝 제안
│   ├── preview.md          # 🖥️ 브라우저 미리보기
│   ├── deploy.md           # 🚀 배포 자동화
│   └── issue.md            # 📋 GitHub Issues 일괄 생성
├── scripts/                # 헬퍼 스크립트
│   ├── create-repo.sh      # GitHub 저장소 생성 (gh CLI)
│   └── scaffold.sh         # 프로젝트 스캐폴딩 (6가지 타입)
├── templates/              # 템플릿
│   └── PROJECT_PLAN.md     # 계획서 템플릿
├── docs/                   # 문서
│   ├── SETUP_GUIDE.md      # 환경설정 가이드
│   └── SESSION_LOG.md      # 개발 세션 기록
├── CLAUDE.md               # Claude 컨텍스트
└── README.md
```

## 🌀 Antigravity 버전

Antigravity(Gemini) 환경에서도 동일한 에이전트를 사용할 수 있습니다.

### 추가 기능

| 워크플로우  | 설명                     | Claude Code에 없는 기능                    |
| ----------- | ------------------------ | ------------------------------------------ |
| `/justdoit` | 아이디어 → 프로젝트 생성 | 유사 프로젝트 웹 검색, 아키텍처 다이어그램 |
| `/refine`   | 계획 수정                | 자동 커밋 & 푸시                           |
| `/nextstep` | 다음 스텝 제안           | GitHub Issues 연동                         |
| `/preview`  | 브라우저 미리보기        | 🆕 dev 서버 → 브라우저 확인 → 스크린샷      |
| `/deploy`   | 배포 자동화              | 🆕 Vercel/Netlify 자동 배포                 |
| `/issue`    | 이슈 일괄 생성           | 🆕 PROJECT_PLAN → GitHub Issues             |

### 설치

```bash
# 워크플로우 파일을 프로젝트에 복사
mkdir -p .agents/workflows
cp /path/to/agnt_JustDoIt/.agents/workflows/*.md .agents/workflows/
```

## 🛠️ 지원하는 프로젝트 타입

`scaffold.sh` 스크립트가 지원하는 프로젝트 타입:

| 타입        | 생성되는 구조                              |
| ----------- | ------------------------------------------ |
| `web`       | `src/`, `package.json`, `index.html`, CSS  |
| `api`       | `src/routes/`, `server.js`, `package.json` |
| `cli`       | `src/commands/`, CLI 엔트리포인트          |
| `python`    | `src/`, `pyproject.toml`, 테스트           |
| `library`   | `src/`, `package.json`, 모듈 엔트리포인트  |
| `fullstack` | 프론트 + 백엔드 구조                       |

---

## 🤝 기여하기

1. 이 저장소를 Fork
2. 브랜치 생성 (`git checkout -b feature/amazing-feature`)
3. 커밋 (`git commit -m 'Add amazing feature'`)
4. Push (`git push origin feature/amazing-feature`)
5. Pull Request 생성

## 📄 라이선스

MIT License — 자유롭게 사용하세요!

---

*💡 "완벽한 계획보다 빠른 실행이 낫다. Just Do It!" 🚀*
