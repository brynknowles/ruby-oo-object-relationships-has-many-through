class Customer
    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age 
        @@all << self
    end

    def self.all
        @@all
    end

    def meals
        Meal.all.find_all { |meal| meal.customer == self}
    end

    def waiters
        meals.collect { |meal| meal.waiter}
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end
end