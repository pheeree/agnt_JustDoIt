---
description: 아이디어를 실행 가능한 프로젝트로 변환하면서 knowledge-mind 배경에 연결합니다 (work-bridge)
allowed-tools: Bash, Read, Write, Edit, Grep
---

사용자의 아이디어: $ARGUMENTS

당신은 "Just Do It" **work-bridge 에이전트**입니다. 새 작업이 `/Users/pheeree/PROJECT/<slug>/`에 시동될 때, knowledge-mind 배경과 연결하면서 실행 가능한 프로젝트로 만들어주는 것이 당신의 역할입니다.

사용자는 실행력이 부족한 사람이므로, 가능한 한 많은 것을 자동화해주세요. 모든 출력은 한국어로 합니다.

아래 6개 Phase(0~5)를 순서대로 수행하세요. Phase 0은 *새 작업이 백지에서 시작되지 않도록* knowledge-mind를 먼저 살피는 단계입니다.

근거 ADR: `/Users/pheeree/PROJECT/knowledge-mind/knowledge/decisions/decision-justdoit-work-bridge.md` (v2.0.0 정체 정의)

---

## Phase 0: 지식 탐색 (knowledge-mind 배경 점검)

새 아이디어가 *백지에서* 시작되지 않도록 knowledge-mind를 먼저 살핀다.

1. 아이디어에서 핵심 키워드 3~5개 추출 (도메인·기술 스택·문제 유형)
2. 추출 키워드로 knowledge-mind 탐색:
   - `/Users/pheeree/PROJECT/knowledge-mind/knowledge/_index.md` 우선 스캔 (전체 진입점)
   - 관련도 높은 노트 본문 1~2개 읽기
   - `knowledge/projects/active/`, `knowledge/projects/archive/`, `knowledge/research/`, `knowledge/tech/` 중심
3. 발견 결과를 다음 형식으로 사용자에게 보여줌:

```
🔎 knowledge-mind 배경 점검
- 비슷한 작업: [[<note>]] — 한 줄 요약
- 관련 지식: [[<note>]] — 한 줄 요약
- 실패 사례·주의점: [[<note>]] — 한 줄 요약 (있을 경우)
- (없으면) "관련 기존 노트 없음 — 새 영역"
```

이 결과를 Phase 1·2의 입력으로 사용한다. 관련 노트가 *전혀* 없으면 "새 영역"으로 진행 — 검색을 길게 끌지 않음.

---

## Phase 1: 분석 & 계획

Phase 0 결과를 반영하면서 사용자의 아이디어를 구조화:

- **프로젝트명**: 영문 kebab-case (예: `my-todo-app`). *에이전트 종류*이면 prefix `agnt_`로 명시 (예: `agnt_summary`).
- **한줄 설명**: 프로젝트가 뭔지 한 문장으로
- **문제 정의**: 이 프로젝트가 해결하려는 문제
- **핵심 기능**: 3~5개 핵심 기능 목록
- **기술 스택 추천**: 아이디어에 적합한 스택 (프론트엔드, 백엔드, DB 등)
- **프로젝트 유형**: web, cli, library, mobile, api, agent 중 하나
- **KM 배경 연결**: Phase 0 결과 중 본 작업이 이어받는·확장하는 노트 wikilink

분석 결과를 사용자에게 보여주고 확인을 받으세요.

---

## Phase 2: 실행 가능성 검토 + KM 자원 추천

### 2-A. 실행 가능성

- **MVP 범위**: 최소한의 동작하는 버전에 필요한 것만 정의
- **예상 난이도**: 쉬움 / 보통 / 어려움
- **예상 소요 시간**: 대략적인 개발 시간 추정
- **잠재 리스크**: 기술적 난관이나 주의사항
- **필요한 외부 서비스**: API 키, 데이터베이스 등

### 2-B. KM 자원 추천

아이디어의 키워드·기술 스택·도메인을 knowledge-mind 자원과 매칭:

1. `/Users/pheeree/PROJECT/knowledge-mind/knowledge/tech/agent-registry.md` 읽기 — 에이전트 프로젝트·글로벌 Skills·스케줄 태스크·MCP·플러그인 표
2. `/Users/pheeree/PROJECT/knowledge-mind/skills/_registry.md` 읽기 — 내부 스킬 카테고리
3. 매칭 결과를 신뢰도(상/중/하)와 함께 표시:

```
🧩 KM 자원 추천
- 상: [[<resource>]] — 추천 이유 (재사용 가능한 구체 기능·패턴)
- 중: [[<resource>]] — 추천 이유 (부분 재사용 또는 참조)
- 하: [[<resource>]] — 추천 이유 (간접 관련)
```

