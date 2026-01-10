def bubble_sort(array)
  # Iterate thru the input arr
  # For each iteration, iterate all elements O(N^2)
  puts "Array before sort #{array}"

  # Make N-1 Passes
  (1...array.length).each do |i|
    # Stop on the 2nd last element so we can compare j and j + 1
    (0...array.length-1).each do |j|
      if array[j] > array[j+1]
        array[j], array[j+1] = array[j+1], array[j]
      end
    end
  end
  puts "Array after sort #{array}"
  array
end

p bubble_sort([4,3,78,2,0,2])