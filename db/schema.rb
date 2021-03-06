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

ActiveRecord::Schema.define(:version => 20110725153545) do

  create_table "comments", :force => true do |t|
    t.integer  "quest_id",   :null => false
    t.text     "message",    :null => false
    t.string   "author",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["quest_id"], :name => "index_comments_on_quest_id"

  create_table "maps", :force => true do |t|
    t.integer  "user_id",                                                   :null => false
    t.integer  "quest_id",                                                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "lng",        :precision => 10, :scale => 6,                 :null => false
    t.decimal  "lat",        :precision => 10, :scale => 6,                 :null => false
    t.integer  "zoom",                                      :default => 12, :null => false
  end

  add_index "maps", ["quest_id"], :name => "index_maps_on_quest_id"
  add_index "maps", ["user_id"], :name => "index_maps_on_user_id"

  create_table "placemarks", :force => true do |t|
    t.integer  "map_id",                                      :null => false
    t.string   "name",                                        :null => false
    t.string   "description"
    t.string   "icon_content"
    t.decimal  "lat",          :precision => 10, :scale => 6, :null => false
    t.decimal  "lng",          :precision => 10, :scale => 6, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polylines", :force => true do |t|
    t.integer  "map_id",                                              :null => false
    t.text     "encoded_points",                                      :null => false
    t.string   "hint_content"
    t.string   "stroke_color",   :limit => 8, :default => "ff0000ff", :null => false
    t.integer  "stroke_width",                :default => 1,          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "polylines", ["map_id"], :name => "index_polylines_on_map_id"

  create_table "quests", :force => true do |t|
    t.string   "title",                                       :null => false
    t.text     "description",                                 :null => false
    t.string   "meeting_place",                               :null => false
    t.time     "meeting_at",                                  :null => false
    t.time     "start_at",                                    :null => false
    t.decimal  "cost",          :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organizers"
    t.date     "date",                                        :null => false
  end

  create_table "user_quests", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "quest_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_quests", ["quest_id"], :name => "index_user_quests_on_quest_id"
  add_index "user_quests", ["user_id", "quest_id"], :name => "index_user_quests_on_user_id_and_quest_id", :unique => true
  add_index "user_quests", ["user_id"], :name => "index_user_quests_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name",                                                   :null => false
    t.string   "last_name",                                                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                               :default => "",          :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",          :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt",                       :default => "",          :null => false
    t.string   "role",                                :default => "moderator", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