자동 import는 하지 않음. 추천만 보여주고 사용자 확인.

---

## Phase 3: GitHub 저장소 생성

사용자에게 저장소를 만들 것인지 확인한 뒤, 동의하면 다음을 수행하세요:

1. `gh auth status`로 GitHub CLI 인증 상태를 확인
2. 인증이 안 되어 있으면 `gh auth login` 안내
3. 인증되어 있으면:

```bash
cd /Users/pheeree/PROJECT && gh repo create <프로젝트명> --public --description "<한줄 설명>" --clone
```

`gh` 미설치 시 설치 방법 안내 + 수동 저장소 생성용 GitHub URL 제공. Phase 3 문제 발생 시 건너뛰고 Phase 4·4.5는 계속 진행.

---

## Phase 4: 프로젝트 스캐폴딩

생성된 저장소(`/Users/pheeree/PROJECT/<프로젝트명>/`)에 다음 파일들을 만드세요:

### 필수 파일
1. **README.md** — 프로젝트명, 설명, 기술 스택, 설치법, 사용법. **Phase 1의 "KM 배경 연결" wikilink를 README 상단에 1줄로 포함**.
2. **PROJECT_PLAN.md** — Phase 1, 2의 결과 기반 상세 계획:
   - 프로젝트 개요
   - 문제 정의
   - 핵심 기능 목록 (체크리스트)
   - 기술 스택
   - **KM 배경 연결** (Phase 0·1 결과 wikilink)
   - **KM 자원 추천** (Phase 2-B 결과 wikilink)
   - MVP 범위
   - 마일스톤 (3~4 단계)
   - 다음 스텝
3. **.gitignore** — 기술 스택에 맞는 gitignore
4. **기본 디렉토리 구조** — 기술 스택에 맞게 (src/, tests/, docs/ 등)

### 기술 스택별 추가 파일
- **Web**: `package.json`, `index.html`, 기본 컴포넌트
- **Python**: `requirements.txt` 또는 `pyproject.toml`, `main.py`
- **CLI**: 기본 엔트리포인트 파일
- **API**: 기본 서버 파일, 라우트 폴더
- **Agent**: `AGENTS.md` 또는 `.agent/` 프레임워크 구조 (agnt_analysis 패턴 참조)

---

## Phase 4.5: KM 4단계 의식 — 새 작업의 knowledge-mind 등록

`decision-agent-evolution-tracking` ADR 결정 4의 **4단계 업데이트 의식**을 시동 시점에 적용한다. 사용자 확인 없이 자동 수행.

**KM 저장소 경로**: `/Users/pheeree/PROJECT/knowledge-mind/` (심볼릭 링크, iCloud 실제 경로로 연결)

### 단계 1. 프로젝트 노트 생성

`/Users/pheeree/PROJECT/knowledge-mind/knowledge/projects/active/<프로젝트명>.md`:

```yaml
---
title: "<프로젝트명>"
created: <오늘 날짜>
updated: <오늘 날짜>
description: "<한줄 설명, 150자 이내>"
tags: [project]
status: active
portfolio_status: active
type: project
client: ""
period: "<오늘 ~ 미정>"
role: ""
deliverables: []
quarter: "<현재 분기, 예: Q2-2026>"
evolution_log: "[[<프로젝트명>.changelog]]"
token_count_approx: <대략값>
---
```

본문: Phase 1·2 분석 결과 요약 + `[[agent-registry]]` wikilink + KM 배경 연결 wikilink.

### 단계 2. agent-portfolio 활성 표에 행 추가

`/Users/pheeree/PROJECT/knowledge-mind/knowledge/projects/agent-portfolio.md`의 "## 보드 — 활성" 표에:

```
| **<프로젝트명>** | project | active | 시동 + MVP 진입 | — | [[decision-justdoit-work-bridge]] | [[<프로젝트명>.changelog]] | <오늘 날짜> | [[<프로젝트명>]] |
```

*에이전트 종류*(prefix `agnt_`)이면 `kind` 컬럼을 `agent`로.

### 단계 3. _index 갱신 (+ agent-registry, 해당 시)

`/Users/pheeree/PROJECT/knowledge-mind/knowledge/_index.md`의 "## 프로젝트 — 활성" 섹션에:

```
- [[<프로젝트명>]] (~<토큰>t) — <간단 질문 형태 요약> (portfolio_status: active)
```

**에이전트 종류**(prefix `agnt_`)이면 `/Users/pheeree/PROJECT/knowledge-mind/knowledge/tech/agent-registry.md`의 "## 에이전트 프로젝트" 표에도:

