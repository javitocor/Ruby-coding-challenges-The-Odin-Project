class Node 
  attr_accessor :data, :right, :left

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

class Tree 
  attr_accessor :array, :root
  def initialize(array)
    @array = array.sort.uniq
    @root = build_tree(@array, 0, @array.length-1)
  end

  def build_tree(array, start=0, last=array.length-1)
    return nil if start > last
  
    mid = (start + last) / 2
    node = Node.new(array[mid])
  
    node.left = build_tree(array, start, mid - 1)
    node.right = build_tree(array, mid + 1, last)
  
    return node
  end

  def insert(value, current_root = @root)
    if current_root.nil?
      new_node = Node.new(value)
      return new_node
    end 

    if value < current_root.data
      current_root.left = insert(value, current_root.left)
    elsif value > current_root.data 
      current_root.right = insert(value, current_root.right)    
    end 
    current_root
  end

  def delete(value, current_root = @root)
    return nil if current_root.nil?
    if value < current_root.data 
      current_root.left = delete(value, current_root.left)
    elsif value > current_root.data
      current_root.right = delete(value, current_root.right)
    else
      delete_node(current_root)
    end
    current_root
  end

  def delete_node(node) 
    if node.right.nil? && node.left.nil?
      return node = nil 
    elsif node.left.nil?
      node = node.right
      node.right = nil
      return node 
    elsif node.right.nil?
      node = node.left  
      node.left = nill
      return node 
    end

    next_val = min_right(node.right)
    delete(next_val)
    node.data = next_val
    return node
  end

  def min_right(node)
    return node.data if node.left.nil?

    min_right(node.left)
  end

  def find(value, current_root = @root)
    return nil if current_root.nil?
    return current_root.data if value == current_root.data 
    if value < current_root.data 
      find(value, current_root.left)
    elsif value > current_root.data
      find(value, current_root.right)
    end
  end

  def level_order(node = @root)
    arr = []
    queue = []
    queue.push(node)
    while !queue.empty?
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
      arr.push(queue.shift.data)
      node = queue.first
    end
    return arr
  end

  def inorder(root = @root, arr = [])
    return arr if root.nil?
    
    inorder(root.left, arr)
    arr.push(root.data)
    inorder(root.right, arr)

    return arr
  end

  def preorder(root = @root, arr = [])
    return arr if root.nil?

    arr.push(root.data)
    preorder(root.left, arr)
    preorder(root.right, arr)

    return arr
  end

  def postorder(root = @root, arr = [])
    return arr if root.nil?

    postorder(root.left, arr)
    postorder(root.right, arr)
    arr.push(root.data)

    return arr
  end

  def height(node)
    return 0 if node.nil?
    left_height = height(node.left)
    right_height = height(node.right)
    left_height > right_height ? left_height + 1 : right_height + 1
  end

  def depth(node = @root)
    return 0 if node.nil?

    left_depth = depth(node.left)
    right_depth = depth(node.right)

    left_depth > right_depth ? left_depth + 1 : right_depth + 1
  end

  def balanced?(node = @root)
    return true if node.nil?
    left_height = height(node.left)
    right_height = height(node.right)
    return false if (left_height - right_height).abs > 1
    balanced?(node.left) && balanced?(node.right)
  end

  def rebalance
    @root = build_tree(inorder, 0, inorder.length - 1) unless balanced?
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end


arr = (Array.new(15) {rand(1..100)})
new_tree = Tree.new(arr)
new_tree.pretty_print
p new_tree.balanced?
p new_tree.level_order
p new_tree.preorder
p new_tree.inorder
p new_tree.postorder
p new_tree.find(55)
new_tree.insert(101)
new_tree.insert(122)
new_tree.insert(133)
new_tree.pretty_print
p new_tree.balanced?
new_tree.rebalance
new_tree.pretty_print
p new_tree.balanced?
p new_tree.preorder
p new_tree.inorder
p new_tree.postorder
new_tree.delete(133)
p new_tree.balanced?
new_tree.rebalance
new_tree.pretty_print
p new_tree.balanced?
p new_tree.preorder
p new_tree.inorder
p new_tree.postorder