class CartBookController < ApplicationController
  def create
    if(book_id = params[:book_id]).present?
      cart_book = CartBook.where("cart_id = ? and book_id = ?",current_cart.id,book_id).first

      if cart_book.present?
        CartBook.update_counters(cart_book,:num => params[:num].to_i)
      else
        book = Book.find(book_id)
        CartBook.create(cart_id:current_cart.id, book_id: book.id, num:params[:num]) 
      end
      
      @cart = current_cart
      respond_to do |format|
        format.js
      end

    end
  end
end
