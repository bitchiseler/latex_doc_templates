# LaTeX 빌드 Makefile
# 사용법:
# make          - XeLaTeX으로 빌드 (기본)
# make pdflatex - pdfLaTeX으로 빌드
# make tectonic - Tectonic으로 빌드
# make clean    - 임시 파일 삭제
# make view     - PDF 뷰어로 열기

# 변수 설정
ENGINE = xelatex
BUILD_DIR = build
MAIN_FILE = thesis.tex
PDF_FILE = $(BUILD_DIR)/thesis.pdf

# 기본 타겟: XeLaTeX으로 빌드
all: $(PDF_FILE)

# XeLaTeX으로 빌드
xelatex: $(PDF_FILE)

# pdfLaTeX으로 빌드
pdflatex:
	@echo "pdfLaTeX으로 빌드합니다..."
	@mkdir -p $(BUILD_DIR)
	pdflatex -output-directory=$(BUILD_DIR) -interaction=nonstopmode $(MAIN_FILE)
	biber $(BUILD_DIR)/thesis
	pdflatex -output-directory=$(BUILD_DIR) -interaction=nonstopmode $(MAIN_FILE)
	pdflatex -output-directory=$(BUILD_DIR) -interaction=nonstopmode $(MAIN_FILE)
	@echo "빌드 완료! 결과물: $(PDF_FILE)"

# Tectonic으로 빌드
tectonic:
	@echo "Tectonic으로 빌드합니다..."
	@mkdir -p $(BUILD_DIR)
	tectonic -k -o $(BUILD_DIR) \
	  -Z search-path="$(shell dirname "$(shell kpsewhich biblatex.sty)")" \
	  $(MAIN_FILE)
	@echo "빌드 완료! 결과물: $(PDF_FILE)"

# XeLaTeX 빌드 규칙 (기본)
$(PDF_FILE): $(MAIN_FILE) $(wildcard style/*.sty) $(wildcard chapters/*.tex)
	@echo "XeLaTeX으로 빌드합니다..."
	@mkdir -p $(BUILD_DIR)
	xelatex -output-directory=$(BUILD_DIR) -interaction=nonstopmode $(MAIN_FILE)
	biber $(BUILD_DIR)/thesis
	xelatex -output-directory=$(BUILD_DIR) -interaction=nonstopmode $(MAIN_FILE)
	xelatex -output-directory=$(BUILD_DIR) -interaction=nonstopmode $(MAIN_FILE)
	@echo "빌드 완료! 결과물: $(PDF_FILE)"

# 임시 파일 삭제
clean:
	@echo "임시 파일 삭제..."
	@rm -rf $(BUILD_DIR)/*.aux $(BUILD_DIR)/*.log $(BUILD_DIR)/*.out $(BUILD_DIR)/*.toc $(BUILD_DIR)/*.bbl $(BUILD_DIR)/*.bcf $(BUILD_DIR)/*.blg $(BUILD_DIR)/*.run.xml $(BUILD_DIR)/*.fls $(BUILD_DIR)/*.fdb_latexmk $(BUILD_DIR)/*.synctex.gz

# 모든 파일 삭제 (PDF 포함)
cleanall: clean
	@echo "모든 빌드 파일 삭제..."
	@rm -rf $(BUILD_DIR)

# PDF 뷰어로 열기 (macOS)
view: $(PDF_FILE)
	@if command -v open >/dev/null 2>&1; then \
		open $(PDF_FILE); \
	elif command -v xdg-open >/dev/null 2>&1; then \
		xdg-open $(PDF_FILE); \
	else \
		echo "PDF 뷰어를 찾을 수 없습니다. 수동으로 $(PDF_FILE)를 열어주세요."; \
	fi

# 도움말
help:
	@echo "사용 가능한 명령:"
	@echo "  make         - XeLaTeX으로 빌드 (기본)"
	@echo "  make pdflatex - pdfLaTeX으로 빌드"
	@echo "  make tectonic - Tectonic으로 빌드"
	@echo "  make clean    - 임시 파일 삭제"
	@echo "  make cleanall  - 모든 빌드 파일 삭제 (PDF 포함)"
	@echo "  make view     - PDF 뷰어로 열기"
	@echo "  make help     - 이 도움말 표시"

.PHONY: all pdflatex tectonic clean cleanall view help