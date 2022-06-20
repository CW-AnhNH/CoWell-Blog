# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
(1..10).each do |id|
    id = id
    username = Faker::Esport.player
    last_name = Faker::Name.unique.name
    email = Faker::Internet.unique.email
    comment = Faker::Lorem.sentence(word_count: 3)
    post_title = Faker::Coffee.blend_name
    post_content = Faker::Games::WorldOfWarcraft.quote
    group_name = Faker::Games::Witcher.character
    group_description = Faker::Lorem.sentence(word_count: 10)
    User.create(username: username, last_name: last_name, email: email )
    Post.create(title: post_title, content: post_content, user_id: id, group_id: id)
    Group.create(name: group_name, description: group_description, user_id: id, privacy: 1 )
    Comment.create(content: comment, user_id: id, post_id: id)
end

#create_comments
