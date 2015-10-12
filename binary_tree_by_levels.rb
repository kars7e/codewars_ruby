# Sort binary tree by levels 
# Problem URL: http://www.codewars.com/kata/sort-binary-tree-by-levels/ruby
# Short desc:
#   Given a binary tree as a linked list, sort it by levels,
#   so that resulting list contains root as a first element,
#   nodes from its children as following elements, etc.
# Examples:
#   Following tree:
#                2
#            8        9
#          1  3     4   5
#   Should return following list:
#     [2,8,9,1,3,4,5] 

class Queue
  def initialize
    @store = Array.new
  end
  
  def dequeue
    @store.pop
  end
  
  def enqueue(element)
    @store.unshift(element)
    self
  end
  
  def size
    @store.size
  end
end
# return the array containing the tree levels, from root to last level.
def tree_by_levels(node)
  return [] if node == nil
  q = Queue.new
  ret_arr = []
  q.enqueue(node)
  while q.size > 0
    cur = q.dequeue
    ret_arr << cur.value
    q.enqueue(cur.left) if cur.left
    q.enqueue(cur.right) if cur.right
  end
  return ret_arr
end
