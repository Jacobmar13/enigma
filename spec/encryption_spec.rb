require 'simplecov'
SimpleCov.start
require 'rspec'
require 'encryption'

RSpec.describe Encryption do
  it 'exists' do
    encrypted_message = Encryption.new(message, key, date)
    expect(encrypted_message).to be_a(Encryption)
  end
end