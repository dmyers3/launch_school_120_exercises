require 'pry'

class QueueElement
  def initialize(value)
    @value = value
    @created_at = Time.now
  end
  
  
end

class CircularQueue
  attr_reader :size
  
  def initialize(size)
    @queue = Array.new(size)
    @size = size
  end
  
  def enqueue(value)
    @queue[add_index] = QueueElement.new(value)
    update_add_index
  end
  
  def dequeue
    return_object = @queue[oldest_index]
    @queue[oldest_index] = nil
    update_oldest_index
    return_object
  end

  
  attr_accessor :oldest_index, :add_index
  
  # 3 spot circular queue, index 0,1,2
  
  def update_add_index
    queue_full? ? @add_index = oldest_index : @add_index = next_empty(add_index)
  end
  
  def oldest_index
    
  end
  
  def update_oldest_index
    @oldest_index = update_oldest_index_helper
  end
  
  def update_oldest_index_helper
    ((@oldest_index + 1)..(size - 1)).each do |slot| 
      return slot if @queue[slot] != nil
    end
    (0..(oldest_index)).each do |slot|
      return slot if @queue[slot] != nil
    end
  end
  
  def queue_full?
    @queue.index(nil) == nil
  end
  
  def next_empty(add_index)
    ((add_index + 1)..(size - 1)).each do |slot| 
      return slot if @queue[slot] == nil
    end
    (0..(add_index)).each do |slot|
      return slot if @queue[slot] == nil
    end
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

