require 'faker'

Category.create(name: Faker::Hipster.word)
Category.create(name: Faker::Hipster.word)
Category.create(name: Faker::Hipster.word)
Category.create(name: Faker::Hipster.word)
Category.create(name: Faker::Hipster.word)


# Yo! Here's a rundown:

@categories = Category.all 


5.times do 
	key = Key.new(string: rand(2..33))
	secret = Secret.new(content: "I used to be a giraffe until I died. Now I'm a skeleton.")
	secret.category = @categories.sample
	key.secret = secret 
	key.save
	secret.save
end


user = User.create(name: "Jafar", bio: "I am an evil, evil man who wants to be the sultan of Agrabah.", password: "password")








# So now I'll make lots of stuff:

# 7.times do
# 	User.create(name: Faker::StarWars.character, bio: Faker::Hacker.say_something_smart, password: "password")
# 	User.create(name: Faker::Pokemon.name, bio: Faker::Hacker.say_something_smart, password: "password")
# 	User.create(name: Faker::Superhero.name, bio: Faker::Hacker.say_something_smart, password: "password")
# end


# @secrets = Secret.all


# Take heed! Secrets get mad when they don't have keys! Just try creating one without a key -- can't happen!
# 10.times do
# 	key = Key.new(string: Faker::Space.moon)
# 	secret = Secret.new(content: Faker::StarWars.quote)
# 	secret.category = @categories.sample
	
# 	key.secret = secret
# 	key.save
# 	secret.save
# end



# users = User.all

# users.each do |user|
# 	user.keys << Key.take(3)
# end





# Keys
#     t.string   "string"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   create_table "keys_users", id: false, force: :cascade do |t|
#     t.integer "user_id", null: false
#     t.integer "key_id",  null: false
#   end

#   create_table "secrets", force: :cascade do |t|
#     t.string   "content"
#     t.string   "subject"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.integer  "key_id"
#     t.index ["key_id"], name: "index_secrets_on_key_id"
#   end

#   create_table "users", force: :cascade do |t|
#     t.string   "name"
#     t.string   "password_digest"
#     t.string   "bio"
#     t.datetime "created_at",      null: false
#     t.datetime "updated_at",      null: false
