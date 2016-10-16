class ConversationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all # not needed
    @conversations = Conversation.all

    if params[:conversation]
      @conversation = Conversation.find(params[:conversation])
      @messages = @conversation.messages

      if @messages.length > 10
        @over_ten = true
        @messages = @messages[-10..-1]
      end

      if params[:m]
        @over_ten = false
        @messages = @conversation.messages
      end

      if @messages.last
        if @messages.last.user_id != current_user.id
          @messages.last.update_attribute(:read, true)
        end
      end
    end

  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],
       params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversations_path(conversation: @conversation)
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
end
