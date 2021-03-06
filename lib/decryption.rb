require_relative 'character_set'

class Decryption
  
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @char_set = CharacterSet.new
  end

  def split_message
    @message.downcase.split("")
  end

  def decryption_key
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
    a = decryption_key[0] + offset[0]
    b = decryption_key[1] + offset[1]
    c = decryption_key[2] + offset[2]
    d = decryption_key[3] + offset[3]
    [a,b,c,d]
  end

  def decrypt_character(character, shift)
    char_index = @char_set.set.index(character)
    if (char_index - (shift % 27)) >= 0
      new_index = (char_index - (shift % 27))
    elsif (char_index - (shift % 27)) < 0
      new_index = (char_index - (shift % 27)) + 27
    end
    @char_set.set[new_index]
  end

  def decrypt_message
    final_encryption = split_message.map.with_index do |character, index|
      if @char_set.set.include?(character)
        if index % 4 == 0
          decrypt_character(character, final_shift[0])
        elsif index % 4 == 1
          decrypt_character(character, final_shift[1])
        elsif index % 4 == 2
          decrypt_character(character, final_shift[2])
        elsif index % 4 == 3
          decrypt_character(character, final_shift[3])
        end
      else
        character
      end
    end
    final_encryption.join
  end
end