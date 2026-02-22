---
description: 프로젝트를 배포 플랫폼(Vercel, Netlify 등)에 자동 배포합니다
---

프로젝트를 배포 플랫폼에 자동으로 배포합니다.
모든 출력은 한국어로 합니다.

---

## 1. 프로젝트 분석

// turbo
```bash
cat package.json 2>/dev/null | head -30
ls -la vercel.json netlify.toml fly.toml railway.json 2>/dev/null
```

프로젝트 타입과 기존 배포 설정을 파악합니다.

---

## 2. 배포 플랫폼 추천

프로젝트 타입에 따라 적합한 플랫폼을 추천합니다:

| 프로젝트     | 추천 플랫폼      |
| ------------ | ---------------- |
| 정적 웹/SPA  | Vercel, Netlify  |
| Next.js/Nuxt | Vercel           |
| API/백엔드   | Railway, Fly.io  |
| Fullstack    | Vercel + Railway |
| Python       | Railway, Render  |

사용자에게 추천 플랫폼을 보여주고 확인을 받으세요.

---

## 3. 배포 CLI 설치 (필요 시)

```bash
# Vercel
npm i -g vercel

# Netlify
npm i -g netlify-cli

# Railway
brew install railway
```

---

## 4. 배포 실행

### Vercel (기본)
```bash
vercel --yes
```

### Netlify
```bash
netlify deploy --prod
```

### 수동 (GitHub Pages 등)
GitHub Actions 워크플로우 파일을 생성하여 자동 배포를 설정합니다.

---

## 5. 배포 확인

브라우저 도구로 배포된 URL에 접속하여 정상 동작을 확인합니다.

```
🚀 배포 결과:
- 플랫폼: Vercel
- URL: https://프로젝트.vercel.app
- 상태: ✅ 정상
```

---

## 규칙

- 사용자의 확인 없이 배포하지 마세요
- 환경변수가 필요한 경우 반드시 안내하세요
- 배포 후 URL을 반드시 제공하세요
