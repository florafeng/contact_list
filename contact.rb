require 'csv'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact

  attr_accessor :name, :email, :id

  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address
  def initialize(name, email, id)
    @name = name
    @email = email
    @id = id
  end

  # Provides functionality for managing contacts in the csv file.
  class << self

    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    def all
      contacts = []
      CSV.foreach('contacts.csv') do |row|
        contacts.push(Contact.new(row[1],row[2],row[0]))
      end
      contacts.each do |contact| 
        puts "#{contact.id}: #{contact.name} (#{contact.email})"
      end
    end

    # Creates a new contact, adding it to the csv file, returning the new contact.
    # @param name [String] the new contact's name
    # @param email [String] the contact's email
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      id = (CSV.open('contacts.csv', 'r').readlines.count) + 1
      CSV.open('contacts.csv', 'a') do |csv_object|
        csv_object.puts [id, name, email]
      end
    end
    
    # Find the Contact in the 'contacts.csv' file with the matching id.
    # @param id [Integer] the contact id
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      contact = []
      CSV.foreach('contacts.csv') do |row|
        if row[0] == id
          contact.push(Contact.new(row[1], row[2], row[0]))
        end
      end
      contact
    end
    
    # Search for contacts by either name or email.
    # @param term [String] the name fragment or email fragment to search for
    # @return [Array<Contact>] Array of Contact objects.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      contact = []
      CSV.foreach('contacts.csv') do |row|
        if row[1].include?(term) || row[2].include?(term)
          contact.push(Contact.new(row[1],row[2],row[0]))
        end
      end
      contact
    end

  end

end