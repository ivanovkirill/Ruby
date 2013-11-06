class Sort
  attr_accessor :array
  
  def initialize(array=[])
    @array=array
  end
    
  def bubleSort
    array_size=@array.length
    for i in 0...array_size do
      for j in 0...(array_size-i-1) do
        if @array[j] > @array[j+1]
           @array[j], @array[j+1] = @array[j+1], @array[j]
         end
      end
    end
    @array
  end
end

def is_int?(obj) 
   obj = obj.to_i.to_s
end
 
def random_array(array)
  p "Enter size: "
  random=gets.chomp
  is_int?(random)
  while is_int?(random) != random.to_s do
    p "Wrong input"
    p "  U R IDIOT I CAN'T WORK WITH U !!!!!!"
    exit
  end
  p "Enter random range from:"
  leftRange=gets.chomp
  p "to:"
  rightRange=gets.chomp
   
  random=random.to_i
  leftRange=leftRange.to_i
  rightRange=rightRange.to_i
   
  random.times do
  array<< rand(leftRange..rightRange)
    end
  array
end

p "RandomArray"
array = []
array = random_array(array)
buble=Sort.new(array)
buble.bubleSort
p buble.array
p "Right?"