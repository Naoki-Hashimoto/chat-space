class MessagesController < ApplicationController
  before_action :set_group
  def index
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path }
        format.json { render json: @message }
      end
    else
      flash.now[:alert] = 'メッセージの送信に失敗しました。'
      render :index
    end
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    gon.user_name = current_user.name
  end

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

end
