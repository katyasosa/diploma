\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{matmex-diploma-custom}[2013/04/12 MatMex LaTeX diploma class]
\def\my@fontsize{12pt}\def\my@baseclass{report}
\DeclareOption{14pt}{\def\my@fontsize{14pt}\def\my@baseclass{report}}
\ProcessOptions\relax
\LoadClass[a4paper,\my@fontsize]{\my@baseclass}

\usepackage{fancyhdr}
\usepackage{ifthen}
%% Мы используем компилятор XeLaTex, который дружит с Unicode и True Type/Open Type
%% шрифтами. Для русификации достаточно подключить пакет fontspec и
%% выбрать Unicode шрифт в котором есть кириллические глифы. Ниже
%% основным шрифтом выбирается Unicode версия шрифта Computer Modern с заcечками
\usepackage{fontspec}
\setmainfont[Mapping=tex-text]{Times New Roman}

%% В XeLaTex заменой известного пакета babel является пакет polyglossia.
%% Теперь у нас будут переносы слов
\usepackage{polyglossia}
\setdefaultlanguage{russian}

%% Поля
\usepackage[a4paper,includeheadfoot,top=20mm,bottom=20mm,left=30mm,right=15mm]{geometry}

%% Отступ в первом абзаце
\usepackage{indentfirst}
%% Гиперссылки
\usepackage[colorlinks=true,urlcolor=black,linkcolor=black,filecolor=black,citecolor=black]{hyperref}

%% Включение графических файлов
\usepackage{graphicx}
\usepackage[titletoc]{appendix}

