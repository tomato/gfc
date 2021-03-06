# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090107183158) do

  create_table "answers", :force => true do |t|
    t.text     "text"
    t.integer  "producer_id", :limit => 11, :null => false
    t.integer  "question_id", :limit => 11, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer "size",         :limit => 11
    t.string  "content_type"
    t.string  "filename"
    t.integer "height",       :limit => 11
    t.integer "width",        :limit => 11
    t.integer "section_id",   :limit => 11
    t.string  "section_type"
  end

  create_table "producers", :force => true do |t|
    t.string   "name",                                           :null => false
    t.string   "summary",                                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address",    :limit => 500
    t.string   "website"
    t.string   "email"
    t.string   "tel"
    t.string   "status",                    :default => "draft", :null => false
    t.integer  "user_id",    :limit => 11
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "producer_id", :limit => 11, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.boolean  "required"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  create_table "variants", :force => true do |t|
    t.string   "description",                                             :null => false
    t.decimal  "price",                     :precision => 6, :scale => 2
    t.boolean  "available",                                               :null => false
    t.integer  "product_id",  :limit => 11,                               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
