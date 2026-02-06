#!/bin/bash

# LaTeX 빌드 스크립트
# 사용법: ./build.sh [engine]
# engine: xelatex (기본값), pdflatex, tectonic

ENGINE=${1:-xelatex}
BUILD_DIR="build"

# 빌드 디렉토리 생성
mkdir -p $BUILD_DIR

case $ENGINE in
    "xelatex")
        echo "XeLaTeX으로 빌드합니다..."
        # XeLaTeX은 한글 처리에 더 적합
        xelatex -output-directory=$BUILD_DIR -interaction=nonstopmode thesis.tex
        biber $BUILD_DIR/thesis
        xelatex -output-directory=$BUILD_DIR -interaction=nonstopmode thesis.tex
        xelatex -output-directory=$BUILD_DIR -interaction=nonstopmode thesis.tex
        ;;
    "pdflatex")
        echo "pdfLaTeX으로 빌드합니다..."
        # pdfLaTeX은 kotex 패키지 필요
        pdflatex -output-directory=$BUILD_DIR -interaction=nonstopmode thesis.tex
        biber $BUILD_DIR/thesis
        pdflatex -output-directory=$BUILD_DIR -interaction=nonstopmode thesis.tex
        pdflatex -output-directory=$BUILD_DIR -interaction=nonstopmode thesis.tex
        ;;
    "tectonic")
        echo "Tectonic으로 빌드합니다..."
        tectonic -k -o build \
          -Z search-path="$(dirname "$(kpsewhich biblatex.sty)")" \
          thesis.tex
        ;;
    *)
        echo "지원하지 않는 엔진: $ENGINE"
        echo "사용 가능한 엔진: xelatex, pdflatex, tectonic"
        exit 1
        ;;
esac

echo "빌드 완료! 결과물: $BUILD_DIR/thesis.pdf"