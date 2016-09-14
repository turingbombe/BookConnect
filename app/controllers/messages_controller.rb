class MessagesController < ApplicationController

def index
end

def show
end

def new
  # @message = Message.new
end

def create
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
