@SET SCRIPTPATH=%CD%
@SET HOME=%SYSTEMDRIVE%%HOMEPATH%\AppData\Roaming

@IF EXIST %HOME%\.emacs (DEL %HOME%\.emacs)
@IF EXIST %HOME%\.emacs.d\lisp (RMDIR /S /Q %HOME%\.emacs.d\lisp)
@IF EXIST %HOME%\.emacs.d\ispell (RMDIR /S /Q %HOME%\.emacs.d\ispell)

@IF NOT EXIST %HOME%\.emacs.d (MKDIR %HOME%\.emacs.d)

@MKLINK %HOME%\.emacs %SCRIPTPATH%\.emacs > NUL
@MKLINK /D %HOME%\.emacs.d\lisp %SCRIPTPATH%\.emacs.d\lisp > NUL
@MKLINK /D %HOME%\.emacs.d\ispell %SCRIPTPATH%\.emacs.d\ispell > NUL
