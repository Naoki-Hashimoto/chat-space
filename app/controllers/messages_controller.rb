class MessagesController < ApplicationController
  before_action :get_group_id
  def index
    @groups = current_user.groups
  end

  private
  def get_group_id
    @group = Group.find(params[:group_id])
  end

end
