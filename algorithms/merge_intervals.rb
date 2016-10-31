# https://leetcode.com/problems/merge-intervals/
#
# Given a collection of intervals, merge all overlapping intervals.
#
# For example:
#
#     Given [1, 3], [2, 6], [8, 10], [15, 18],
#     Return [1, 6], [8, 10], [15, 18].


# Definition for an interval.
# class Interval
#   attr_accessor :start, :end
#   def initialize(s=0, e=0)
#     @start = s
#     @end = e
#   end
# end


# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
  return [] if intervals.empty?

  intervals = intervals.sort { |x, y| x.start <=> y.start }

  result, new_interval = [], Interval.new(intervals[0].start, intervals[0].end)
  intervals.each do |it|
    if it.start <= new_interval.end
      new_interval.end = it.end if new_interval.end < it.end
    else
      result << new_interval
      new_interval = Interval.new(it.start, it.end)
    end
  end
  result << new_interval
  result
end
