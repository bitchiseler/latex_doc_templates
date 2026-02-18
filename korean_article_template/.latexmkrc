#!/usr/bin/env perl

# LaTeXmk 설정 파일
# 중간 파일들을 build 디렉토리에 저장하도록 설정

# PDF 출력 디렉토리 설정
$out_dir = 'build';

# 중간 파일들도 build 디렉토리에 저장
$aux_dir = 'build';
$log_dir = 'build';
$fls_dir = 'build';
$fdb_dir = 'build';

# 하위 디렉토리의 aux 파일들도 build 디렉토리에 저장
$aux_out_dir = 'build';

# PDF 생성 시 사용할 엔진 (pdflatex, xelatex, lualatex 등)
$pdf_mode = 5;  # 5 = XeLaTeX, 1 = pdfLaTeX

# Biber 사용 설정 (biblatex-chicago 패키지용)
$biber = 'biber %O %B';
$bibtex_use = 2;  # 0: not use, 1: bibtex, 2: biber

# 지속적인 모드에서 파일 변경 감지 시간 (초)
$polling_interval = 2;

# 미리보기 프로그램 설정 (macOS)
$pdf_previewer = 'open -a Preview %O %S';

# 컴파일 전후에 실행할 명령어 (필요한 경우)
# $pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
$xelatex = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';