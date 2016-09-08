class ClubsController < ApplicationController

  def show
    @club=Club.find(params[:id])
    @club.messages.build
    respond_to do |format|
        format.html
        format.json { render json: @message.to_json }
      end
   end

  def create

  end

  def club_params
    params.require(:club)
  end

end
