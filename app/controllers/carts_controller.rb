class CartsController < ApplicationController
  # GET /carts/new
  # GET /carts/new.json

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end


  def pay

  end

  def destroy
    @cart = Cart.find(params[:id]) 
    @cart.destroy
    respond_to do |format|
      format.js
    end
  end
end
