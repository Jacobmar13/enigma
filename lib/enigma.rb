require 'key_generator'
require 'encryption'

class Enigma

  def initialize
    @default_key = KeyGenerator.new.key
  end

  def encrypt(message, key = @default_key, date = Time.now.strftime("%d%m%y"))
    encryption = {}
    encryption[:encryption] = Encryption.new(message, key, date).encrypt_message
    encryption[:key] = key
    encryption[:date] = date
    encryption
  end

  def decrypt(message, key, date)
    Decryption.new(message, key, date).decrypt_message
  end
end
