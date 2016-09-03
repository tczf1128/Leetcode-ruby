# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
#
# Say you have an array for which the ith element is the price of a given
# stock on day i. If you were only permitted to complete at most one
# transaction (ie, buy one and sell one share of the stock), design an
# algorithm to find the maximum profit.


# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  max_profit = 0

  min_price = prices[0]
  prices.each do |p|
    min_price = p if min_price > p
    profit = p - min_price
    max_profit = profit if max_profit < profit
  end

  max_profit
end
