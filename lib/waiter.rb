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
   

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
          meal.waiter == self 
        end
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
       
        best_tipped_meal.customer
      end

      def most_frequent_customer
        customer_hash = meals.reduce({}) do |memo, meal|
            memo[meal.customer] ||= 0
            memo[meal.customer] += 1
            memo
        end
        customer_hash.max do |customer1, customer2|
            customer1 <=> customer2
        end
    end

  end