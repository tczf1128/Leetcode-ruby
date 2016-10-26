# https://leetcode.com/problems/string-to-integer-atoi/
#
# Implement atoi to convert a string to an integer.

# Limit on Integer Contants
INT_BIT = 32
INT_MAX = 2 ** (INT_BIT - 1) - 1
INT_MIN = -2 ** (INT_BIT - 1)

# @param {String} str
# @return {Integer}
def my_atoi(str)
  idx = 0
  idx += 1 while str[idx] == ' '

  case str[idx]
  when '+'; idx, positive = idx + 1, true
  when '-'; idx, positive = idx + 1, false
  else    ; positive = true
  end

  return 0 if !('0'..'9').include?(str[idx])
  sum = 0
  str[idx..-1].each_char do |ch|
    break if !('0'..'9').include?(ch)
    sum = sum * 10 + ch.to_i
  end

  positive ? [sum, INT_MAX].min : [-sum, INT_MIN].max
end
