require 'simplecov'
SimpleCov.start
require 'rspec'
require 'decryption'

RSpec.describe Decryption do
  it 'exists' do
    decrypted_message = Decryption.new("keder ohulw", "02715", "040895")
    expect(decrypted_message).to be_a(Decryption)
  end

  it 'can transform a message into an array' do
    decrypted_message = Decryption.new("keder ohulw", "02715", "040895")
    expect(decrypted_message.split_message).to eq(["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"])
  end

  it 'can make a decryption key' do
    decrypted_message = Decryption.new("keder ohulw", "02715", "040895")
    expect(decrypted_message.decryption_key).to eq([2, 27, 71, 15])
  end

  it 'can make an offset' do
    decrypted_message = Decryption.new("keder ohulw", "02715", "040895")
    expect(decrypted_message.offset).to eq([1, 0, 2, 5])
  end

  it 'can can combine offset and decryption key into a final shift' do
    decrypted_message = Decryption.new("keder ohulw", "02715", "040895")
    expect(decrypted_message.final_shift).to eq([3, 27, 73, 20])
  end

  it 'can decrypt a character' do
    decrypted_message = Decryption.new("keder ohulw", "02715", "040895")
    expect(decrypted_message.decrypt_character("k", 3)).to eq("h")
  end

  it 'can decrypt a message' do
    decrypted_message = Decryption.new("keder ohulw", "02715", "040895")
    expect(decrypted_message.decrypt_message).to eq("hello world")
  end

  it 'can pass through special characters' do
    decrypted_message = Decryption.new("keder ohulw!", "02715", "040895")
    expect(decrypted_message.decrypt_message).to eq("hello world!")
  end
end