\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{konkuk-master-thesis-kor.cls}[Konkuk Thesis Tectonic Stable]

% =====================================
% Base class
% =====================================
\LoadClass{article}

% =====================================
% Packages (Tectonic-safe)
% =====================================
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{kotex}
\RequirePackage{titlesec}
\RequirePackage{ragged2e}
\RequirePackage{tocloft}
\RequirePackage{graphicx}
\RequirePackage{url}

% =====================================
% Load modular style files
% =====================================
\RequirePackage{style/thesis-layout}
\RequirePackage{style/thesis-hierarchy}
\RequirePackage{style/thesis-cover}
\RequirePackage{style/thesis-toc}
\RequirePackage{style/thesis-lot}
\RequirePackage{style/thesis-lof}
\RequirePackage{style/thesis-abstract}
\RequirePackage{style/thesis-misc}
\RequirePackage{style/thesis-references}


% =====================================
% Variables (fields)
% =====================================

% --- Thesis title block (KOR/ENG) ---
\newcommand{\thesistitle}[1]{\def\kk@title{#1}}
\newcommand{\thesissubtitle}[1]{\def\kk@subtitle{#1}}
\newcommand{\engtitle}[1]{\def\kk@engtitle{#1}}
\newcommand{\engsubtitle}[1]{\def\kk@engsubtitle{#1}}

% --- Affiliation / author ---
\newcommand{\departmentname}[1]{\def\kk@dept{#1}}      % 예: ○○○학과 ○○전공
\newcommand{\authorname}[1]{\def\kk@author{#1}}        % 성명
\newcommand{\schoolname}[1]{\def\kk@school{#1}}        % 예: 건국대학교 교육대학원
\newcommand{\advisortitle}[1]{\def\kk@advisor{#1}}     % 예: 지도교수 ○○○

% --- Dates ---
\newcommand{\coverdate}[1]{\def\kk@coverdate{#1}}       % 예: 2025년 8월
\newcommand{\submitdate}[1]{\def\kk@submitdate{#1}}     % 예: 2025년 10월 또는 11월
\newcommand{\approvaldate}[1]{\def\kk@approvaldate{#1}} % 예: 2025년 11월 또는 12월

% --- Korean abstract fields ---
\newcommand{\abstracttitle}[1]{\def\kk@abstitle{#1}}
\newcommand{\abstractsubtitle}[1]{\def\kk@abssubtitle{#1}}
\newcommand{\keywords}[1]{\def\kk@keywords{#1}}

% --- English abstract fields ---
\newcommand{\enabstracttitle}[1]{\def\kk@enabstitle{#1}}
\newcommand{\enabstractsubtitle}[1]{\def\kk@enabssubtitle{#1}}
\newcommand{\enauthor}[1]{\def\kk@enauthor{#1}}               % Hong, Gildong
\newcommand{\enDepartment}[1]{\def\kk@enDepartment{#1}}       % Department of xxx
\newcommand{\enmajor}[1]{\def\kk@enmajor{#1}}                 % Major in xxx
\newcommand{\engradschool}[1]{\def\kk@engradschool{#1}}       % Graduate School ...
\newcommand{\enkeywords}[1]{\def\kk@enkeywords{#1}}           % keyword1, ...

% --- Defaults (prevent undefined) ---
\def\kk@title{논문 제목}
\def\kk@subtitle{부제}
\def\kk@engtitle{English Title}
\def\kk@engsubtitle{English Subtitle}

\def\kk@dept{○○○학과 ○○전공}
\def\kk@author{성명}
\def\kk@school{건국대학교 교육대학원}
\def\kk@advisor{지도교수 ○○○}

\def\kk@coverdate{2025년 8월}
\def\kk@submitdate{2025년 10월 또는 11월}
\def\kk@approvaldate{2025년 11월 또는 12월}

\def\kk@abstitle{제목}
\def\kk@abssubtitle{부제}
\def\kk@keywords{키워드1, 키워드2, 키워드3}

\def\kk@enabstitle{English Title}
\def\kk@enabssubtitle{English Subtitle}
\def\kk@enauthor{Hong, Gildong}
\def\kk@enDepartment{Department of xxx}
\def\kk@enmajor{Major in xxx}
\def\kk@engradschool{Graduate School of Education, Konkuk University}
\def\kk@enkeywords{keyword1, keyword2, keyword3}
