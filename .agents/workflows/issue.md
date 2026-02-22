---
description: PROJECT_PLAN.md의 마일스톤을 기반으로 GitHub Issues를 일괄 생성합니다
---

프로젝트 계획서의 마일스톤과 기능 목록을 분석하여 GitHub Issues를 자동으로 생성합니다.
모든 출력은 한국어로 합니다.

---

## 1. 계획서 읽기

// turbo
```bash
cat PROJECT_PLAN.md 2>/dev/null || echo "PROJECT_PLAN.md를 찾을 수 없습니다"
```

---

## 2. 이슈 목록 생성

`PROJECT_PLAN.md`에서 다음을 추출하세요:
- 핵심 기능 체크리스트 (각각 하나의 이슈)
- 마일스톤 내 세부 항목 (각각 하나의 이슈)

각 이슈에 대해:
- **제목**: 명확하고 동작 중심 (예: "사용자 로그인 API 구현")
- **본문**: 수용 기준, 관련 기술 스택, 참고사항
- **라벨**: `enhancement`, `bug`, `documentation` 등
- **마일스톤**: 해당하는 마일스톤 (있으면)

생성할 이슈 목록을 사용자에게 보여주고 확인을 받으세요.

---

## 3. GitHub 마일스톤 생성 (해당 시)

```bash
gh api repos/{owner}/{repo}/milestones -f title="Milestone 1: 기본 셋업" -f description="..."
```

---

## 4. 이슈 일괄 생성

사용자 승인 후, 각 이슈를 생성합니다:

```bash
gh issue create --title "이슈 제목" --body "이슈 본문" --label "enhancement"
```

---

## 5. 결과 보고

```
📋 GitHub Issues 생성 완료:
- 총 N개 이슈 생성
- #1: 이슈 제목 (enhancement)
- #2: 이슈 제목 (enhancement)
- ...

🔗 이슈 보기: gh issue list
```

---

## 규칙

- 이슈를 생성하기 전에 반드시 사용자의 확인을 받으세요
- 이슈 제목은 구체적이고 동작 중심으로 작성하세요
- 중복 이슈가 있는지 `gh issue list`로 먼저 확인하세요
- 이슈 본문에는 수용 기준(Acceptance Criteria)을 포함하세요
