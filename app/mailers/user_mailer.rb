class UserMailer < ApplicationMailer
    default from: 'bookconnect716@gmail.com'

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to Book Connect')
    end

    def invitation_email(user)
        @user = user
        mail(to: @user.email, subject: 'Join Book Connect')
    end
end
