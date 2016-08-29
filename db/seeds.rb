require 'faker'

# creating 6 unique categories
Category.create(name: "Whiskers")
Category.create(name: "Paws")
Category.create(name: "Noses")
Category.create(name: "Tails")
Category.create(name: "Teeth")
Category.create(name: "Ears")

# creating many unique keys
Key.create(string: "fluff")
Key.create(string: "floof")
Key.create(string: "basket")
Key.create(string: "ball")
Key.create(string: "string")
Key.create(string: "stick")
Key.create(string: "birdie")
Key.create(string: "mouse")
Key.create(string: "beaver")
Key.create(string: "wombat")
Key.create(string: "sillystring")
Key.create(string: "crepuscular")
Key.create(string: "nocturnal")
Key.create(string: "musicofointment")
Key.create(string: "moosemoose")
Key.create(string: "cowcow")
Key.create(string: "piggy")
Key.create(string: "dodo")

# creating a secret for each key
# secret content doesn't have to be unique
keys = Key.all 

keys.each do |key| 
	secret = Secret.new(content: Faker::StarWars.quote)
	secret.key = key
	secret.category = Category.all.sample
	secret.save
end

# making some users that will end up unique
7.times do
	User.create(name: Faker::StarWars.character, bio: Faker::Hacker.say_something_smart, password: "password")
	User.create(name: Faker::Pokemon.name, bio: Faker::Hacker.say_something_smart, password: "password")
	User.create(name: Faker::Superhero.name, bio: Faker::Hacker.say_something_smart, password: "password")
end


# assigning users some keys
users = User.all

users.each do |user|
	user.keys << Key.take(5)
end


# making one extra user
user = User.create(name: "Jafar", bio: "I am an evil, evil man who wants to be the sultan of Agrabah.", password: "password")

# making one extra secret
secret = Secret.new(content: "I used to be a giraffe, but now I'm a skeleton.")
key = Key.new(string: "longneck")
secret.key = key
secret.category = Category.all.sample
secret.save
# no need to save key; it was done with secret.save

# assigning extra secret to extra user
user.keys << key




