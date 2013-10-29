mas = [13,12,43,42,521,65,234,54254,1,54,652,213,232,5,65,123,652,673,7643,3,6523]
masSize = mas.length
for i in 0...masSize do
  for j in 0...(masSize-i-1) do
    if mas[j] > mas[j+1]
      buf=mas[j]
      mas[j]=mas[j+1]
      mas[j+1]=buf
    end
  end
end
puts mas