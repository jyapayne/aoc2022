import os
import std/strutils

# A, X - rock
# B, Y - paper
# C, Z - scissors

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

  YOU_ROCK = "X"
  YOU_PAPER = "Y"
  YOU_SCISSORS = "Z"

proc rock(symStr: string): int =
  case symStr:
  of YOU_ROCK:
    ROCK_POINTS + DRAW_POINTS
  of YOU_PAPER:
    PAPER_POINTS + WIN_POINTS
  of YOU_SCISSORS:
    SCISSORS_POINTS + LOSE_POINTS
  else:
    0

proc paper(symStr: string): int =
  case symStr:
  of YOU_ROCK:
    ROCK_POINTS + LOSE_POINTS
  of YOU_PAPER:
    PAPER_POINTS + DRAW_POINTS
  of YOU_SCISSORS:
    SCISSORS_POINTS + WIN_POINTS
  else:
    0

proc scissors(symStr: string): int =
  case symStr:
  of YOU_ROCK:
    ROCK_POINTS + WIN_POINTS
  of YOU_PAPER:
    PAPER_POINTS + LOSE_POINTS
  of YOU_SCISSORS:
    SCISSORS_POINTS + DRAW_POINTS
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
