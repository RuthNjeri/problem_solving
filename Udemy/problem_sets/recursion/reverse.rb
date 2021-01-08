# Reverse function that accepts a string and returns a new string in reverse


def reverse(string)
  return string if string.length <= 1

  reverse(string.slice(1, string.length)) + string[0]
end

p reverse("awesome")
p reverse("rithmschool")