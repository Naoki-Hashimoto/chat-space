class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(post_params)
    if @group.save
      redirect_to root_path(@group),notice: 'チャットグループが作成されました。'
    else
      flash[:alert] = '保存に失敗しました。'
      render :new
    end
  end

  private
  def post_params
    params.require(:group).permit(:name, user_ids:[] )
  end

end
