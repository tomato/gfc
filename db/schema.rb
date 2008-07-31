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

ActiveRecord::Schema.define(:version => 8) do

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
    t.string   "name",                      :default => "", :null => false
    t.string   "summary",                   :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address",    :limit => 500
    t.string   "website"
    t.string   "email"
    t.string   "tel"
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.boolean  "required"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
