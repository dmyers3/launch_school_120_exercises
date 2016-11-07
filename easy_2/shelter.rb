# Pet class instantiated with pet type and name
# Owner class instantiated with owner name
# Shelter has adopt instance method that takes owner instance and pet instance
# Owner class needs to keep track of pets and how many
# Shelter also has instance method that prints out all adopted pets for each
# owner
# assume no validation needed

class Pet
  attr_reader :type, :name
  
  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_reader :name, :pets
  
  def initialize(name)
    @name = name
    @pets = []
  end
  
  def number_of_pets
    pets.size
  end
end

class Shelter
  attr_reader :adopters
  
  def initialize
    @adopters = []
  end
  
  def adopt(owner, pet)
    adopters << owner unless adopters.include?(owner)
    owner.pets << pet
  end
  
  def print_adoptions
    adopters.each do |adopter| 
      puts "#{adopter.name} has adopted the following pets:"
      adopter.pets.each do |pet|
        puts "a #{pet.type} named #{pet.name}"
      end
      puts ""
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."