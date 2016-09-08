class MessagesController < ApplicationController

def index
end

def show
end

def new
  # @message = Message.new
end

def create
  @message = @club.messages.build(message_params)
  current_user.messages<<@message
  byebug
  if @message.save
      redirect_to club_path(@message.club_id)
  else
    render 'new'
  end
end


  def edit
  end

  def update
  end

private
def message_params
  params.require(:message).permit(:content, :club_id)
end

end
