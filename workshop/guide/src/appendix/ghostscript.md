# GhostScript
In order to save trees, we are not going to send our experimentations to an actual printer. Instead we are going to use a PostScript interpreter.

Specifically, we are going to use [_GhostScript_][ghostscript].

![The GhostScript Logo](../image/ghostscript-plus-text.png)

GhostScript is a

> an interpreter for the PostScript®  language and PDF files. Ghostscript consists of a PostScript interpreter layer and a graphics library.

## Installation
[Obtaining GhostScript][ghostscript:download] depends on your platform.

### Windows
The installation page has binaries for [Windows][ghostscript:download].

### Mac
There is a [homebrew recipe][homebrew:ghostscript] that can be used to install GhostScript.

```
homebrew install ghostscript
```

### Linux
It is likely that GhostScript is already installed, or that you can install it via a package manager. Otherwise the installation page has binaries for [Linux][ghostscript:download] as well.

## Verification
Once installed you can verify that GhostScript works as intended by starting the program. There are various aliases notably `ghostscript` or the shorter `gs` should open a blank window and show the following prompt in the terminal

```
GPL Ghostscript 9.50 (2019-10-15)
Copyright (C) 2019 Artifex Software, Inc.  All rights reserved.
This software is supplied under the GNU AGPLv3 and comes with NO WARRANTY:
see the file COPYING for details.
GS>
```

This can be used as a Read-Eval-Print-Loop (REPL). See the [Hello, World][book:tool:hello-world] on how to use that.

## Alternative
GhostScript is a low-level tool that allows you to inspect PostScript programs and how they are interpreted. But often you will want to open a high level viewer.

Again, installing a PostScript viewer is platform dependent. Below we will provide some suggestions per platform

### Windows
[_psviewer_][psviewer] seems a capable PostScript viewer on Windows

### Mac
The default `Preview.app` has the capability to show PostScript files

### Linux
The utility `gv`, which stands for _ghostview_ and can be installed via a packagemanager, is a clunky, but good viewer. It has the option to watch the file you are developing for changes and update the display when changes occur.

## In case of emergency
If all the above fails, we have created a utility that will render your PostScript over the web

[https://postscript-render.fly.dev/static/index.html](https://postscript-render.fly.dev/static/index.html)

[book:tool:hello-world]: ../tool/hello-world
[ghostscript]: https://www.ghostscript.com/index.html
[ghostscript:download]: https://www.ghostscript.com/releases/gsdnld.html
[homebrew:ghostscript]: https://formulae.brew.sh/formula/ghostscript
[psviewer]: https://psviewer.org/

