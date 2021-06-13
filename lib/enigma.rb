require 'key_generator'

class Enigma

  def initialize
    @default_key = KeyGenerator.new.key
  end

  def encrypt(message, key = @default_key, date = Time.now.strftime("%d%m%y"))
    encryption = Hash.new
    encryption[:encryption] = message
    encryption[:key] = key
    encryption[:date] = date
    encryption
  end
end