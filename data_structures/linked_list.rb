class Node
  attr_accessor :value, :next

  def initialize(value, next_node=nil)
    @value = value
    @next = next_node
  end
end

class List
  attr_accessor :first

  def initialize()
    @first = nil
  end

  def push(value)
    node = Node.new(value)

    if @first
      current_node = @first
      while current_node.next != nil
        current_node = current_node.next
      end
      current_node.next = node
    else
      @first = node
    end

    self
  end

  def pop(value)
  end
end
