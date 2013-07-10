class SessionsController < ApplicationController
  def create
    @cart = current_cart
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
    @cart = current_cart
    sign_out
    respond_to do |format|
      format.js {render "share/inout"}
    end
  end
end
