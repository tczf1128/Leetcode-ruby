# You are playing the following Bulls and Cows game with your friend:
# You write down a number and ask your friend to guess what the number is.
# Each time your friend makes a guess, you provide a hint that indicates how
# many digits in said guess match your secret number exactly in both digit
# and position (called "bulls") and how many digits match the secret number
# but locate in the wrong position (called "cows"). Your friend will use
# successive guesses and hints to eventually derive the secret number.

# For example:
#     Secret number:  "1807"
#     Friend's guess: "7810"
# Hint: 1 bull and 3 cows. (The bull is 8, the cows are 0, 1 and 7.)
# Write a function to return a hint according to the secret number and friend's guess,
# use A to indicate the bulls and B to indicate the cows. In the above example, your
# function should return "1A3B".

# Please note that both secret number and friend's guess may contain duplicate digits,
# for example:
#     Secret number:  "1123"
#     Friend's guess: "0111"
# In this case, the 1st 1 in friend's guess is a bull, the 2nd or 3rd 1 is a cow, and your function should return "1A1B".
# You may assume that the secret number and your friend's guess only contain digits, and their lengths are always equal.

# Credits:
# Special thanks to @jeantimex for adding this problem and creating all test cases.
#
# @param {String} secret
# @param {String} guess
# @return {String}
def get_hint(secret, guess)
  c1, c2, m1, m2 = 0, 0, {}, {}

  0.upto(secret.seize - 1) do |i|
    ch1, ch2 = secret[i], guess[i]

    if ch1 == ch2
      c1 += 1
      next
    end

    m1[ch1] ||= 0; m1[ch1] += 1
    m2[ch2] ||= 0; m2[ch2] += 1
  end

  m1.each do |k, v|
    c2 += [v, m2[k]].min if m2.key?(k)
  end

  "#{c1}A#{c2}B"
end
