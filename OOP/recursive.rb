def sumrange (n,total = 0)
    if n < 0
        puts total
        return 
    end
sumrange(n-1, total+n)
end

#sumrange(42,0)

#recursive method that prints all the values for specific key within the hash

tree = {
name: "John",
children:[
    {
        name: "Jim",
        children: []
    },
    {
        name: "Zoe",
        children:[
            {name: "Kyle", children: []},
            {name: "Sophia",children: []}
            ]
        }
    ]
}


def treerec (tree)
    if tree[:children].length === 0
        return
    end
tree[:children].each do |child|
p child[:name]
treerec(child)
    end
end

#treerec(tree)

#Define a recursive function that finds the factorial of a number.

def fact(n,total=n)
    if n == 1
        puts "Total is #{total}"
        return 
    end
fact(n-1, total*=(n-1))
end

#fact(4)


def factorial(n)
    if n == 0
      1
    else
      n * factorial(n-1)
    end
  end

  #p factorial(0)



 # Define a recursive function that returns true if a string is a palindrome and false otherwise.

def palindrome? (phrase)
    phrase.reverse == phrase
end

# p palindrome?("lol")

def palindrome1(string)
    if string.length == 1 || string.length == 0
      true
    else
      if string[0] == string[-1]
        palindrome1(string[1..-2])
      else
        false
      end
    end
  end

  # p palindrome1("abdcdba")


  #Define a recursive function that takes an argument n and prints 
  #"n bottles of beer on the wall", "(n-1) bottles of beer on the wall", ..., "no more bottles of beer on the wall".

  def beer_counter(n)
    if n==0
      puts "no more bottles of beer on the wall"
      return
    else 
      puts "#{n} bottles of beer on the wall"
    end
    beer_counter(n-1)
  end

  # beer_counter(3)

  #Define a recursive function that takes an argument n and returns the fibonacci value of that position. 
  #The fibonacci sequence is 0, 1, 1, 2, 3, 5, 8, 13, 21... So fib(5) should return 5 and fib(6) should return 8.

  def fib(n)
    if n==0
      0
    elsif n==1
      1
    else
    fib(n-1)+fib(n-2)
    end
  end

  # p fib(3)

#Use the roman_mapping hash to define a recursive method that converts an integer to a Roman numeral.

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}



def arabic_to_roman (num, roman_mapping,roman_num = [])
  if num==0
    p roman_num.join
    return 
  end

  roman_mapping.each do |key,value|
      if num-key==0 || num-key>0
        roman_num << value
        arabic_to_roman(num -= key,roman_mapping,roman_num)
        break
      end
    end
end

arabic_to_roman(11,roman_mapping)

