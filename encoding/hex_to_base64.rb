#!/usr/bin/env ruby
require 'base64'

if ARGV.empty?
	puts 'No argument supplied.'; exit 1
else
	arg = ARGV[0]
end

puts 'Beginning conversion...'

begin
	hex_str_encoded = arg
	# Array#pack 'packs' the contents of hex_str_encoded into a binary sequence according the directives in the method's argument
	# The 'H' argument is a String Directive which works on 'String' Array elements and means 'hex string (high nibble first)'
	# The asterisk ('*') means that remaining array elements will be converted (not just the first)
	# Documentation available at: https://ruby-doc.org/core-2.5.1/Array.html#method-i-pack
  hex_str_unencoded = [hex_str_encoded].pack('H*')
	hex_str_as_bytes  = hex_str_unencoded.bytes

	# The 'c' argument is an Integer Directive which works on 'Integer' Array elements and means '8-bit signed (signed char)'
	base64_str_unencoded = hex_str_as_bytes.pack('c*')
	# Use Base64#strict_encode64 to remove line feeds ('\n')
	base64_str_encoded = Base64.strict_encode64(base64_str_unencoded)

	puts "All done. Your base64 encoded string is: \n#{base64_str_encoded}"
rescue Exception => e
	puts "\nSomething went wrong.\nError: #{e}\nExiting."
	exit 1
end

