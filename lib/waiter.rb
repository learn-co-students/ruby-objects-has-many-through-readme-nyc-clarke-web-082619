class Waiter
    attr_accessor :name, :yrs_experience
 
    @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def self.all
      @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end
   
    def customers
        meals.map do |meal|
            meal.waiter == self
        end
    end
        
    def best_tipper
        sorted_meals = meals.sort_by{|meal| meal.tip}
        sorted_meals.last.customer
    end
end