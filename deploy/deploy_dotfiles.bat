@echo off

mklink "%USERPROFILE%\\.vimrc" "%DOTFILES%\\.vimrc"
echo "LINK: [%USERPROFILE%\.vimrc], TARGET: [%DOTFILES%\.vimrc]"

mklink "%USERPROFILE%\\.bashrc" "%DOTFILES%\\.bashrc"
echo "LINK: [%USERPROFILE%\\.bashrc], TARGET: [%DOTFILES%\\.bashrc]"

rem �f�B���N�g���̏ꍇ
rem mklink /D %LINK% %DOTFILES&

pause
exit
