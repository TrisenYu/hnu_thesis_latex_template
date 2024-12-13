# HNU本科毕业论文 $\LaTeX$ 模板 (理工类)
HNU latex 本科毕业论文。基于 [github.com/WhiteByeBye/HNUThesisTemplate-Bachelor](https://github.com/WhiteByeBye/HNUThesisTemplate-Bachelor) 大改而来。
> 也请做好 word 编写论文的准备，毕竟这个项目并没有被学校所认可。
如有需要提个 issue/PR。

## 项目结构

```plaintext
.
├── sections/ - 各个供参考的章节
│    ├── 1intro_ref.tex - 绪论部分
│    ├── 2relatedwork_ref.tex - 相关工作
│    ├── 3ourwork_ref.tex - 读者的工作
│    ├── 4experiment_ref.tex - 实验部分
│    ├── 5discussion_ref.tex - 讨论部分
│    ├── 6conclusion_ref.tex - 结论部分
│    └── acknowledge_ref.tex - 致谢和附录部分
│
├── format/ - 全文格式的设置文件夹
│    ├── `cover.tex` - 封面相关信息的填写，本库不存在，需要读者手动修改 cover_ref 而创建
│    ├── package.tex - 所导入的宏包以及一部分配置
│    ├── setup.tex - 用于定义与生成HNU本科毕业论文前几页的latex命令
│    └── cover_ref.tex - 用于辅助cover.tex的编写模板
│
├── criterions/ - 2025年学校发的参考模板文件夹
│
├── figures/ - 用到的图像文件(png, eps等。其中hnu.eps和HSVGPDF.eps分别为校名和校徽，两者必应存在)
│
├── refer.bib - 存 bibtex 的文件(*必要，但目前不存在于本仓库，需要读者自行编写)
├── refer_ref.bib - 存 bibtex 的文件
├── README.MD - 本文件
├── makefile - 定义了编译指令的文件(需要电脑装上make和latex环境)
├── .gitignore - 配置git应该忽略哪些文件
├── .gitsubmodule - 子模块（目前还没有用到）
└── thesis.tex - 生成HNU本科学位论文pdf的模板(*必要)
```

## 使用说明
1. 参照 `format/cover_ref.tex` 并处于 `format/` 目录下来编辑 `cover.tex` 填入你自己的个人信息。
2. 参照 `sections/` 下的章节来写你自己的论文。
3. 其它部分，如 `refer.bib`，视需求改写补充即可。
4. 编写完成后，`make` 或 `make all` 来编译自己的毕业论文 _thesis.pdf_。
5. 如果某些章节不想通过 `./thesis.tex` 下的 `\include` 命令单开一页，可以修改这一部分。

## 目前已知的问题
- 只支持本地编译。后续如果有时间和能力则加到 overleaf 上。
- `\ref{}` 或 `\eqref{}` 前后要**手动加空格**。
- 数字、单词和中文之间，**需要手动敲空格**。
- 仍潜在的格式问题。
- 可能编译时会提示没有 `tabularray` 这个宏包——那就更新到最新的 Tex 吧。
    - 或者去掉 `format/package.tex` 下的那个宏包，改换 `tabular` 宏包达成一样的效果。

本人环境是：
```plaintext
$ latex --version
pdfTeX 3.141592653-2.6-1.40.26 (TeX Live 2024)
kpathsea version 6.4.0
Copyright 2024 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.43; using libpng 1.6.43
Compiled with zlib 1.3.1; using zlib 1.3.1
Compiled with xpdf version 4.04
```

## License
硬要说就放MIT吧。

## 致谢
(排名不分先后)
+ [github.com/WhiteByeBye/HNUThesisTemplate-Bachelor](https://github.com/WhiteByeBye/HNUThesisTemplate-Bachelor)
+ [www.runoob.com/w3cnote/px-pt-em-convert-table.html](https://www.runoob.com/w3cnote/px-pt-em-convert-table.html)
+ [www.hnu.edu.cn](https://www.hnu.edu.cn/)
+ [tex.stackexchange.com/a/372825](https://tex.stackexchange.com/a/372825)
+ [tex.stackexchange.com/a/192450](https://tex.stackexchange.com/a/192450)
+ [fohte.hateblo.jp/entry/2017/02/03/130829](https://fohte.hateblo.jp/entry/2017/02/03/130829)
+ [chatgpt.com](https://chatgpt.com/)
+ [www.latex-tables.com](https://www.latex-tables.com/)
+ [overleaf.com](https://overleaf.com/)