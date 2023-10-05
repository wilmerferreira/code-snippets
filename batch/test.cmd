CLS

:: This disables the output of the command invocation
@ECHO off

:: First argument (raw value)
ECHO %0

:: First argument - without quotes
ECHO %~0

:: First argument - short path
ECHO %~s0

:: First argument - parent folder
ECHO %~dp0

:: First argument - parent folder
ECHO %~n0
ECHO %~x0
ECHO %~nx0

:: This is a variable declaration
:: SET /a foo=2 + 2
:: ECHO %foo%

:: This restore the echo
ECHO on