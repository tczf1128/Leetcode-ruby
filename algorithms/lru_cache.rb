# https://leetcode.com/problems/lru-cache/
#
# Design and implement a data structure for Least Recently Used (LRU) cache.
# It should support the following operations: get and set.
#
#     + get(key) - Get the value (will always be positive) of the key if the
#       key exists in the cache, otherwise return -1.
#     + set(key, value) - Set or insert the value if the key is not already
#       present. When the cache reached its capacity, it should invalidate the
#       least recently used item before inserting a new item.

class DoubleLinkedListNode
  attr_accessor :key, :value, :prev, :next

  def initialize(key = nil, value = nil)
    @key, @value = key, value
  end
end

class DoubleLinkedList
  def initialize
    @dummy = DoubleLinkedListNode.new
    @dummy.prev = @dummy.next = @dummy
  end

  def push_front(key, value)
    node = DoubleLinkedListNode.new(key, value)
    node.prev = @dummy
    node.next = @dummy.next
    @dummy.next.prev = node
    @dummy.next = node

    node
  end

  def pop_back
    delete(@dummy.prev)
  end

  def delete(node)
    node.tap do |n|
      n.prev.next = n.next
      n.next.prev = n.prev
    end
  end
end

class LRUCache
  # Initialize your data structure here
  # @param {Integer} capacity
  def initialize(capacity)
    @capacity = capacity
    @map, @list = {}, DoubleLinkedList.new
  end

  # @param {Integer} key
  # @return {Integer}
  def get(key)
    return -1 unless @map.key?(key)

    node = @list.delete(@map.delete(key))
    @map[key] = @list.push_front(node.key, node.value)

    node.value
  end

  # @param {Integer} key
  # @param {Integer} value
  # @return {Void}
  def set(key, value)
    if @map.key?(key)
      @list.delete(@map.delete(key))
    elsif @map.size == @capacity
      @map.delete(@list.pop_back.key)
    end

    @map[key] = @list.push_front(key, value)

    nil
  end
end

