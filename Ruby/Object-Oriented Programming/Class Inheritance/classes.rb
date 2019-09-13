class Employee
  attr_reader :name, :title, :salary, :boss
  
  def initialize(name, title, salary, boss = nil)
    @name, @title, @salary, @boss = name, title, salary, boss
    assign_boss(@boss)
  end

  def bonus(multiplier)
    return @salary * multiplier
  end

  def assign_boss(boss)
    if @boss
      @boss.assigned_employees << self
    end
  end

  def inspect
    { "Name" => @name, "Boss" => @boss }
  end

end

class Manager < Employee
  attr_accessor :assigned_employees
  
  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @assigned_employees = []
  end

  def bonus(multiplier)
    bonus = subordinate_salary * multiplier
    bonus
  end

  def subordinate_salary
    subordinate_salaries = 0
    @assigned_employees.each do |employee|
      if employee.is_a?(Manager)
        subordinate_salaries += employee.salary
        subordinate_salaries += employee.subordinate_salary
      else
        subordinate_salaries += employee.salary
      end
    end
    return subordinate_salaries
  end

  def inspect
    { "Name" => @name, "Boss" => @boss }
  end

end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5)
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000