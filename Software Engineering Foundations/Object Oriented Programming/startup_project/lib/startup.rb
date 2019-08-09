require "employee"

class Startup
  attr_reader :name
  attr_accessor :funding, :salaries, :employees

  def initialize(name, funding, salaries_hash)
    @name = name
    @funding = funding
    @salaries = salaries_hash
    @employees = []
  end

  def valid_title?(title)
    @salaries.keys.include?(title)
  end

  def >(startup)
    self.funding > startup.funding
  end

  def hire(name, title)
    raise "error" if !valid_title?(title)
    @employees << Employee.new(name, title)
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]
    if @funding > salary
      employee.pay(salary)
      @funding -= salary
    else
      raise "not enough funding to pay employee!"
    end
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee) }
  end

  def average_salary
    all_salaries = []
    @employees.each { |employee| all_salaries << @salaries[employee.title] }
    all_salaries.sum / all_salaries.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    self.funding += startup.funding
    startup.salaries.each do |key, value|
      if !valid_title?(key)
        self.salaries[key] = value
      end
    end
    startup.employees.each { |employee| self.employees << employee }
    startup.close
  end

end
