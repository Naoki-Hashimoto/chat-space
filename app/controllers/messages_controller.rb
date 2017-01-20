class MessagesController < ApplicationController
  before_action :move_to_sign_in

  def index
  end

  def move_to_sign_in
    redirect_to "/users/sign_in" unless user_signed_in?
  end
end
