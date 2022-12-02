import os, math
import std/strutils

proc main() =
  let fileName = paramStr(1)

  var maxSumArray = [0,0,0]

  var curSum = 0

  for line in fileName.lines:
    if line.len == 0:
      if curSum > maxSumArray[0]:
        let temp = maxSumArray[0]
        # bubble down
        maxSumArray[0] = curSum
        maxSumArray[2] = maxSumArray[1]
        maxSumArray[1] = temp
      elif curSum > maxSumArray[1]:
        let temp = maxSumArray[1]
        # bubble down
        maxSumArray[1] = curSum
        maxSumArray[2] = temp
      elif curSum > maxSumArray[2]:
        maxSumArray[2] = curSum

      curSum = 0
      continue

    curSum += line.parseInt

  echo maxSumArray
  echo sum(maxSumArray)


main()
