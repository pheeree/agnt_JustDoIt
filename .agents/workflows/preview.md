---
description: 웹 프로젝트를 로컬에서 실행하고 브라우저에서 미리보기합니다
---

웹 프로젝트의 개발 서버를 실행하고, 브라우저에서 자동으로 확인하여 스크린샷을 남깁니다.
모든 출력은 한국어로 합니다.

---

## 1. 프로젝트 타입 감지

// turbo
```bash
ls package.json pyproject.toml Cargo.toml go.mod 2>/dev/null
```

`package.json`이 있으면 Node.js, `pyproject.toml`이 있으면 Python 등으로 판단합니다.

---

## 2. 의존성 확인

// turbo
```bash
# Node.js인 경우
[ -f package.json ] && [ ! -d node_modules ] && npm install

# Python인 경우
[ -f pyproject.toml ] && pip install -e ".[dev]" 2>/dev/null
```

---

## 3. 개발 서버 실행

`package.json`의 `scripts.dev` 또는 `scripts.start`를 확인하여 적절한 명령어로 dev 서버를 백그라운드에서 실행합니다.

```bash
npm run dev
# 또는
python -m uvicorn main:app --reload
# 또는
프로젝트에 맞는 명령어
```

서버가 시작될 때까지 잠시 기다립니다.

---

## 4. 브라우저에서 확인

브라우저 도구(browser_subagent)를 사용하여:

1. `http://localhost:3000` (또는 감지된 포트)를 엽니다
2. 페이지가 정상 로드되는지 확인합니다
3. 주요 UI 요소가 표시되는지 확인합니다
4. 스크린샷을 저장합니다

---

## 5. 결과 보고

```
🖥️ 미리보기 결과:
- 서버: ✅ 정상 실행 (localhost:3000)
- 페이지: ✅ 정상 로드
- 주요 UI: ✅ 확인
- 스크린샷: 저장 완료
```

문제가 발견되면 구체적으로 알려주고 수정 방법을 제안하세요.

---

## 규칙

- dev 서버가 이미 실행 중이면 건너뛰세요
- 포트 충돌 시 다른 포트를 시도하세요
- 서버 실행 실패 시 에러 로그를 분석하고 해결책을 제안하세요
