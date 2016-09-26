def add(string)
  return 0 if string.empty?
  numbers = numbers_for(string)
  negative_numbers = negatives(numbers)
  raise "Negatives not allowed: #{ negative_numbers.join(', ') }" if negative_numbers.any?
  ignore_big_numbers(numbers).reduce(:+) unless negatives(numbers).any?
end

def has_delimiter?(string)
  string.split("//").count > 1
end

def delimiter_for(string)
  if has_delimiter?(string)
    string.split("//")[1].split("\n")[0]
  else
    /[^a-zA-Z\d\-\+]/
  end
end

def numbers_for(string)
  delimiter = delimiter_for(string)
  string = string.split("\n", 2)[1] if has_delimiter?(string)
  string.split(delimiter).map(&:to_i)
end

def negatives(numbers)
  numbers.select{|num| num < 0}
end

def ignore_big_numbers(numbers)
  numbers.select{ |num| num <= 1000 }
end
