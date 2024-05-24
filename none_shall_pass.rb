EMAIL = "eacardenase"
PASSWORD = "12345"
PASSWORD_VAULT = {
  github: {
    username: "eacardenase",
    password: "32145"
  }
}

puts "Welcome to None Shall Pass - Password Manager"
puts "Please sign in to continue"
print "Enter email: "

user_email = gets.chomp

unless user_email == EMAIL
  puts "Invalid email."

  exit
end

print "Enter password: "
user_password = gets.chomp

unless user_password == PASSWORD
  puts "Invalid password."

  exit
end

puts "Hello #{user_email}"
puts "What would you like to do?"
puts "1. Add new service credentials"
puts "2. Retrieve an existing services credential"
puts "3. Exit"

user_selection = gets.chomp

case user_selection
when "1"
  print "Enter the name of the service: "
  new_service_name = gets.chomp
  PASSWORD_VAULT[new_service_name] = {}

  print "Please enter the username for this new service: "
  new_service_username = gets.chomp
  PASSWORD_VAULT[new_service_name]["username"] = new_service_username

  print "Please enter the password for this new service: "
  new_service_password = gets.chomp
  PASSWORD_VAULT[new_service_name]["password"] = new_service_password
when "2"
  print "Please enter the name of the service you wish to access credentials for: "
  requested_service_name = gets.chomp
  credentials = PASSWORD_VAULT[requested_service_name.to_sym]

  unless credentials then
    puts "Credentials for the service name provided where not found. Exiting the program."

    exit
  end

  puts "Here are the credentials for #{requested_service_name}:"

  credentials.each { |key, value| puts "#{key.capitalize}: #{value}" }
else
  puts "Exiting the program. Goodbye."

  exit
end
