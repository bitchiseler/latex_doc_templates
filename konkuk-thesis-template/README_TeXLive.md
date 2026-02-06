# TeXLive로 LaTeX 빌드 방법

이 문서는 TeXLive를 사용하여 건국대학교 학위논문 템플릿을 빌드하는 방법을 설명합니다.

## 준비물

- TeXLive 설치 (이미 시스템에 설치됨)
- 이 프로젝트의 모든 파일

## 초록 작성

초록 내용은 다음 파일에 작성해야 합니다:
- 국문초록: [`chapters/etc-abstract(kor).tex`](chapters/etc-abstract(kor).tex)
- 영문초록: [`chapters/etc-abstract(eng).tex`](chapters/etc-abstract(eng).tex)

이 파일들은 [`style/thesis-abstract.sty`](style/thesis-abstract.sty)에서 정의된 [`\makeabstract`](style/thesis-abstract.sty:23)와 [`\makeenabstract`](style/thesis-abstract.sty:52) 명령어를 통해 자동으로 포함됩니다.

## 빌드 방법

### 방법 1: 자동 빌드 스크립트 사용 (권장)

가장 간단한 방법은 제공된 [`build.sh`](build.sh) 스크립트를 사용하는 것입니다:

```bash
./build.sh
```

이 스크립트는 다음 단계를 자동으로 수행합니다:
1. 첫 번째 `pdflatex` 실행 (참고문헌 정보 생성)
2. `bibtex` 실행 (참고문헌 처리)
3. 두 번째 `pdflatex` 실행 (참고문헌 링크)
4. 세 번째 `pdflatex` 실행 (최종 페이지 번호 및 참조 업데이트)

빌드가 완료되면 `thesis.pdf` 파일이 생성됩니다.

### 방법 2: 수동 빌드

각 단계를 직접 실행할 수도 있습니다:

```bash
# 1. 첫 번째 pdflatex 실행
pdflatex thesis.tex

# 2. bibtex 실행
bibtex thesis

# 3. 두 번째 pdflatex 실행
pdflatex thesis.tex

# 4. 세 번째 pdflatex 실행
pdflatex thesis.tex
```

## 빌드 과정 설명

LaTeX 문서는 참고문헌과 교차 참조를 처리하기 위해 여러 번 컴파일해야 합니다:

1. **첫 번째 컴파일**: 문서 구조를 분석하고 참고문헌 정보를 `.aux` 파일에 저장
2. **BibTeX 실행**: `.bib` 파일에서 참고문헌을 읽어 `.bbl` 파일 생성
3. **두 번째 컴파일**: 참고문헌을 문서에 포함시키고 교차 참조 처리
4. **세 번째 컴파일**: 모든 참조가 올바르게 연결되었는지 확인

## 문제 해결

### 한글 폰트 문제

한글이 제대로 표시되지 않는 경우, 시스템에 한글 폰트가 설치되어 있는지 확인하세요.

### 참고문헌 문제

참고문헌이 제대로 표시되지 않는 경우:
1. `refs.bib` 파일이 올바른 위치에 있는지 확인
2. `bibtex` 실행 시 오류 메시지가 있는지 확인
3. `.aux` 파일에 `\citation` 명령이 있는지 확인

### 로그 파일 확인

빌드 중 문제가 발생하면 `.log` 파일을 확인하여 상세한 오류 정보를 얻을 수 있습니다:

```bash
# 오류 메시지 확인
grep -i error thesis.log
# 경고 메시지 확인
grep -i warning thesis.log
```

## 보조 파일 정리

빌드 과정에서 생성되는 보조 파일들을 정리하려면:

```bash
rm -f *.aux *.log *.bbl *.blg *.toc *.lot *.lof *.out *.fdb_latexmk *.fls *.synctex.gz
```

또는 [`build.sh`](build.sh) 스크립트를 실행할 때 보조 파일 삭제 옵션을 선택할 수 있습니다.

## Tectonic과의 차이점

이 템플릿은 원래 Tectonic용으로 설계되었지만, TeXLive에서도 사용할 수 있습니다. 주요 차이점:

- **Tectonic**: 단일 명령어로 자동으로 여러 단계 처리
- **TeXLive**: 수동으로 여러 단계를 거쳐야 함 (스크립트로 자동화 가능)

두 방법 모두 동일한 결과물을 생성합니다.