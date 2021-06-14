require 'simplecov'
SimpleCov.start
require 'rspec'
require 'encryption'

RSpec.describe Encryption do
  it 'exists' do
    encrypted_message = Encryption.new("hello world", "02715", "040895")
    expect(encrypted_message).to be_a(Encryption)
  end

  it 'can transform a message into an array' do
    encrypted_message = Encryption.new("hello world", "02715", "040895")
    expect(encrypted_message.split_message).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"])
  end

  it 'can make an encryption key' do
    encrypted_message = Encryption.new("hello world", "02715", "040895")
    expect(encrypted_message.encryption_key).to eq([2, 27, 71, 15])
  end

  it 'can make an offset' do
    encrypted_message = Encryption.new("hello world", "02715", "040895")
    expect(encrypted_message.offset).to eq([1, 0, 2, 5])
  end

  it 'can can combine offset and encryption key into a final shift' do
    encrypted_message = Encryption.new("hello world", "02715", "040895")
    expect(encrypted_message.final_shift).to eq([3, 27, 73, 20])
  end

  it 'can encrypt a character' do
    encrypted_message = Encryption.new("hello world", "02715", "040895")
    expect(encrypted_message.encrypt_character("h", 54)).to eq("h")
  end

  it 'can encrypt a message' do
    encrypted_message = Encryption.new("hello world", "02715", "040895")
    expect(encrypted_message.encrypt_message).to eq("keder ohulw")
  end

  it 'can pass through special characters' do
    encrypted_message = Encryption.new("hello world!", "02715", "040895")
    expect(encrypted_message.encrypt_message).to eq("keder ohulw!")
  end

  it 'can accept capitalization' do
    encrypted_message = Encryption.new("HELLO WORLD", "02715", "040895")
    expect(encrypted_message.encrypt_message).to eq("keder ohulw")
  end
end