class Waiter

    attr_accessor :name, :yrs_exp
    @@all = []

    def initialize(name, yrs_exp)
        @name = name
        @yrs_exp = yrs_exp
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        hightest_tip = 0
        meals.select do |meal|
            if meal.tip > hightest_tip
                hightest_tip = meal.tip
            end
        end

        highest_tip_meal = meals.find {|meal| meal.tip == hightest_tip}
        highest_tip_meal.customer
    end

    def self.all
        @@all
    end

end