class FrontController < ApplicationController
  def index

    @cart = current_cart
    query_scope_books = Book.published

    if(category_id = params[:category_id]).present?
      query_scope_books = query_scope_books.where("category_id = ?",category_id)
    end

    if(book_name = params[:book_name]).present?
      query_scope_books = query_scope_books.where("name like ?","%#{book_name}%")
    end

    @books = query_scope_books.page(params[:page]).per(9)
  end
end
