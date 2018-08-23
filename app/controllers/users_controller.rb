class UsersController < ApplicationController
  def register
    user = User.find_by(uuid: filtered_params[:user_id])
    if user
      user.registration_id = filtered_params[:registration_id]
    else
      user = User.new(uuid: filtered_params[:user_id], registration_id: filtered_params[:registration_id])
    end
    if user.save
      render json: { status: 'success', body: '' }, status: 201
    else
      render json: { status: 'failure', body: user.errors.full_messages.join('. ') }, status: 401
    end
  end

  private

  def filtered_params
    params.permit(:user_id, :registration_id)
  end
end