require 'rails_helper'
require 'support/factory_girl'

RSpec.describe Book, type: :model do
  #create object with data
     let(:jp) {Book.create(title: "Jurassic Park", author: "Michael Crichton", genre: "Thriller", description: "awsome dinosaur book. must read!")}
     let(:sample_club) {Club.create(name: "Awesome Club")}
   describe '.search' do  #. for a class method
     it 'searches and returns a book from the database' do
       results = Book.search("Park")
       expect(results).to include(jp)
     end

   end

   describe "#author" do  #for an instance
     it "has an author name that is a string" do
       expect(jp.author).to eq("Michael Crichton")
     end
   end

   describe "#clubs" do
     it "has many clubs" do
     jp.clubs<<sample_club
     expect(jp.clubs).to include(sample_club)
   end
 end

  describe "#title" do
    it "had a title" do
      expect(jp.title).to eq("Jurassic Park")
    end
  end

  describe "#description" do
    it "has a description" do
      expect(jp.description).to eq("awsome dinosaur book. must read!")
    end
  end

  describe "#genre" do
    it "has a genre" do
      expect(jp.genre).to eq("Thriller")
    end
  end

 end
