class MessagesController < ApplicationController

  def index
    @messages = Message.all.limit(20)
  end

  def create
    @message = Message.new(message_params)
    @message.author = current_user
    @message.save!

    respond_to do |format|
      format.html { redirect_to action: :index }
      format.js
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy!

    respond_to do |format|
      format.html { redirect_to action: :index }
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end

end