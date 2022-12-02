import os
import std/strutils

proc main() =
  let fileName = paramStr(1)

  var maxSum = 0

  var curSum = 0

  for line in fileName.lines:
    if line.len == 0:
      maxSum = max(curSum, maxSum)
      curSum = 0
      continue

    curSum += line.parseInt

  echo maxSum


main()
