require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(string)
    @salaries.has_key?(string)
  end

  def >(other_startup)
    @funding > other_startup.funding
  end

  def hire(name, title)
    if self.valid_title?(title)
      @employees << Employee.new(name, title)
    else
      raise "Invalid Title"
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    paycheck = @salaries[employee.title]
    if @funding > paycheck
      employee.pay(paycheck)
      @funding -= paycheck
    else
      raise "Not enough funding"
    end
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee) }
  end

  def average_salary
    @employees.map { |emp| @salaries[emp.title] }.sum / self.size
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other_startup)
    @funding += other_startup.funding
    @salaries = other_startup.salaries.merge(@salaries)
    @employees += other_startup.employees
    other_startup.close
  end
end
