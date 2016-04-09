require './contacts_file'

def index( contacts )
  contacts.each_with_index do |contact, index|
    puts "#{index + 1}) #{contact[:name]}"
  end
end

def show( contact )
  puts "\n#{contact[:name]}"
  puts "phone: #{contact[:phone]}"
  puts "email: #{contact[:email]}"
end

def ask( prompt )
  print prompt
  gets.chomp
end

def create_new
  contact = {}

  puts "\nEnter contact info:"

  contact[:name] = ask "Name? "
  contact[:phone] = ask "Phone? "
  contact[:email] = ask "Email? "

  contact
end

def action_new( contacts )
  contact = create_new

  contacts << contact

  write_contacts( contacts )

  puts "\nNew contact created:\n"

  show( contact )
end

def action_show( contacts, i )
  contact = contacts[i-1]

  puts
  show( contact )
  puts
end

def action_delete( contacts )
  puts
  response = ask "Delete which contact? "

  i = response.to_i

  puts "\nContact for #{contacts[i-1][:name]} deleted."

  contacts.delete_at( i-1 )

  write_contacts( contacts )

  puts
end

def action_error
  puts "\nSorry, I don't recognize that command.\n"
end
def action_print
  pattern = "Thomas"
  contacts.each do |contact|
    contact.select { |k, v| v == /\b{pattern}/i }
  end
end
def action_search( contacts )
  puts
  pattern = ask "Search for? "
  puts

  contacts.each do |contact|
    if contact[:name] =~ /\b{pattern}/i
      show( contact )
    end
  end
end

# =>
loop do
  contacts = read_contacts

  index( contacts )

  puts
  response = ask( "Who would you like to see (s to search, n for new, d to delete, q to quit)? ")

  break if response == "q"

  if response == "n"
    action_new( contacts )
  elsif response == "d"
    action_delete( contacts )
  elsif response == "s"
    action_search( contacts )
  elsif response =="p"
    action_print( contacts )
  elsif response =~ /[0-9]+/
    action_show( contacts, response.to_i)
  else
    action_error
  end
end
