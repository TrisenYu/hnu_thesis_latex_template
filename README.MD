# HNU本科毕业论文 $\LaTeX$ 模板 (理工类)
HNU $\LaTeX$ 本科毕业论文。基于 [github.com/WhiteByeBye/HNUThesisTemplate-Bachelor](https://github.com/WhiteByeBye/HNUThesisTemplate-Bachelor) 大改而来。
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
│    ├── acknowledge_ref.tex - 致谢部分
│    └── appendix_ref.tex - 附录部分
│
├── exp-data/ - 实验数据文件夹
│    ├── `data.tex` - 可选。用于pgfplot渲染用的数据。本库不存在，需要读者手动修改 data-ref 而创建
│    └── data-ref.tex - 用于辅助data.tex的编写模板
│
├── format/ - 全文格式的设置文件夹
│    ├── `cover.tex` - (*必要)填入渲染到封面的相关信息，本库不存在，需要读者手动修改 cover_ref 而创建
│    ├── package.tex - (*必要)所导入的宏包以及一部分配置
│    ├── setup.tex - (*必要)用于定义与生成HNU本科毕业论文前几页的latex命令
│    ├── glossaries.tex - 用于在附录生成术语表，可选
│    ├── glossaries_ref.tex - 只做参考用途的缩略术语
│    └── cover_ref.tex - 用于辅助cover.tex的编写模板
│
├── criterions/ - 2025年学校发的参考模板文件夹
│
├── figures/ - 用到的图像文件夹
│    ├── hnu.eps - (*必要)校名
│    ├── hnu.pdf - 校名的 pdf 参考
│    ├── HSVGPDF.eps - 彩色的校徽，用了被批了
│    ├── HSVGPDF-transparent.png - (*必要)白色校徽
│    └── HSVGPDF.jpg - 校徽的 jpg 参考
│
├── demo/ - 示例文件夹，存放demo.tex生成的中间文件和pdf
├── os-test/ - 跨操作系统示例文件夹。存放不同操作系统生成的demo.pdf
│
├── `refer.bib` - (*必要)存 bibtex 的文件，但目前不存在于本仓库，需要读者自行编写
├── refer_ref.bib - 存 bibtex 的参考文件。其中需要人工注意 [C] 和 [J] 的项是不是符合要求
├── README.MD - 本文件
├── makefile - 定义了编译指令的文件，需要电脑装上make和latex环境
├── .gitignore - 配置git应该忽略哪些文件
├── demo.tex - 生成 demo.pdf 的文件
└── thesis.tex - (*必要)生成HNU本科学位论文pdf的模板
```

## 使用说明
1. 本地配好 $\LaTeX$ 和 `make` 环境。 
2. 参照 `format/cover_ref.tewx` 并处于 `format/` 目录下来编辑 `cover.tex` 填入你自己的个人信息。
3. 参照 `sections/` 下的章节来写你自己的论文。
4. 其它部分，如 `refer.bib`，视需求改写补充即可。
5. 编写完成后，`make` 或 `make all` 来编译自己的毕业论文 _thesis.pdf_。
6. 如果某些章节不想通过 `./thesis.tex` 下的 `\include` 命令单开一页，可以修改这一部分。
7. 附录推荐使用 `setup.tex` 中定义的 `\setAppendixHere{A}` 来使用。
    - 其中 `A` 可被按字母表顺序替换。

## 目前已知的问题
- 只支持本地编译。
    - overleaf 上在主菜单切换为 XeLaTeX 是能编，但超时；如果要用，还是推荐用英文写而不是费时编译为中文文档……
        - 或者成为overleaf的金主？
        - 或者看后面能不能优化整个编译过程而已了。
- `\ref{}` 或 `\eqref{}` 前后要**手动加空格**。
- 数字、单词和中文之间，**需要手动敲空格**。
- 仍潜在的奇奇怪怪的格式问题，如页眉、行距和页脚边距（调起来非常费劲）。
- 某些字符 `_\%#` 等需要**手动**在其前加 `\` 转义。
- 中间文件如要输出到特定文件夹，目前 `\include` 不可用，可用的只有 `\input` 方法。但 `\input` 方法不会自动换页。
- 还没有 MacOS 上测试过。
- 编译用时较长。
- 非常不建议行内使用分数 `\frac{}{}`，会导致分数所在段落的行内间距出错。
- 如果要向论文中插入 SVG 矢量图像格式，本地还得下 [InkScape](https://inkscape.org/)。
- 还没有完全符合要求——致谢页多的部分不印页眉和页码。
- 未能实现“插图处的该页空白不够排写该图整体时，则可将其后文字部分提前排写，将图移到次页”。需要人工不断调整以绕开此要求。
    - 即先输出图 x.y zzzzzzz，然后输出图片（包含子图）。
- 论文篇幅较大（50页以上）时，使用已有的编排格式可能会导致部分.tex不易于阅读。需要修改。
- 表格字号要手动用 `{\wuhao{}}` 与前后文隔开使用。比较麻烦。
    - 使用 longtable 时需要重复声明跨页表头和表尾的格式，比较慢发。

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
硬要说就放MIT许可证吧。

## 致谢
(排名不分先后，未列出部分于项目注释中可见)
+ [github.com/WhiteByeBye/HNUThesisTemplate-Bachelor](https://github.com/WhiteByeBye/HNUThesisTemplate-Bachelor)
+ [www.runoob.com/w3cnote/px-pt-em-convert-table.html](https://www.runoob.com/w3cnote/px-pt-em-convert-table.html)
+ [www.hnu.edu.cn](https://www.hnu.edu.cn/)
+ [tex.stackexchange.com/a/372825](https://tex.stackexchange.com/a/372825)
+ [tex.stackexchange.com/a/192450](https://tex.stackexchange.com/a/192450)
+ [fohte.hateblo.jp/entry/2017/02/03/130829](https://fohte.hateblo.jp/entry/2017/02/03/130829)
+ [chatgpt.com](https://chatgpt.com/)
+ [www.latex-tables.com](https://www.latex-tables.com/)
+ [overleaf.com](https://overleaf.com/)
+ [www.doubao.com](https://www.doubao.com/)
