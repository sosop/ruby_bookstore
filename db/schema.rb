# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130710073152) do

  create_table "books", :force => true do |t|
    t.string   "name",           :default => "",          :null => false
    t.text     "description",                             :null => false
    t.float    "price",          :default => 0.0,         :null => false
    t.integer  "publish_status", :default => 0,           :null => false
    t.datetime "publish_date"
    t.integer  "stock",          :default => 1,           :null => false
    t.integer  "category_id",    :default => 0,           :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "img_url",        :default => "rails.png", :null => false
  end

  create_table "cart_books", :force => true do |t|
    t.integer  "book_id",    :default => 0, :null => false
    t.integer  "cart_id",    :default => 0, :null => false
    t.integer  "num",        :default => 0, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name",           :default => "", :null => false
    t.integer  "publish_status", :default => 0,  :null => false
    t.integer  "priority",       :default => 0,  :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
