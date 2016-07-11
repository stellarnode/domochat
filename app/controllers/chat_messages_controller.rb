class ChatMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  enable_sync

  def index
    @chat_messages = ChatMessage.all.order("created_at ASC")
    respond_to do |format|
      format.html
      format.json { render json: @chat_messages }
    end
  end

  # def show
  # end

  # def new
  #   @chat_message = ChatMessage.new
  # end

  def create
    @chat_message = @user.chat_messages.build(chat_message_params)
    respond_to do |format|
      if @chat_message.save
        sync_new @chat_message
        # format.html { redirect_to chat_messages_url }
        # format.json { render json: @chat_message, status: :created, location: @chat_message }
      else
        # format.html { render action: "new" }
        format.json { render json: @chat_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  def find_user
    @user = current_user
  end

  def chat_message_params
    params.require(:chat_message).permit(:message)
  end

  def select_chat_messages
    @chat_messages = ChatMessage.all.order("created_at ASC")
  end

end
