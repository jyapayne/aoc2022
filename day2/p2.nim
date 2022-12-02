import os
import std/strutils

# A - rock
# B - paper
# C - scissors
# X = lose
# Y = draw
# Z = win

const
  ROCK_POINTS = 1
  PAPER_POINTS = 2
  SCISSORS_POINTS = 3

  ROCK = "A"
  PAPER = "B"
  SCISSORS = "C"

  LOSE_POINTS = 0
  DRAW_POINTS = 3
  WIN_POINTS = 6

  LOSE = "X"
  DRAW = "Y"
  WIN = "Z"

proc rock(symStr: string): int =
  case symStr:
  of LOSE:
    SCISSORS_POINTS + LOSE_POINTS
  of DRAW:
    ROCK_POINTS + DRAW_POINTS
  of WIN:
    PAPER_POINTS + WIN_POINTS
  else:
    0

proc paper(symStr: string): int =
  case symStr:
  of LOSE:
    ROCK_POINTS + LOSE_POINTS
  of DRAW:
    PAPER_POINTS + DRAW_POINTS
  of WIN:
    SCISSORS_POINTS + WIN_POINTS
  else:
    0

proc scissors(symStr: string): int =
  case symStr:
  of LOSE:
    PAPER_POINTS + LOSE_POINTS
  of DRAW:
    SCISSORS_POINTS + DRAW_POINTS
  of WIN:
    ROCK_POINTS + WIN_POINTS
  else:
    0

proc calcScore(left, right: string): int =
  case left:
  of ROCK:
    rock(right)
  of PAPER:
    paper(right)
  of SCISSORS:
    scissors(right)
  else:
    0


proc main() =
  let fileName = paramStr(1)

  var sum = 0
  var count = 0

  for line in fileName.lines:
    let sp = line.split(" ")
    sum += calcScore(sp[0], sp[1])
    count += 1

  echo sum


main()
