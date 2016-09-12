class UserMailer < ApplicationMailer
    default from: 'bookconnect716@gmail.com'

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to Book Connect')
    end

    def invitation_email(option = {})
        #binding.pry
        url = "https://aqueous-crag-52137.herokuapp.com/"
        @user = User.find(option[:user_id]).name
        @email = option[:email]
        @name = option[:name]
        @club_link = url + option[:club_id]
        @club = Club.find(option[:club_id]).name
        mail(to: @email, subject: 'Join Book Connect')
    end
end
