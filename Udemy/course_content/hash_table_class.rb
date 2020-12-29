class HashTable
  attr_reader :key_map
  def initialize(size = 4)
    @key_map = Array.new(size)
  end

  # Similar to the hash function
  def hash(key)
    total = 0
    prime_number = 31

    min_length = [key.length - 1, 100].min
    (0..min_length).each do |index|
      position = key[index].ord - 96
      total = (total * prime_number + position) % @key_map.length
    end
    total
  end

  def set(key, value)
    # Allows you to insert many things with the same key
    # normally, it should overrite the value if you insert the same key
    index = hash(key)
    if @key_map[index].nil?
      @key_map[index] = []
    end
    @key_map[index] << [key,value]
  end

  def get(key)
    index = hash(key)

   unless @key_map[index].nil?
      @key_map[index].map do |list|
        if list[0] == key
          return list[1]
        end
      end
   end
    nil
  end

  def keys
    # Does not return duplicate keys.

    keys_list = []

    @key_map.map do |nested_list|
      if !nested_list.nil?
        nested_list.map do |list|
          if !keys_list.include? list[0]
            keys_list << list[0]
          end
        end
      end
    end
    keys_list
  end

  def values
    # Does not return duplicate values.
    values_list = []

    @key_map.map do |nested_list|
      if !nested_list.nil?
        nested_list.map do |list|
          if !values_list.include? list[1]
            values_list << list[1]
          end
        end
      end
    end
    values_list
  end
end

ht = HashTable.new
p ht.set("hello world4", "Goodbye2")
p ht.set("hello world2", "Goodbye2")
p ht.set("hello world3", "Goodbye2")
p ht.set("hello world4", "Goodbye4")

# Big O of Hashtables (Average case)
# Insert: O(1)
# Deletion: O(1)
# Access: O(1)