require_relative 'lib/enigma'

message_to_decrypt = File.open(ARGV[0], "r")

stored_message = message_to_decrypt.read

message_to_decrypt.close

cypher = Enigma.new

decrypted_message = cypher.decrypt(stored_message, ARGV[2], ARGV[3])

decrypted_file = File.open(ARGV[1], "w")

decrypted_file.write(decrypted_message[:decryption])

decrypted_file.close

puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"