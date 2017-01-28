class MessagesController < ApplicationController
  before_action :get_group_id
  def index
    @message = current_user.messages.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: 'メッセージの送信が完了しました。'
    else
      flash.now[:alert] = 'メッセージの送信に失敗しました。'
      render :index
    end
  end

  private
  def get_group_id
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

end
