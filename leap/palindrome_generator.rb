
def solution(n, k)
  # write your code in Ruby 2.2
  alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  string = []
  letters = alphabet[0...k] # Get unique characters to use
  char = 0
  start = 0
  stop = n - 1

  while start <= stop
    string[start] = letters[char]
    string[stop] = letters[char]

    char += 1
    char = 0 if char > letters.length - 1
    start += 1
    stop -= 1
  end
  string.join("")
end

p solution(5, 2) #"ababa"
p solution(8, 3)#"abcaacba"
p solution(3, 2) #"aba"