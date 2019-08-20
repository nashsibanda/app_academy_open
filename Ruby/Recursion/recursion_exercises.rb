require 'method_source'
require 'byebug'

class Array
  
  def deep_dup
    output = []
    self.each do |ele|
      output.push(ele.deep_dup) if ele.is_a?(Array)
      output << ele
    end
  end

end

class RecursiveFunctions

  def test_select
    puts "Pick a method to test: 1. range | 2. sum (recursive and iterative) | 3. exponent_1 | 4. exponent_2 | 5. deep_dup | 6. fibonacci | 7. bsearch | 8. merge_sort | 9. subsets | 0. Exit this program"
    test(gets.chomp)
  end

  private
  
  def range(startnum, endnum)
    return [] if startnum >= endnum
    [startnum] + range((startnum + 1), endnum)
  end
  
  def sum_of_array_recursive(array)
    return array.first if array.length <= 1
    array.first + sum_of_array_recursive(array[1..-1])
  end
  
  def sum_of_array_iterative(array)
    sum = 0
    array.each { |num| sum += num }
    sum
  end

  def exponent_1(base, exponent)
    return 1 if exponent == 0
    base * exponent_1(base, (exponent - 1))
  end

  def exponent_2(base, exponent)
    return 1 if exponent == 0
    return base if exponent == 1
    if exponent.even?
      inductor = exponent_2(base, (exponent / 2))
      return inductor * inductor 
    elsif exponent.odd?
      inductor = exponent_2(base, ((exponent - 1) / 2))
      return base * (inductor * inductor)
    end
  end

  def fibonacci(n)
    return [1] if n == 1
    return [1, 1] if n == 2
    fibonacci(n - 1) + [fibonacci(n - 1).last + fibonacci(n - 2).last]
  end

  def bsearch(array, target)
    return nil if !array.include?(target)
    midpoint_idx = (array.length / 2.0).ceil
    left_arr = array[0...midpoint_idx]
    right_arr = array[midpoint_idx..-1]
    return (left_arr.length - 1) if left_arr.last == target
    if left_arr.last > target
      bsearch(left_arr, target)
    elsif left_arr.last < target
      (left_arr.length - 1) + (bsearch(right_arr, target) + 1)
    end
  end

  def merge_sort(array)
    return array if array.length <= 1
    sliced = slice(array)
    left_slice = sliced[0]
    right_slice = sliced[1]
    if left_slice.length <= 1 && right_slice.length <= 1
      merged = []
      until merged.length == array.length
        merged = merge(left_slice, right_slice)
      end
      return merged
    end
    merged = merge(merge_sort(left_slice), merge_sort(right_slice))
    merged
  end

  def slice(array)
    array.each_slice( (array.length/2.0).ceil ).to_a
  end

  def merge(left_arr, right_arr, merged = Array.new([]))
    return merged if left_arr.empty? && right_arr.empty?
    if right_arr.empty? || (!left_arr.empty? && left_arr.first <= right_arr.first)
      merged << left_arr.shift
      merge(left_arr, right_arr, merged)
    elsif left_arr.empty? || left_arr.first > right_arr.first
      merged << right_arr.shift
      merge(left_arr, right_arr, merged)
    end
  end

  def subsets(array)
    return [array] if array.empty?
    lastele = [array.pop]
    inductor = subsets(array)
    return inductor + (inductor.map {|ele| ele + lastele})
  end

  def test(method)
    system("clear")
    case method
    when "1" # => Range method
      puts "Method source code:"
      puts "--------------------"
      RecursiveFunctions.instance_method(:range).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      p range(1, 5)  # => returns 15
      p range(2, 11)  # => returns 1
      p range(-4, 9)  # => returns 45
      p range(-3, -8)  # => returns nil
    when "2" # => Sum of Array (Recursive and Iterative)
      puts "Method source code:"
      puts "--------------------"
      RecursiveFunctions.instance_method(:sum_of_array_recursive).source.display
      RecursiveFunctions.instance_method(:sum_of_array_iterative).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      arr = [1, 2, 3, 4, 5, 6, 7]
      p sum_of_array_recursive(arr)
      p sum_of_array_iterative(arr)
      p sum_of_array_recursive([1, 2, 3, 4])
      p sum_of_array_iterative([2, 3, 4, 5, 6, 7, 8, 9, 10])
      p sum_of_array_recursive([-4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8])
    when "3" # => Exponent_1
      puts "Method source code:"
      puts "--------------------"
      RecursiveFunctions.instance_method(:exponent_1).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      p exponent_1(2, 2)
      p exponent_1(2, 6)
      p exponent_1(3, 3)
    when "4" # => Exponent_2
      puts "Method source code:"
      puts "--------------------"
      RecursiveFunctions.instance_method(:exponent_2).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      p exponent_2(2, 2)
      p exponent_2(2, 100)
      p exponent_2(3, 3)
    when "5" # => Deep dup
      puts "Method source code:"
      puts "--------------------"
      Array.instance_method(:deep_dup).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      arr = [1, 2, 3, 4, 5, [6, [3, 2, [2, 2]], 2], 7]
      arr2 = [1, [2], [3, [4]]]
      p arr.deep_dup
      p arr2.deep_dup
    when "6" # => Fibonacci
      puts "Method source code:"
      puts "--------------------"
      RecursiveFunctions.instance_method(:fibonacci).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      p fibonacci(2)
      p fibonacci(5)
      p fibonacci(7)
    when "7" # => Binary search
      puts "Method source code:"
      puts "--------------------"
      RecursiveFunctions.instance_method(:bsearch).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      p bsearch([1, 2, 3], 1) # => 0
      p bsearch([2, 3, 4, 5], 3) # => 1
      p bsearch([2, 4, 6, 8, 10], 6) # => 2
      p bsearch([1, 3, 4, 5, 9], 5) # => 3
      p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
      p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
      p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
    when "8" # => Merge sort
      puts "Method source code:"
      puts "--------------------"
      RecursiveFunctions.instance_method(:merge_sort).source.display
      puts
      RecursiveFunctions.instance_method(:merge).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      p merge_sort([16, 5, 2, 9, 18, 15, 6]) # => [2, 5, 6, 9, 15, 16, 18]
      p merge_sort([5, 18, 12, 1, 11, 2, 3]) # => [1, 2, 3, 5, 11, 12, 18]
      p merge_sort([16, 20, 7, 9, 15, 4, 19]) # => [4, 7, 9, 15, 16, 19, 20]
      p merge_sort([10, 18, 16, 5, 7, 6, 19]) # => [5, 6, 7, 10, 16, 18, 19]
      p merge_sort([19, 20, 3, 17, 6, 9, 18]) # => [3, 6, 9, 17, 18, 19, 20]
      p merge_sort([3, 15, 18, 7, 2, 9, 16]) # => [2, 3, 7, 9, 15, 16, 18]
      p merge_sort([3, 14, 6, 16, 5, 9, 1]) # => [1, 3, 5, 6, 9, 14, 16]
    when "9"
      puts "Method source code:"
      puts "--------------------"
      RecursiveFunctions.instance_method(:subsets).source.display
      # puts
      # RecursiveFunctions.instance_method(:merge).source.display
      puts "--------------------"
      puts
      puts "Test outputs:"
      p subsets([]) # => [[]]
      p subsets([1]) # => [[], [1]]
      p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
      p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
      p subsets([16, 5, 2, 9, 18, 15, 6])
    when "0"
      puts "Thanks!"
      # sleep(1)
      return true
    else
      puts "#{method} is not a valid selection."
    end
    puts
    test_select
  end

end


recursor = RecursiveFunctions.new
recursor.test_select