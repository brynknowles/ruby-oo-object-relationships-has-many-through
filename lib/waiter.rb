require 'pry'

class Waiter
    attr_accessor :name, :age

    @@all = []

    def initialize(name, years)
        @name = name
        @years = years 
        @@all << self
    end

    def self.all
        @@all
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self}
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def best_tipper
        # self.meals.max_by { |meal| meal.tip}.customer
        best_tip = meals.max_by { |meal| meal.tip}
        best_tip.customer
    end

end