
# Setting up the array and hash
@new_contact = {}
@contacts = [] 

# The methods for the menu
def add_contact
  puts "What is the name of your contact?"
  input_name = gets.strip
  puts "What is your contacts number?"
  input_number = gets.strip
  puts "What is their address?"
  input_address = gets.strip
  @new_contact = {name: input_name, number: input_number, address: input_address}
  @contacts.push(@new_contact)
  menu
end

def edit_contact
  view_contacts
  puts "Please select the number of the contact you'd like to edit"
  choice = gets.to_i
  if choice > 0 && choice <= @contacts.length

    puts "Enter a new name for this person, or press enter to not change it"
    input_name = gets.strip
    if input_name.nil? or input_name.empty?
      input_name = @contacts[choice-1][:name]
    else
    end

    puts "Enter a new number for this person, or press enter to not change it"
    input_number = gets.strip
    if input_number.nil? or input_number.empty?
      input_number = @contacts[choice-1][:number]
    else
    end

    puts "Enter a new address for this person, or press enter to not change it"
    input_address = gets.strip
    if input_address.nil? or input_address.empty?
      input_address = @contacts[choice-1][:address]
    else
    end

    @contacts[choice - 1][:name] = input_name 
    @contacts[choice - 1][:number] = input_number
    @contacts[choice - 1][:address] = input_address
  else 
    puts "Nope"
    edit_contact
  end
  menu
end

def delete_contact
  view_contacts
  puts "Please select the number of the contact you'd like to delete"
  choice = gets.to_i
  if choice > 0 && choice <= @contacts.length
    @contacts.delete_at(choice - 1)
  else 
    puts "Nope"
    delete_contact
  end
  menu
end

def view_contacts
  puts "----------------------------------------"
  
  @contacts.each_with_index do |contact, index|
    puts "#{index + 1}. Name: #{contact[:name]}"
    puts "   Number: #{contact[:number]}"
    puts "   Address: #{contact[:address]}"
  end

  puts "----------------------------------------"
end

# Menu
def menu
  puts "----------------------------------------"
  puts "Welcome to your Contact List"
  puts "What would you like to do?"

  menu_items = ["1. Add Contact", "2. Edit Contact", "3. Delete Contact", "4. View Contacts", "5. Quit"]

  puts menu_items
  decision = gets.strip.to_i
  menu_options(decision)
end

# The sauce
def menu_options(decision)
  case decision
    when 1
    add_contact
    when 2
    edit_contact
    when 3
    delete_contact
    when 4
    view_contacts
    menu
    when 5
    puts "Goodbye dad"
    exit
    else
    puts "Sorry, try again"
    menu
  end
end

# The menu call
menu