# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
# https://leetcode.com/problems/word-ladder/
def ladder_length(begin_word, end_word, word_list)
  end_word_present = false
  
  for word in word_list
      end_word_present = true if  word == end_word
  end
  
  return 0 if end_word_present == false
  
  length = Float::INFINITY
  
  for index in 0...word_list.length
      current_word = word_list[index]
      
      if single_letter_difference(current_word, begin_word)
           hash_list = { current_word => true }
           results = permutation([current_word], word_list, 0, hash_list)
           latest_end = results.length - 1
           last_match =  latest_end
          
           while latest_end >= 0
               if single_letter_difference(results[latest_end], end_word)
                   last_match = latest_end
               end
               latest_end -= 1
           end
           print last_match, "\t", results
          # include the last item, just incase the index is 0
          if single_letter_difference(word_list[last_match], end_word)
              count = last_match + 1
              if results[last_match] == end_word 
                  if results.first == begin_word
                      length = [count += 1, length].min
                  else
                      length = [count += 2, length].min
                  end
              else
                  if results.first == begin_word
                      # puts "here"
                      count += 1
                      length = [count, length].min
                  else
                      length = [count += 2, length].min
                  end
              end
          end

      end

  end
  length == Float::INFINITY ? 0 : length
end

def permutation(permutations, word_list, index, hash_list)
  return permutations if index >= word_list.length
  
  prev_word = permutations.last
  current_word = word_list[index]
  
  if single_letter_difference(prev_word, current_word) && hash_list[current_word].nil? 
      permutations << current_word
      hash_list[current_word] = true
  end
  
  permutation(permutations, word_list, index + 1, hash_list) 
end

def single_letter_difference(word_1, word_2)
  hash_1 = {}
  hash_2 = {}
  letter_difference = 0
  
  for index in 0...word_1.length
      letter = word_1[index]
      hash_1[letter] = true
  end
  
  for index in 0...word_2.length
      letter = word_2[index]
      hash_2[letter] = true
  end
  
  for key, value in hash_1
      if hash_2[key]
          hash_1.delete(key)
          hash_2.delete(key)
      end
  end
  
  return false if hash_1.length + hash_2.length > 2
  
  true
end

# "a"
# "c"
# ["a","b","c"]
# ["a", "c"]...returns 2
# "hit"
# "cog"
# ["hot","dot","dog","lot","log","cog"]
# "hit"
# "cog"
# ["hot","dot","dog","lot","log"]

# Weird test case 
# "leet"
# "code"
# ["lest","leet","lose","code","lode","robe","lost"]
# shouldn't it return 
# ["leet", "lest", "lose", "lode", "code"]...5



