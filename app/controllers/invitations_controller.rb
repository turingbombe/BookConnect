class InvitationsController < ApplicationController

    def new
    end

    def create
        #binding.pry
        UserMailer.invitation_email(invitation_params).deliver_now
        @club = Club.find(club_params[:club_id])
        redirect_to club_path(@club)
    end

    private

    def invitation_params
        params.require(:invitations).permit(:name, :email, :user_id, :club_id)
    end

    def club_params
        params.require(:invitations).permit(:club_id)
    end
end
