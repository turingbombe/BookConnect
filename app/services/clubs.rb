class UpdateClubStatus

  def update_status
    now = Date.today
    if club.status == 'closed' && club.end_date.past?
      club.status = 'archived'
      club.save
    elsif club.status == 'upcoming' && club.start_date <= now
      club.status = 'active'
      club.save
    elsif club.status == 'active' && (now - club.start_date) > 10
      club.status = 'closed'
      club.save
    end
  end

  def set_club_status
    now = Date.today
    if self.end_date.past?
      self.status = 'archived'
      self.save
    elsif self.start_date <= now
      self.status = 'active'
      self.save
    elsif (now - self.start_date) > 10
      self.status = 'closed'
      self.save
    elsif (self.start_date) > now
      self.status = 'upcoming'
      self.save
    end
  end

end
