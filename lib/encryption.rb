require 'character_set'

class Encryption

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @char_set = CharacterSet.new
  end

  def split_message
    @message.split("")
  end

  def encryption_key
    split_key = @key.split("")
    a = split_key[0] + split_key[1]
    b = split_key[1] + split_key[2]
    c = split_key[2] + split_key[3]
    d = split_key[3] + split_key[4]
    [a,b,c,d].map(&:to_i)
  end
  
  def offset
    (@date.to_i**2).to_s.split("").pop(4).map(&:to_i)
  end

  def final_shift
    a = encryption_key[0] + offset[0]
    b = encryption_key[1] + offset[1]
    c = encryption_key[2] + offset[2]
    d = encryption_key[3] + offset[3]
    [a,b,c,d]
  end

  def encrypt_character(character, shift)
    char_index = @char_set.set.index(character)
    new_index = char_index + shift
    @char_set.set[new_index]
  end

  def encrypt_message
    split_message.map do |character|
      if split_message.index(character) == 0
        encrypt_character(character, final_shift[0])
      elsif split_message.index(character) == 1
        encrypt_character(character, final_shift[1])
      elsif split_message.index(character) == 2
        encrypt_character(character, final_shift[2])
      elsif split_message.index(character) == 3
        encrypt_character(character, final_shift[3])
      end
  end
end