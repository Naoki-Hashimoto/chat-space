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
  end

  def update
    if @group.update(post_params)
      redirect_to group_messages_path(@group), notice: 'グループ編集が完了しました。'
    else
      flash.now[:alert] = 'グループの更新に失敗しました。'
      render :edit
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
