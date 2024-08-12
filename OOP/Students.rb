class Student

attr_accessor :name

    def initialize(name,grade)
        @name = name
        @grade = grade
    end

    def better_grade?(other_grade)
        puts @grade > other_grade
    end
        
private
    def grade
    
    end
end

sue = Student.new("Sue",6)
mark = Student.new("Mark",7)
puts mark
puts mark.better_grade?(6)