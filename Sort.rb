class Hash_car
  attr_accessor :hash
  
  def initialize(array)
    @hash = array
  end
  
  def method_missing(method_name)
    method_name_str=method_name.to_s
    key_string=method_name_str[8..-1]

    is_a_good_key = lambda do
      @hash[0].each_key do |key|
        if key.to_s==key_string 
          return true
        end
      end
      return false
    end
    
    if is_a_good_key.call
      @hash = @hash.sort_by { |hash| hash[key_string.to_s] }
      puts @hash
    else
      puts "I'm sorry, can't fine #{method_name}"
    end
  end
end
  
  def is_int?(obj)
    obj = obj.to_i.to_s
  end
  
  def integer_input
    
    input = gets.chomp
    is_int?(input)
    while is_int?(input) != input.to_s do 
      p "It is not integer, try again"
      input = gets.chomp
      if input == input.to_s.to_i
	break
      end
    end
  end

  
  def add_hash_elem(array)
  hash_name = "hash_#{array.length+1}"
  hash_name = Hash.new
  p "Enter the name of car: "
  hash_name[:title] = gets.chomp
  puts "Enter the hp of this car: "  
  hash_name[:hp] = integer_input
  puts "Enter the gorund clearance of this car"
  hash_name[:clearance] = integer_input
  print "Enter the maximal speed: " 
  hash_name[:maxspeed] = integer_input
  array << hash_name
  array
  end
    
  def smth
  #smth
  end
  
array = []
while true do
  puts "1. Add new elemnt to hash"
  puts "2. Sort array"
  puts "3"
  puts "4"
  choice = gets.chomp
  case choice
  when "1"
    add_hash_elem(array)
    puts array
  when "2"
    cars = Hash_car.new(array)
    p "Enter sort_method"
    key_to_sort = gets.chomp
    cars.send("sort_by_"+key_to_sort)
    array = cars.hash
  when "3"
   end
end
                                    
  