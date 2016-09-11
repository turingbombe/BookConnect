# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

status_array = ["open", "closed", "upcoming", "archived"]

40.times do
  ##Book Seeds
  start = Faker::Date.between(Date.today, 1.year.from_now)
  finish = start+30
  title = Faker::Book.title
  description= Faker::Hipster.paragraph(2, true)
  genre= Faker::Book.genre
  ##Club Seeds
  club = Club.create(name: "#{title} Book Club", status: status_array.sample, start_date: start, end_date: finish)
  club.book = Book.create(title: title, author: Faker::Book.author, description: description, genre: genre)
  ##User Seeds
  user = User.create(name: Faker::Name.name, age: Random.rand(18...99), favorite_books: Faker::Book.title, password: "123")
  user.clubs << club
  ##Messge Seed
  club.messages << Message.create(content: Faker::ChuckNorris.fact)
end
