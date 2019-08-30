class Waiter
    @@all = []
    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def new_meal (customer, total, tip)
        Meal.new(self,customer,total,tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self } 
    end

    def best_tipper
        meals.max_by{ |max| max.tip}.customer
    end

    def self.all 
        @@all
    end
end