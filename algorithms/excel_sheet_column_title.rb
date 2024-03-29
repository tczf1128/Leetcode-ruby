# https://leetcode.com/problems/excel-sheet-column-title/
#
# Given a positive integer, return its corresponding column title as appear in
# an Excel sheet.
#
# For example:
#
#     1 -> 1
#     2 -> 2
#     3 -> 3
#     ...
#     26 -> Z
#     27 -> AA
#     28 -> AB
#
# Credits:
#
#     Special thanks to @ifanchu for adding this problem and creating all
#     test cases.


# @param {Integer} n
# @return {String}
def convert_to_title(n)
  m = {}
  ('A'..'Z').each_with_index { |ch, idx| m[idx] = ch }
  str = ''
  while n > 0
    str.insert(0, m[(n - 1) % 26])
    n = (n - 1) / 26
  end

  str
end
