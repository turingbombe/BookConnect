require 'rails_helper'
# require 'support/factory_girl'

RSpec.describe Club, type: :model do

  describe "get book club status" do
    let(:active_club) {create(:club, :active)}
    let(:archived_club) {create(:club, :archived)}
    let(:closed_club) {create(:club, :closed)}
    let(:upcoming_club) {create(:club, :upcoming)}

    it 'returns all upcoming book clubs' do
      expect(Club.upcoming).to eq([upcoming_club])
    end

    it 'returns all active book clubs' do
      expect(Club.open).to eq([active_club])
    end

    it 'returns all archived book clubs' do
      expect(Club.archived).to eq([archived_club])
    end
  end

  describe "Updates the status for all clubs" do

    it 'changes the status of a club from closed to archived' do
      Club.create(name:"Test Club", status:'closed', start_date: (Date.today-40), end_date: (Date.today-10))
      expect(Club.update_status.first.status).to eq('archived')
    end

    it 'changes the status of a club from upcoming to active' do
      Club.create(name:"Test Club", status:'upcoming', start_date: (Date.today-1), end_date: (Date.today+10))
      expect(Club.update_status.first.status).to eq('active')
    end

    it 'changes the satus of a club from active to closed' do
      Club.create(name:"Test Club", status:'active', start_date: (Date.today-12), end_date: (Date.today+10))
      expect(Club.update_status.first.status).to eq('closed')
    end
  end

  describe "Sets the status for a new club" do
    it 'sets the status of an upcoming club to upcoming' do
      club= Club.create(name: "Test Club", start_date: (Date.today+10), end_date: (Date.today+40))
      club.set_status
      expect(club.status).to eq('upcoming')
    end
  end

  describe "Club has many messages" do
      it "has many messages, and messages have content" do
        club= Club.create(name: "Test Club", start_date: (Date.today+10), end_date: (Date.today+40))
        message= Message.new(content: "hello")
        club.messages<<message
        expect(club.messages.first.content).to eq("hello")
      end
  end



end
