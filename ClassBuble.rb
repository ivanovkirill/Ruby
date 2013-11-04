class Sort
  attr_accessor :array
  
  def initialize(array=[])
    @array=array
  end
  def bubleSort
    arraySize=@array.length
    for i in 0...arraySize do
      for j in 0...(arraySize-i-1) do
        if @array[j] > @array[j+1]
           @array[j], @array[j+1] = @array[j+1], @array[j]
         end
      end
    end
    @array
  end
 end
 def randomArray(array)
   p "Enter size: "
   array4randomArray=gets.chomp
   p "Enter random range from:"
   leftRange=gets.chomp
   p "to:"
   rightRange=gets.chomp
   
   array4randomArray=array4randomArray.to_i
   leftRange=leftRange.to_i
   rightRange=rightRange.to_i
   
     array4randomArray.times do
     array.<< rand(leftRange..rightRange)
     end
   array
end
p "RandomArray"
array = []
array = randomArray(array)
buble=Sort.new(array)
buble.bubleSort
p buble.array
p "Right?"