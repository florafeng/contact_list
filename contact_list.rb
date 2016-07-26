require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.

  def start
    if ARGV.empty?
      puts "Here is a list of available commands:"
      puts "\tnew - Create a new contact"
      puts "\tlist - List all contacts"
      puts "\tshow - Show a contact"
      puts "\tfind - Find a contact"
    else
      case ARGV.first
      when "new" then create_new_contact
      when "list" then Contact.all
      when "show" then show_contact
      when "search" then search_contact
      end
    end
  end

  def create_new_contact
    puts "What's your contact name?"
    name = STDIN.gets.chomp.to_s
    puts "What's your contact email?"
    email = STDIN.gets.chomp.to_s
    Contact.create(name, email)
  end

  def show_contact
    contact = Contact.find(ARGV[1])
    if contact.empty?
      puts "Ops!!!!! Contact not found"
    else
      puts "Id: #{contact[0].id}"
      puts "Name: #{contact[0].name}"
      puts "Email: #{contact[0].email}"
    end
  end

  def search_contact
    contact = Contact.search(ARGV[1].to_s)
    if contact.empty?
      puts "Ops!!!!! Contact not found"
    else
      contact.each{ |contact|
        puts "Id: #{contact.id}"
        puts "Name: #{contact.name}"
        puts "Email: #{contact.email}"
      }
    end
  end


end

ContactList.new.start