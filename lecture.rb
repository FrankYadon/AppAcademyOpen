puts "Enter 'yes' or 'no'"

response = gets.chomp

if response == "yes"
  puts "yup!"
elsif response == "no"
  puts "nah!"
else
  puts "I'm sorry, my responses are limited."
end