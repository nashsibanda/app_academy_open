require 'method_source'

class Recursion

  def sum_to(n)
    return nil if n < 1
    return 1 if n == 1
    n + sum_to(n - 1)
  end
  
  def add_numbers(array)
    return array.first if array.length <= 1
    array.first + add_numbers(array[1..-1])
  end
  
  def gamma_fnc(n)
    return nil if n < 1
    return 1 if n <= 1
    (n - 1) * gamma_fnc((n - 1))
  end
  
  def ice_cream_shop(flavors, favorite)
    return false if flavors.length < 1
    return true if flavors.first == favorite
    ice_cream_shop(flavors[1..-1], favorite)
  end
  
  def reverse(str)
    return str if str.length <= 1
    reverse(str[1..-1]) + str[0]
  end
  
  def test(method)
    system("clear")
    case method
    when "1"
      puts "Method source code:"
      puts "--------------------"
      Recursion.instance_method(:sum_to).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      p sum_to(5)  # => returns 15
      p sum_to(1)  # => returns 1
      p sum_to(9)  # => returns 45
      p sum_to(-8)  # => returns nil  
    when "2"
      puts "Method source code:"
      puts "--------------------"
      Recursion.instance_method(:add_numbers).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      p add_numbers([1,2,3,4]) # => returns 10
      p add_numbers([3]) # => returns 3
      p add_numbers([-80,34,7]) # => returns -39
      p add_numbers([]) # => returns nil
    when "3"
      puts "Method source code:"
      puts "--------------------"
      Recursion.instance_method(:gamma_fnc).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      p gamma_fnc(0)  # => returns nil
      p gamma_fnc(1)  # => returns 1
      p gamma_fnc(4)  # => returns 6
      p gamma_fnc(8)  # => returns 5040
    when "4"
      puts "Method source code:"
      puts "--------------------"
      Recursion.instance_method(:ice_cream_shop).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
      p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
      p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
      p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
      p ice_cream_shop([], 'honey lavender')  # => returns false
    when "5"
      puts "Method source code:"
      puts "--------------------"
      Recursion.instance_method(:reverse).source.display
      puts "--------------------"
      puts
      puts "Test outputs"
      p reverse("house") # => "esuoh"
      p reverse("dog") # => "god"
      p reverse("atom") # => "mota"
      p reverse("q") # => "q"
      p reverse("id") # => "di"
      p reverse("") # => ""
    when "6"
      return true
    else
      puts "#{method} is not a valid selection."
    end
    puts
    test_select
  end

  def test_select
    puts "Pick a method to test: 1. sum_to | 2. add_numbers | 3. gamma_fnc | 4. ice_cream_shop | 5. reverse | 6. Exit this program"
    test(gets.chomp)
  end

end

recursor = Recursion.new
recursor.test_select

# Recursion.instance_method(:sum_to).source.display