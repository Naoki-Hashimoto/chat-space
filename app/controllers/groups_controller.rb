class GroupsController < ApplicationController

  before_action :get_group_id, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(post_params)
    if @group.save
      redirect_to group_messages_path(@group),notice: 'チャットグループが作成されました。'
    else
      flash[:alert] = '保存に失敗しました。'
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    if 
      group.update(post_params)
      redirect_to group_messages_path(@group)
    else
      redirect_to edit_group_path, alert: 'グループの更新に失敗しました'
    end
  end

  private
  def post_params
    params.require(:group).permit(:name, user_ids:[] )
  end

  def get_group_id
    @group = Group.find(params[:id])
  end

end
