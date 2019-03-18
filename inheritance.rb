class Employee
    attr_reader :salary, :name
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss 
    end 
    def bonus(multiplier)
        @bonus = @salary * multiplier
    end

end 

class Manager < Employee 

    def initialize(name, title, salary, boss, employees)
        @employees = employees
        super(name, title, salary, boss)
    end
    def bonus(multiplier)
        sum = 0
        @employees.each do |employee|
            sum += employee.salary
        end
        sum*multiplier
    end

end 