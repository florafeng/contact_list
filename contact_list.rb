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
      case @command
      when "new" then create_new_contact
      when "list"
      when "show"
      when "search"
      end
    end
  end
end

ContactList.new.start