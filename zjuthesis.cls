\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjuthesis}
    [Zhejiang University Thesis and Design Template, Zixuan Wang zxwang42@gmail.com]
\input{config/version}
\wlog{zjuthesis version: \zjuthesisversion}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=zjuthesis,
    prefix=
}
\DeclareStringOption{ClassNumber}
\DeclareStringOption{Security}
\DeclareStringOption{StudentName}
\DeclareStringOption{StudentID}
\DeclareStringOption{AdvisorName}
\DeclareStringOption{Grade}
\DeclareStringOption{Major}
\DeclareStringOption{Department}
\DeclareStringOption{Topic}
\DeclareStringOption{Title}
\DeclareStringOption{TitleEng}
\DeclareStringOption{SubmitDate}
\DeclareStringOption[graduate]{Degree}
\DeclareStringOption[general]{MajorFormat}
\DeclareStringOption[thesis]{Type}
\DeclareStringOption[final]{Period}
\DeclareStringOption[chinese]{Language}
\DeclareStringOption[doctor]{GradLevel}
\DeclareStringOption{ColaboratorName}
\DeclareStringOption[false]{BlindReview}
\DeclareStringOption[false]{PrintFilePath}
\DeclareStringOption[true]{TwoSide}
\DeclareBoolOption[false]{TrueBlankPage}
\DeclareBoolOption[true]{ListOfContents}
\DeclareBoolOption[true]{ListOfFigures}
\DeclareBoolOption[true]{ListOfTables}
\DeclareBoolOption[false]{ListOfAlgorithms}

\ProcessKeyvalOptions*

\wlog{Degree: {\Degree}}
\wlog{MajorFormat: {\MajorFormat}}
\wlog{Type: {\Type}}
\wlog{Period: {\Period}}
\wlog{BlindReview: {\BlindReview}}
\wlog{Language: {\Language}}
\wlog{GradLevel: {\GradLevel}}
\wlog{PrintFilePath: {\PrintFilePath}}

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{AutoFakeBold}{xeCJK}

\usepackage{xifthen}
% macOS 10.15+ 且 ctex 较旧时，自动检测的 fontset=mac 可能导致宋体/编译异常；
% 参见模板 README 与 https://github.com/TheNetAdmin/zjuthesis/issues/79
\RequirePackage{ifplatform}
\ifmacosx
    \PassOptionsToClass{fontset=macnew}{ctexrep}
\fi

\ifthenelse{\equal{\TwoSide}{true}}
{
    \PassOptionsToClass{
        twoside,
        openright
    }{ctexrep}
}
{}

\LoadClass[
    zihao=-4,
    UTF8
]{ctexrep}

\input{config/packages}

% graduate（本项目已去除本科生支持）
\ifthenelse{\equal{\GradLevel}{doctor}}
{
    % doctor
    \ifthenelse{\equal{\Type}{thesis} \OR \equal{\Type}{design}}
    {
        % thesis or design
        \newcommand{\TitleTypeName}{浙江大学博士学位论文}
        \newcommand{\TitleTypeNameCover}{博士学位论文}
    }
    {}
}
{
    % master
    \ifthenelse{\equal{\Type}{thesis}}
    {
        % thesis
        \newcommand{\TitleTypeName}{浙江大学硕士学位论文}
        \newcommand{\TitleTypeNameCover}{硕士学位论文}
    }
    {
        % design
        \newcommand{\TitleTypeName}{浙江大学硕士专业学位论文}
        \newcommand{\TitleTypeNameCover}{硕士专业学位论文}
    }
}

\input{config/path}
\input{config/commands}
\input{config/format/format}
