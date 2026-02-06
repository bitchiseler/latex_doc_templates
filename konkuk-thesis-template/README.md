# Konkuk University Thesis (Tectonic-first, Clean)

이 템플릿은 **Overleaf를 완전히 배제**하고,
Tectonic 기준으로 학위논문 작성 매뉴얼을 충실히 따르도록
처음부터 다시 설계한 프로젝트입니다.

## 빌드

### 방법 1: 빌드 스크립트 사용 (권장)
```bash
# XeLaTeX으로 빌드 (기본, 한글에 가장 적합)
./build.sh

# pdfLaTeX으로 빌드
./build.sh pdflatex

# Tectonic으로 빌드
./build.sh tectonic
```

### 방법 2: Makefile 사용
```bash
# XeLaTeX으로 빌드 (기본)
make

# pdfLaTeX으로 빌드
make pdflatex

# Tectonic으로 빌드
make tectonic

# 임시 파일 삭제
make clean

# PDF 뷰어로 열기
make view

# 도움말 보기
make help
```

### 방법 3: 직접 실행
```bash
# XeLaTeX (한글 처리에 가장 적합)
xelatex -output-directory=build -interaction=nonstopmode thesis.tex
biber build/thesis
xelatex -output-directory=build -interaction=nonstopmode thesis.tex
xelatex -output-directory=build -interaction=nonstopmode thesis.tex

# pdfLaTeX
pdflatex -output-directory=build -interaction=nonstopmode thesis.tex
biber build/thesis
pdflatex -output-directory=build -interaction=nonstopmode thesis.tex
pdflatex -output-directory=build -interaction=nonstopmode thesis.tex

# Tectonic
tectonic -k -o build thesis.tex
```

### VS Code 사용자
VS Code에서 LaTeX Workshop 확장 프로그램을 설치하면 자동으로 빌드 환경이 구성됩니다. `.vscode/settings.json` 파일이 이미 포함되어 있습니다.

## 특징
- B5 (182×257mm)
- 여백 상/하/좌/우 25mm
- frontmatter / mainmatter / backmatter 명시적 분리
- 페이지 번호 규칙 수동 제어
- book 클래스 최소 사용
