#!/bin/bash
#
# Title: TICTACTOE ... the GAME! (For two players, x and o.)
# Filename: t3C-Copy 
#
###
##
#
#BLACK='\e[1;30m'
#RED='\e[1;31m'
#GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;34m'
BOLD='\e[1;39m'
BLINK='\e[5m'
OBLINK='\e[25m'
NORM='\e[0m'
echo -e ""
echo -e "${BOLD}TICTACTOE  ... the GAME!${NORM}"
echo -e "For 2 players: ${BLUE}x${NORM} and ${YELLOW}o${NORM}.  First ${BLUE}x${NORM}, then ${YELLOW}o${NORM}."
winsx=0
winso=0
ngames=0
while true
do
  ngames=$((ngames + 1))
  declare -a sq                            # declare sq an array
  sq=(1 2 3 4 5 6 7 8 9)                   # initial sqaare numbers in sq
  echo -e ""
  echo -e "Current Grid:"                  # echo modified grid
  echo -e "-------------"
  echo -e "| ${sq[0]} | ${sq[1]} | ${sq[2]} |"
  echo -e "-------------"
  echo -e "| ${sq[3]} | ${sq[4]} | ${sq[5]} |"
  echo -e "-------------"
  echo -e "| ${sq[6]} | ${sq[7]} | ${sq[8]} |"
  echo -e "-------------"
  echo -e ""
  sqStatus=" 1 2 3 4 5 6 7 8 9"
  win=0                                    # win indicator
  i=1                                      # input i = 1
  x="${BLUE}x${NORM}"
  o="${YELLOW}o${NORM}"
  winx="$x $x $x"                          # def win x pattern
  wino="$o $o $o"                          # def win o pattern
  while [ $win -eq 0 ]                     # while no win yet
  do
    echo -e "Status of squares: ${sq[*]}"  # print current sqs statuses
    sqStatus=`echo "${sqStatus//${entry}/}"`
    rtChoice=0
    while [ $rtChoice -eq 0 ]
    do
      entryCode=0
      while [ "$entryCode" -eq 0 ];
      do                                   # print available sq choices
        echo -e "Remaining squares: $sqStatus"
        if [ "$((i % 2))" != "0" ];  then
          echo -e "Entry for $x?"
	else
	  echo -e "Entry for $o?"
	fi
        read entry                         # input player's ith square (x,o/odd,even i)
        # verify {1..9}
        if [ "$entry" = "1" -o  "$entry" = 2 -o "$entry" = "3" -o  "$entry" = "4" -o "$entry" = "5" -o  "$entry" = "6" -o "$entry" = "7" -o  "$entry" = "8" -o "$entry" = "9" ]; then
          entryCode=1
	else
	  echo -e "You entered ${BOLD}\"$entry\"${NORM}.  Entry error.  Pls. re-enter ..."
	entryCode=0
	fi
      done
      # verify non-FILLED status of choice
      if [ "${sq[${entry}-1]}" = "$x" -o "${sq[${entry}-1]}" = "$o"  ]; then
        echo -e "Square ${BOLD}\"$entry\"${NORM} is already FILLED!!!"
      else
        rtChoice=1
      fi
    done
    if [ "$((i % 2))" != "0" ];  then       # player x input; steps 1,3,5,7,9
      sq[${entry}-1]="$x"                  # asign "x" to choice entry
      echo -e ""
      echo -e "Current Grid:"              # echo modified grid
      echo -e "-------------"
      echo -e "| ${sq[0]} | ${sq[1]} | ${sq[2]} |"
      echo -e "-------------"
      echo -e "| ${sq[3]} | ${sq[4]} | ${sq[5]} |"
      echo -e "-------------"
      echo -e "| ${sq[6]} | ${sq[7]} | ${sq[8]} |"
      echo -e "-------------"
      echo -e ""
      wr1="${sq[0]} ${sq[1]} ${sq[2]}"     # determine 8 relevant patterns
      wr2="${sq[3]} ${sq[4]} ${sq[5]}"
      wr3="${sq[6]} ${sq[7]} ${sq[8]}"
      wc1="${sq[0]} ${sq[3]} ${sq[6]}"
      wc2="${sq[1]} ${sq[4]} ${sq[7]}"
      wc3="${sq[2]} ${sq[5]} ${sq[8]}"
      wd1="${sq[0]} ${sq[4]} ${sq[8]}"
      wd2="${sq[2]} ${sq[4]} ${sq[6]}"     # compare 8 relevant patterns to winx patterns
      if [ "$wr1" = "$winx" -o "$wr2"  = "$winx" -o "$wr3" = "$winx" ]; then
        echo -e "${BOLD}hooorrrray${NORM} ... $x ${BLINK}wins!!!${OBLINK}" # print win message
        echo -e ""
        win=1                              # set win var to 1 to end curr game
        winsx=$((winsx + 1))
      elif [ "$wc1" = "$winx" -o "$wc2" = "$winx" -o "$wc3" = "$winx" -o "$wd1" = "$winx" -o "$wd2" = "$winx" ]; then
        echo -e "${BOLD}hooorrrray${NORM} ... $x ${BLINK}wins!!!${OBLINK}"
        echo -e ""
        win=1
        winsx=$((winsx + 1))
      fi
      i=$((i + 1))                      # increment step i
      if [ $i -ge 10 -a $win = 0 ]; then   # game ends in 9 or less steps
        echo -e "${BOLD}${BLINK}No winner! ... ${OBLINK}${NORM}"
        echo -e ""
        win=1                              # let win=1 to end curr game
      fi
    else
      sq[${entry}-1]="$o"                  # player o input; steps 2,4,6,8
      echo -e ""
      echo -e "Current Grid:"              # echo modified grid
      echo -e "-------------"
      echo -e "| ${sq[0]} | ${sq[1]} | ${sq[2]} |"
      echo -e "-------------"
      echo -e "| ${sq[3]} | ${sq[4]} | ${sq[5]} |"
      echo -e "-------------"
      echo -e "| ${sq[6]} | ${sq[7]} | ${sq[8]} |"
      echo -e "-------------"
      echo -e ""
      wr1="${sq[0]} ${sq[1]} ${sq[2]}"
      wr2="${sq[3]} ${sq[4]} ${sq[5]}"
      wr3="${sq[6]} ${sq[7]} ${sq[8]}"
      wc1="${sq[0]} ${sq[3]} ${sq[6]}"
      wc2="${sq[1]} ${sq[4]} ${sq[7]}"
      wc3="${sq[2]} ${sq[5]} ${sq[8]}"
      wd1="${sq[0]} ${sq[4]} ${sq[8]}"
      wd2="${sq[2]} ${sq[4]} ${sq[6]}"
      if [ "$wr1" = "$wino" -o "$wr2"  = "$wino" -o "$wr3" = "$wino" ]; then
        echo -e "${BOLD}hooorrrray${NORM} ... $o ${BLINK}wins!!!${OBLINK}"
        echo -e ""
        win=1
        winso=$((winso + 1))
      elif [ "$wc1" = "$wino" -o "$wc2" = "$wino" -o "$wc3" = "$wino" -o "$wd1" = "$wino" -o "$wd2" = "$wino" ]; then
        echo -e "${BOLD}hooorrrray${NORM} ... $o ${BLINK}wins!!!${OBLINK}"
        echo -e ""
        win=1
        winso=$((winso + 1))
      fi
      i=$((i + 1))                      # increment step i
    fi
  done
  echo -e "Current score:"
  echo -e "  Total games played: $ngames"
  echo -e "  $x wins: $winsx"
  echo -e "  $o wins: $winso"
  echo -e " no wins: $((ngames - winsx - winso))"
  echo -e "Another game?[Y/n]"
  read no
  if [ "$no" = "n" -o "$no" = "N" -o "$no" = "no" -o "$no" = "No" ]; then
    echo -e ""
    echo -e "Here's hoping you enjoyed ${BOLD}TICTACTOE ... the GAME!${NORM}"
    echo -e "Try it again soon!"
    echo -e "THANK YOU!!!"
    exit
  else
    echo -e "${BOLD}****************${NORM}"
    echo -e "${BOLD}*** New Game ***${NORM}"
    echo -e "${BOLD}****************${NORM}"
    entry=""
  fi
done
#
##
###
