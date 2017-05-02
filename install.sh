#!/usr/bin/sh

script_path=`pwd`

rm ~/.emacs
rm -r ~/.emacs.d/lisp

ln -s $script_path/.emacs ~/
ln -s $script_path/.emacs.d/lisp ~/.emacs.d/
