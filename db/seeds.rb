# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do 
  title = Faker::Book.title
  club = Club.create(name: "#{title} Book Club")
  club.book = Book.create(title: title, author: Faker::Book.author)
  user = User.create(name: Faker::Name.name, age: Random.rand(18...99), favorite_books: [])
  user.clubs << club
  club.messages << Message.create(content: Faker::ChuckNorris.fact)
end