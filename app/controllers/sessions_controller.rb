class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])

    if user.present? && user.authenticate(params[:password])
      sign_in user
      respond_to do |format|
        format.js {render "share/inout"}
      end
    else
      render json: -1
    end

  end

  def destroy
    sign_out
    respond_to do |format|
      format.js {render "share/inout"}
    end
  end
end
