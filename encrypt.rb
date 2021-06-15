require_relative 'lib/enigma'

message_to_encrypt = File.open(ARGV[0], "r")

stored_message = message_to_encrypt.read

message_to_encrypt.close

cypher = Enigma.new

encrypted_message = cypher.encrypt(stored_message)

encrypted_file = File.open(ARGV[1], "w")

encrypted_file.write(encrypted_message[:encryption])

encrypted_file.close

puts "Created '#{ARGV[1]}' with the key #{cypher.default_key} and date #{cypher.default_date}"