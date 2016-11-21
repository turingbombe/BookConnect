require "rails_helper"
require 'support/factory_girl'

RSpec.describe User, type: :model do

  let(:sample_user) {User.create(name: "User", age: 23, favorite_books: "Charlotte's Web")}
  let(:active_club) {create(:club, :active)}

  describe "#current_clubs" do
    it "returns the active clubs of the user" do
    sample_user.clubs<<active_club
    expect(sample_user.current_clubs).to include([active_club])
    end
  end



end
