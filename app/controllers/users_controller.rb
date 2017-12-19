class UsersController < ApplicationController

  def create
    user = User.new({
    name: params[:name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation],
  })
    if user.save
      render json: user.as_json
    else
      render json: {error: user.errors.full_messages}
    end
  end
end
