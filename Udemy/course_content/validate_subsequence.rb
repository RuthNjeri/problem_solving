require 'pry'

# Using for Loop

# def validate_subsequence(array, sequence)
#     current_index = 0

#     if sequence.empty?
#         return false
#     end

#     for num in array
#         if num == sequence[current_index]
#                 current_index += 1
#         end
#         if current_index == sequence.length
#             return true
#         end
# 	end
# 	false
# end

# Alternative

# def validate_subsequence(array, sequence)
#     current_index = 0

#     if sequence.empty?
#         return false
#     end

#     for num in array
#         if num == sequence[current_index]
#                 current_index += 1
#         end
#         if current_index == sequence.length
#             break
#         end
# 	end
# 	current_index == sequence.length
# end

# p validate_subsequence([5, 1, 22, 25, 6, -1, 8, 10], [1, 6, 10, 10])

# Using While Loop

def validate_subsequence(array, subsequence)
    array_index = 0
    sub_index = 0
    while array_index < array.length && sub_index < subsequence.length
        if subsequence[sub_index] == array[array_index]
            sub_index += 1
        end
        array_index += 1
    end
    sub_index == subsequence.length
end

p validate_subsequence([5, 1, 22, 25, 6, -1, 8, 10], [1, 6, -1, 10])