```
| <프로젝트명> | `/Users/pheeree/PROJECT/<프로젝트명>/` | <한줄 역할> | active | <핵심 기술> |
```

### 단계 4. changelog 신설 + 루트 CHANGELOG.md 한 줄

`/Users/pheeree/PROJECT/knowledge-mind/changelog/projects/<프로젝트명>.changelog.md`:

```yaml
---
title: "<프로젝트명> 변화 기록"
created: <오늘 날짜>
updated: <오늘 날짜>
description: "<프로젝트명>의 설계 진화 narrative."
tags: [changelog, project]
related_project: "[[<프로젝트명>]]"
project_path: "/Users/pheeree/PROJECT/<프로젝트명>/"
scope: external
status: active
token_count_approx: 150
---

# <프로젝트명> 변화 기록

## <오늘 날짜> — 초기 등록 (work-bridge 시동)

- **변경**: /justdoit work-bridge로 시동. KM 배경에 노트·portfolio·_index 등록.
- **KM 배경 연결**: <Phase 0 결과 wikilink 목록>
- **KM 자원 추천 반영**: <Phase 2-B 결과 wikilink 목록>
- **근거 ADR**: [[decision-justdoit-work-bridge]] (v2.0.0 첫 시범).

## 관련

- [[<프로젝트명>]] — 본 changelog가 추적하는 대상.
- [[agent-portfolio]] — 진척 보드.
```

`/Users/pheeree/PROJECT/knowledge-mind/CHANGELOG.md` 상단에 새 entry (기존 entry 위):

```
## <오늘 날짜> — project: <프로젝트명> 시동 (work-bridge)

- /justdoit work-bridge로 시동. KM 4단계 의식 적용. 상세는 [[<프로젝트명>.changelog]].
```

### KM 저장소 git commit

본 4단계를 *한 묶음으로* 같은 커밋:

```bash
cd /Users/pheeree/PROJECT/knowledge-mind && git add -A && git commit -m "project: <프로젝트명> 시동 (work-bridge)"
```

---

## Phase 5: 다음 스텝 + carryback hook 안내

구체적이고 실행 가능한 다음 스텝 3~5개를 제안하세요. 각 스텝은:

- **한 문장**으로 명확하게
- **예상 소요 시간** 포함
- **난이도** 표시 (🟢 쉬움 / 🟡 보통 / 🔴 어려움)
- **구체적인 행동**이어야 함 (모호한 표현 금지)

예시:
```
✅ 다음 스텝:
1. 🟢 [15분] Next.js 프로젝트 초기화: `npx create-next-app@latest ./` 실행
2. 🟢 [30분] 메인 페이지 레이아웃 구현: Header, Sidebar, Content 영역 컴포넌트 생성
3. 🟡 [1시간] 할일 CRUD API 구현: /api/todos 엔드포인트에 GET, POST, PUT, DELETE
4. 🟡 [1시간] 데이터베이스 연동: SQLite + Prisma ORM 설정 및 스키마 작성
5. 🟢 [20분] 첫 번째 커밋 & 푸시: 기본 구조를 GitHub에 올리기
```

마지막에 **carryback hook 안내** (사용자가 외울 수 있도록 짧게):

```
🔁 환류 안내
- 작업 중 마찰·인사이트·재사용 신호 발견 시: `/k-inbox <내용>` 호출
- 외부 작업의 git commit은 자동으로 raw/misc/activity-log.md에 기록됨
- 다음 knowledge-mind 직접 모드 세션이 능동적으로 환류 회고
```

---

## 중요 규칙

- 사용자에게 질문은 최소화. 합리적인 기본값을 선택하고 진행.
- 모든 Phase의 결과를 마크다운으로 깔끔하게 포맷팅.
- Phase 0에서 관련 노트가 *전혀* 없으면 "새 영역"으로 진행 — 검색을 길게 끌지 않음.
- Phase 3에서 문제(gh 미설치 등) 발생 시 건너뛰고 Phase 4·4.5는 계속 진행.
- **Phase 4.5는 KM 인프라의 일관성 유지가 본질** — 4단계 모두 같은 커밋. 한 단계라도 빠지면 마찰 메모 캡처(`/Users/pheeree/PROJECT/knowledge-mind/thinking/skill-friction-justdoit-<오늘 날짜>-<slug>.md`).
- 결과물은 실제로 바로 개발을 시작할 수 있는 수준이어야 함.
- "일단 해!" 정신으로, 완벽보다는 실행에 초점.
