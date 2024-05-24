EMAIL = "eacardenase"
PASSWORD = "12345"
PASSWORD_VAULT = {
  github: {
    username: "eacardenase",
    password: "32145"
  }
}

def welcome_message
  puts "Welcome to None Shall Pass - Password Manager"
end

def prompt_user_for_email
  puts "Please sign in to continue"
  print "Enter email: "

  gets.chomp
end

def verify_user_email(user_email)
  unless user_email == EMAIL
    puts "Invalid email."

    exit
  end
end

def prompt_user_for_password
  print "Enter password: "

  gets.chomp
end

def verify_user_password(user_password)
  unless user_password == PASSWORD
    puts "Invalid password."

    exit
  end
end

def greet_user(user_email)
  puts "Hello, #{user_email}!"
  puts "What would you like to do?"
end

def menu_options
  puts "1. Add new service credentials"
  puts "2. Retrieve an existing services credential"
  puts "3. Exit"
end

def get_user_menu_selection
  print "Enter selection: "
  gets.chomp
end

def set_new_service_name
  print "Enter the name of the service: "
  new_service_name = gets.chomp
  PASSWORD_VAULT[new_service_name.to_sym] = {}

  new_service_name
end

def set_username_for(service_name)
  print "Please enter the username for this new service: "
  PASSWORD_VAULT[service_name.to_sym][:username] = gets.chomp
end

def set_password_for(service_name)
  print "Please enter the password for this new service: "
  PASSWORD_VAULT[service_name.to_sym][:password] = gets.chomp
end

def retrieve_service_name
  print "Please enter the name of the service you wish to access credentials for: "
  gets.chomp
end

def retrieve_service_credentials_for(service_name)
  PASSWORD_VAULT[service_name.to_sym]
end

def display_service_credentials_for(service_name, credentials)
  puts "Here are the credentials for #{service_name}:"

  credentials.each { |key, value| puts "#{key.capitalize}: #{value}" }
end

def exit_program
  puts "Exiting the program. Goodbye."

  exit
end

def handle_user_selection(user_selection)
  case user_selection
  when "1"
    new_service_name = set_new_service_name

    set_username_for(new_service_name)
    set_password_for(new_service_name)

    credentials = retrieve_service_credentials_for(new_service_name)

    display_service_credentials_for(new_service_name, credentials)
  when "2"
    requested_service_name = retrieve_service_name
    credentials = retrieve_service_credentials_for(requested_service_name)

    unless credentials
      puts "Credentials for the service name provided where not found. Exiting the program."

      exit
    end

    display_service_credentials_for(requested_service_name, credentials)
  else
    exit_program
  end
end

welcome_message

user_email = prompt_user_for_email
verify_user_email(user_email)

user_password = prompt_user_for_password
verify_user_password(user_password)

greet_user(user_email)

menu_options
user_selection = get_user_menu_selection
handle_user_selection(user_selection)