%% Эта команда добавляет отчеркнутое место для подписи после имени
%% Аргументы: имя и пояснение под чертой (например, слово "подпись")
\def\sigspace{\\[3em]}
\newcommand\sigplace[2]{
#1\\[1.2em]
\underline{\hspace{3cm}}\\[-0.2em]
{\footnotesize #2}
\def\sigspace{\\[1em]%
\def\sigspace{\\[3em]}}
}

%% Параметры заполнения титульного листа
\usepackage{xkeyval}

%% Русскоязычный вариант
\define@key[ru]{mytitle}{university}{\def\my@title@university@ru{#1}}
\define@key[ru]{mytitle}{faculty}{\def\my@title@faculty@ru{#1}}
\define@key[ru]{mytitle}{chair}{\def\my@title@chair@ru{#1}}
\define@key[ru]{mytitle}{title}{\def\my@title@title@ru{#1}}
\define@key[ru]{mytitle}{position}{\def\my@title@position@ru{#1}}
\define@key[ru]{mytitle}{group}{\def\my@title@group@ru{#1}}
\define@key[ru]{mytitle}{author}{\def\my@title@author@ru{#1}}
\define@key[ru]{mytitle}{supervisor}{\def\my@title@supervisor@ru{#1}}
\define@key[ru]{mytitle}{supervisorPosition}{\def\my@title@supervisorPosition@ru{#1}}
\define@key[ru]{mytitle}{reviewer}{\def\my@title@reviewer@ru{#1}}
\define@key[ru]{mytitle}{reviewerPosition}{\def\my@title@reviewerPosition@ru{#1}}
\define@key[ru]{mytitle}{chairHead}{\def\my@title@chairHead@ru{#1}}
\define@key[ru]{mytitle}{chairHeadPosition}{\def\my@title@chairHeadPosition@ru{#1}}
\define@key[ru]{mytitle}{year}{\def\my@title@year@ru{#1}}
\define@key[ru]{mytitle}{city}{\def\my@title@city@ru{#1}}
\define@choicekey*[ru]{mytitle}{type}{diploma,coursework,master,bachelor}{\def\my@title@type@ru{#1}}

%% Англоязычный вариант
\define@key[en]{mytitle}{university}{\def\my@title@university@en{#1}}
\define@key[en]{mytitle}{faculty}{\def\my@title@faculty@en{#1}}
\define@key[en]{mytitle}{chair}{\def\my@title@chair@en{#1}}
\define@key[en]{mytitle}{title}{\def\my@title@title@en{#1}}
\define@key[en]{mytitle}{position}{\def\my@title@position@en{#1}}
\define@key[en]{mytitle}{group}{\def\my@title@group@en{#1}}
\define@key[en]{mytitle}{author}{\def\my@title@author@en{#1}}
\define@key[en]{mytitle}{supervisor}{\def\my@title@supervisor@en{#1}}
\define@key[en]{mytitle}{supervisorPosition}{\def\my@title@supervisorPosition@en{#1}}
\define@key[en]{mytitle}{reviewer}{\def\my@title@reviewer@en{#1}}
\define@key[en]{mytitle}{reviewerPosition}{\def\my@title@reviewerPosition@en{#1}}
\define@key[en]{mytitle}{chairHead}{\def\my@title@chairHead@en{#1}}
\define@key[en]{mytitle}{chairHeadPosition}{\def\my@title@chairHeadPosition@en{#1}}
\define@key[en]{mytitle}{year}{\def\my@title@year@en{#1}}
\define@key[en]{mytitle}{city}{\def\my@title@city@en{#1}}
\define@choicekey*[en]{mytitle}{type}{diploma,coursework,master,bachelor}{\def\my@title@type@en{#1}}

\newcommand\filltitle[2]{
%% Значения по умолчанию для обоих языков
    \ifthenelse{\equal{#1}{ru}}
        {
        \presetkeys[#1]{mytitle}{
          university = {САНКТ-ПЕТЕРБУРГСКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ},
          faculty = {Математико-механический факультет},
          city = {Санкт-Петербург},
          year = {\the\year},
          type = {diploma}
        }{}
        }
        {}
    \ifthenelse{\equal{#1}{en}}
        {
        \presetkeys[#1]{mytitle}{
          university = {SAINT-PETERSBURG STATE UNIVERSITY},
          faculty = {Mathematics \& Mechanics Faculty},
          city = {Saint-Petersburg},
          year = {\the\year},
          type = {diploma}
        }{}
        }
        {}
    \setkeys[#1]{mytitle}{#2}
}

%% Титульная страница на русском языке
\newcommand\maketitleru{
%% В верхнем колонтитуле будет университет и кафедра
%% В нижнем колонтитуле город и год
\fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \chead{\large \my@title@university@ru \\ \my@title@faculty@ru \\ \vskip 1em{\large \my@title@chair@ru \\}}
    \lfoot{}
    \cfoot{\large\parbox[b]{\textwidth}{\centering \my@title@city@ru\\ \my@title@year@ru}}
    \rfoot{}
}

\title{\my@title@title@ru}
\begin{titlepage}
\thispagestyle{plain}
\begin{center}
    \vspace*{0.25\textheight}
    {\Large\my@title@author@ru}

    \vskip 2em
    {\Huge \@title\\}

    \vskip 1em
    {\large
    \ifthenelse{\equal{\my@title@type@ru}{coursework}}
    {Курсовая работа}
    {\ifthenelse{\equal{\my@title@type@ru}{diploma}}
    {Дипломная работа}
    {\ifthenelse{\equal{\my@title@type@ru}{master}}
    {Магистерская диссертация}
    {\ifthenelse{\equal{\my@title@type@ru}{bachelor}}
    {Бакалаврская работа}
    }}}
    \\}
    \vskip 2em
    \ifthenelse{\equal{\my@title@type@ru}{coursework}}
    {\normalsize \raggedleft
    Научный руководитель:\\
    \my@title@supervisorPosition@ru\ \my@title@supervisor@ru
    }
    {\normalsize \raggedleft
    Допущена к защите.\\
    Зав. кафедрой:\\
    \my@title@chairHeadPosition@ru\ \my@title@chairHead@ru\sigspace
    Научный руководитель:\\
    \my@title@supervisorPosition@ru\ \my@title@supervisor@ru\sigspace
    Рецензент:\\
    \my@title@reviewerPosition@ru\ \my@title@reviewer@ru
    }
\end{center}
\end{titlepage}
}

%% Титульная страница на английском языке
\newcommand\maketitleen{
%% В верхнем колонтитуле будет университет и кафедра
%% В нижнем колонтитуле город и год
\fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \chead{\large \my@title@university@en \\ \my@title@faculty@en \\ \vskip 1em{\large \my@title@chair@en \\}}
    \lfoot{}
    \cfoot{\large\parbox[b]{\textwidth}{\centering \my@title@city@en\\ \my@title@year@en}}
    \rfoot{}
}
\title{\my@title@title@en}
\begin{titlepage}%
\thispagestyle{plain}
  \begin{center}
    \vspace*{0.25\textheight}
    {\Large\my@title@author@en\\}

    \vskip 2em
    {\Huge \@title \\}

    \vskip 1em
    {\large
    \ifthenelse{\equal{\my@title@type@en}{coursework}}
    {Course Work}
    {\ifthenelse{\equal{\my@title@type@en}{diploma}}
    {Graduation Thesis}
    {\ifthenelse{\equal{\my@title@type@en}{master}}
    {Master's Thesis}
    {\ifthenelse{\equal{\my@title@type@en}{bachelor}}
    {Bachelor's Thesis}
    }}}
    \\}
    \vskip 2em
    \ifthenelse{\equal{\my@title@type@en}{coursework}}
    {\normalsize \raggedleft
    Scientific supervisor:\\
    \my@title@supervisorPosition@en\ \my@title@supervisor@en
    }
    {\normalsize \raggedleft
    Admitted for defence.\\
    Head of the chair:\\
    \my@title@chairHeadPosition@en\ \my@title@chairHead@en\sigspace

    Scientific supervisor:\\
    \my@title@supervisorPosition@en\ \my@title@supervisor@en\sigspace

    Reviewer:\\
    \my@title@reviewerPosition@en\ \my@title@reviewer@en
    }
  \end{center}
\end{titlepage}
}

%% Титульный лист генерируется, если для соответствующего языка
%% определен аргумент title
%% Счетчик страниц автоматически увеличивается при генерации титульнго листа
\renewcommand\maketitle{{
%% На титульной странице все кроме полей соответствует \documentclass[12pt]{article}
\let\orignewcommand\newcommand
\let\newcommand\renewcommand
\makeatletter
\input{size12.clo}%
\makeatother
\let\newcommand\orignewcommand
\newgeometry{a4paper,includeheadfoot,top=20mm,bottom=20mm,left=25mm,right=15mm}

\newcounter{titlepages}
\setcounter{titlepages}{1}
\begin{spacing}{1.0}
\ifthenelse{\isundefined{\my@title@title@ru}}{}{\maketitleru\addtocounter{titlepages}{1}}
\ifthenelse{\isundefined{\my@title@title@en}}{}{\maketitleen\addtocounter{titlepages}{1}}
\end{spacing}
\setcounter{page}{\value{titlepages}}
}}

%% Каждая глава начинается с новой страницы, введение и заключение не
%% нумеруются, но в оглавление входят. А само оглавление и список литературы,
%% наоборот, не входят
\let\old@section\section
\def\section{\@ifstar\@section\@@section}
\def\@section#1{\newpage\old@section*{#1}%
    \ifthenelse{\equal{#1}{\refname}}%
        {}%
        {\ifthenelse{\equal{#1}{\contentsname}}%
           {}%
           {\addcontentsline{toc}{section}{#1}}}%
}
\def\@@section#1{\newpage\old@section{#1}}

%% Полуторный интервал
\usepackage[nodisplayskipstretch]{setspace}
\onehalfspacing

%% Переименование "содержания" в "оглавление"
\gappto\captionsrussian{\renewcommand{\contentsname}{Оглавление}}

\let\savenumberline\numberline
\def\numberline#1{\savenumberline{#1.}}

\addtolength{\textheight}{\headheight}
\addtolength{\textheight}{\headsep}
\setlength{\headsep}{0pt}
\setlength{\headheight}{0pt}