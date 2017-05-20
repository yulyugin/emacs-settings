#!/usr/bin/sh

script_path=`pwd`

rm_f="rm -rf"

$rm_f ~/.emacs
$rm_f ~/.emacs.d/lisp
$rm_f ~/.emacs.d/ispell

mkdir -p ~/.emacs.d

ln -s $script_path/.emacs ~/
ln -s $script_path/.emacs.d/lisp ~/.emacs.d/
ln -s $script_path/.emacs.d/ispell ~/.emacs.d/
