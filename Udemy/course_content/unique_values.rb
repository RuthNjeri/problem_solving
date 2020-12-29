require 'pry'

def count_unique_values(sorted_array)
    unique = 0
    left = 0
    right = 1

    while left < sorted_array.length
        if sorted_array[left] != sorted_array[right]
            unique += 1
        end
        left += 1
        right += 1
    end
    unique
end

binding.pry

p count_unique_values([-2,-1,-1,0,1,])

# you can use the array while replacing the right value with the unique values
