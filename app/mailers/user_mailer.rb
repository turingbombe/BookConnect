class UserMailer < ApplicationMailer
    default from: 'bookconnect716@gmail.com'

    def welcome_email(user)
        @user = user
        # @url =
        mail(to: @user.email, subject: 'Welcome to Book Connect')
    end
end
