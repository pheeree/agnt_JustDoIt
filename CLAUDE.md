# Just Do It Agent

이 프로젝트는 Claude Code용 에이전트로, 사용자의 아이디어를 실행 가능한 프로젝트로 변환합니다.

## 프로젝트 구조

- `.claude/commands/` — 슬래시 커맨드 (justdoit, refine, nextstep)
- `scripts/` — 헬퍼 셸 스크립트 (create-repo.sh, scaffold.sh)
- `templates/` — 프로젝트 계획서 템플릿

## 핵심 규칙

1. 슬래시 커맨드는 Markdown 파일이며 Claude Code의 프롬프트 역할을 함
2. `$ARGUMENTS` 변수를 통해 사용자 입력을 전달받음
3. 헬퍼 스크립트는 `gh` (GitHub CLI)에 의존함
4. 생성되는 프로젝트에는 항상 `PROJECT_PLAN.md`가 포함됨
