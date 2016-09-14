require 'rails_helper'
# require 'support/factory_girl'

describe Club, type: :model do
  
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
      club = Club.create(name:"Test Club", status:'closed', start_date: (Date.today-40), end_date: (Date.today-10))
      expect(Club.status_update.first.status).to eq('archived')
    end

    it 'changes the status of a club from upcoming to active' do
      club = Club.create(name:"Test Club", status:'upcoming', start_date: (Date.today-1), end_date: (Date.today+10))
      expect(Club.status_update.first.status).to eq('active')
    end

    it 'changes the satus of a club from active to closed' do
      club = Club.create(name:"Test Club", status:'active', start_date: (Date.today-12), end_date: (Date.today+10))
      expect(Club.status_update.first.status).to eq('closed')
    end
  end



end