class Animal
    def speak
      "Hello!"
    end
    def initialize(name)
        @name = name
    end
  end
  
  class GoodDog < Animal
    def initialize (age,name)
        super(name)
        @age = age
    end
  end
  sparky = GoodDog.new(5,"Sparky")
  p sparky

