def binary_search(numbers, item)
    low = 0
    high = numbers.length - 1

    while low <= high
        mid = (low + high) / 2
        if numbers[mid] == item
            return mid
        elsif numbers[mid] > item
            high = mid - 1
        elsif numbers[mid] < item
            low = mid + 1
        end
    end
    
    return nil
end

my_list = [1, 3, 5, 7, 9]

p binary_search(my_list, 3)
p binary_search(my_list, -1)