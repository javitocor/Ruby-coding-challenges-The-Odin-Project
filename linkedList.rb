class LinkedList
  attr_reader :head, :tail, :size

  def initialize(value = nil)
    @size = 0
    @head = nil
    @tail = @head
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
      @size += 1
    else
      new_node = Node.new(value)
      @tail.next_node = new_node
      @tail = new_node
      @size += 1
    end
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
      @size += 1
    else
      node = @head 
      @head = Node.new(value)
      @head.next_node = node
      @size += 1
    end
  end

  def at(index) 
    node = @head
    index.times do
      node = node.next_node unless node.next_node.nil?
    end
    node
  end

  def pop
    n = @size - 2    
    @tail = at(n)
    @tail.next_node = nil
    @size -= 1
  end

  def contains?(value)
    node = @head
    @size.times do 
      if node.value == value 
        return true 
      end
      node = node.next_node
    end
    return false
  end

  def find(value) 
    return nil if !contains?(value)
    node = @head
    @size.times do |i|
      if node.value == value
        return i
      end
      node = node.next_node
    end
  end

  def to_s 
    node = @head 
    @size.times do 
      print "( #{node.value} ) -> "         
      node = node.next_node
    end
    print "nil\n"
  end

  def insert_at(value, index)
    if index == 0
      node = @head
      @head = Node.new(value)
      @head.next_node = node 
      @size += 1
    else
      node = @head
      (index - 1).times do
        node = node.next_node
      end
      new_node = Node.new(value, node.next_node)
      node.next_node = new_node
      @size += 1
    end
  end

  def remove_at(index)
    if @head.nil?
      puts "error"
    elsif index == 0
      node = @head
      new_head = node.next_node
      @head = new_head
      @size -= 1
    else
      node = @head
      (index - 1).times do
        node = node.next_node
      end
      node2 = @head
      (index + 1).times do
        node2 = node2.next_node
      end
      node.next_node = node2
      @size -= 1
    end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.to_s
list.append("John")
puts "Head: #{list.head.value}"
list.append("Doe")
puts "Tail: #{list.tail.value}"
list.prepend("I")
list.to_s
list.insert_at("Am", 1)
list.to_s
puts "Size: #{list.size}"
puts "Head: #{list.head.value}"
puts "Tail: #{list.tail.value}"
puts "Value at index 2: #{list.at(2).value}"
list.to_s
puts "Tail before: #{list.tail.value}"
list.pop
list.to_s
puts "Tail after: #{list.tail.value}"
puts "Contains \"Charlie\"? #{list.contains?("Charlie")}"
puts "Contains \"John\"? #{list.contains?("John")}"
puts "Find \"John\" at index: #{list.find("John")}"
puts "Find \"Am\" at index: #{list.find("Am")}"
list.to_s
list.insert_at("Not", 2)
list.to_s
list.remove_at(2)
list.to_s