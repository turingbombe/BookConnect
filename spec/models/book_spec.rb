require 'rails_helper'
require 'support/factory_girl'


RSpec.describe Book, type: :model do 
    let(:jp) {Book.create(title: "Jurassic Park", author: "Michael Crichton", genre: "Thriller", description: "awsome dinosaur book. must read!")}
  describe '.search' do
    it 'searches and returns a book from the database' do
      results = Book.search("Park")
      expect(results).to include(jp)
    end
  
  end

  describe "#author" do 
    it "has an author name that is a string" do  
      expect(jp.author).to eq("Michael Crichton")
    end
  end

  describe "#clubs" do 
    it has many clubs
    make some clubs, test that out
  end
end

