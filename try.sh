#! /bin/sh
while(true)
do
  echo ""
  echo "Which game do you whant to play?"
  echo "select from bellow"
  echo "1. TicTacToe "
  echo "2. I always win"
  echo "3. Exit"
  echo ""
  read x
  case "$x" in
#Using absolute path
    #1) sh /c/Users/Chiranth/desktop/mini_unix/t3C-Copy.sh ;;
    #2) sh /c/Users/Chiranth/desktop/mini_unix/i-always-win.sh ;;
    #Using relative path
    1) ./t3C-Copy.sh ;;
    2) ./i-always-win.sh ;;
    3) break ;;
  esac
done
