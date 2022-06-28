# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..10).each do |id|
    username = Faker::Esport.player
    family_name = Faker::Name.unique.name
    last_name = Faker::Name.unique.name
    birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
    email = Faker::Internet.unique.email
    comment = Faker::Lorem.sentence(word_count: 3)
    post_title = Faker::Coffee.blend_name
    post_content = Faker::Games::WorldOfWarcraft.quote
    group_name = Faker::Games::Witcher.character
    group_description = Faker::Quote.famous_last_words
    user = User.create(username: username, email: email, family_name: family_name, last_name: last_name, birthday: birthday, status: [:permit, :ban].sample, admin: false, password: 123456)
    group = Group.create(name: group_name, description: group_description, user: user, privacy: 1 )
    post = Post.create(title: post_title, content: post_content, user: user, status: [:pendings, :approveds, :rejects].sample, privacy: [:publics, :privates].sample, group: group)
    Comment.create(content: comment, user: user, post: post)
    PostVoting.create(user: user, post:post, vote_status: [true, false].sample)
end
