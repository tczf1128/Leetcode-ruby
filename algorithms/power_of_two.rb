# https://leetcode.com/problems/power-of-two/
#
# Given an integer, write a function to determine if it is a power of two.
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  return false if n <= 0

  while n > 1
    n, rem = n.divmod(2)
    return false if rem != 0
  end

  return true
end
