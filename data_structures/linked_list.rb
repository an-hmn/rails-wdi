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

  def pop
    return nil unless @first

    if @first.next == nil
      value = @first.value
      @first = nil
      return value
    end

    current_node = @first
    done = false
    while !done
      if current_node.next.next == nil
        done = true
      else
        current_node = current_node.next
      end
    end

    value = current_node.next.value
    current_node.next = nil

    value
  end
end
