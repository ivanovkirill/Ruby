class BubleSort
  attr_accessor :mas
  
  def initialize(mas=[])
    @mas=mas
  end
  def bubleSort
    masSize=@mas.length
    for i in 0...masSize do
      for j in 0...(masSize-i-1) do
        if @mas[j] > @mas[j+1]
          buf=@mas[j]
          @mas[j]=@mas[j+1]
          @mas[j+1]=buf
        end
      end
    end
    @mas
  end
 end
 def randomMas(mas)
   p "Enter size: "
   masSize2RM=gets.chomp
   p "Enter random range from:"
   leftRange=gets.chomp
   p "to:"
   rightRange=gets.chomp
   
   masSize2RM=masSize2RM.to_i
   leftRange=leftRange.to_i
   rightRange=rightRange.to_i
   
   masSize2RM.times do
     mas.push rand(leftRange..rightRange)
   end
   mas
 end
mas = []
mas = randomMas(mas)
buble=BubleSort.new(mas)
buble.bubleSort
p buble.mas
p "Right?" 
