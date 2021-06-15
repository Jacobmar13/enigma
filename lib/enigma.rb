require_relative 'key_generator'
require_relative 'encryption'
require_relative 'decryption'

class Enigma
  attr_reader :default_key, :default_date

  def initialize
    @default_key = KeyGenerator.new.key
    @default_date = Time.now.strftime("%d%m%y")
  end

  def encrypt(message, key = @default_key, date = @default_date)
    encryption = {}
    encryption[:encryption] = Encryption.new(message, key, date).encrypt_message
    encryption[:key] = key
    encryption[:date] = date
    encryption
  end

  def decrypt(message, key, date)
    decryption = {}
    decryption[:decryption] = Decryption.new(message, key, date).decrypt_message
    decryption[:key] = key
    decryption[:date] = date
    decryption
  end
end
