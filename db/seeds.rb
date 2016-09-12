# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


40.times do
  ##Book Seeds
  start = Faker::Date.between(30.days.ago, 30.days.from_now)
  finish = start+30
  test = GoogleBooks.search(Faker::Book.title).first
  if test.title  
    @book = Book.create(title: test.title, author: test.authors, genre: test.categories, description: test.description, url: test.image_link)
  else
    break
  end
  ##Club Seeds
  now = Date.today
  if finish.past?
    club = Club.create(name: "#{@book.title} Book Club", status: "archived", start_date: start, end_date: finish)
  elsif start >= now
    club = Club.create(name: "#{@book.title} Book Club", status: "upcoming", start_date: start, end_date: finish)
  elsif (now - start) > 10
    club = Club.create(name: "#{@book.title} Book Club", status: "closed", start_date: start, end_date: finish)
  elsif start <= now
    club = Club.create(name: "#{@book.title} Book Club", status: "open", start_date: start, end_date: finish)    
  end
  club.book = @book
  ##User Seeds
  user = User.create(name: Faker::Name.name, age: Random.rand(18...99), favorite_books: Faker::Book.title, password: "123")
  user.clubs << club
  ##Messge Seed
  club.messages << Message.create(content: Faker::ChuckNorris.fact)
end
