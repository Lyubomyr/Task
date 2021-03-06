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

ActiveRecord::Schema.define(:version => 20121127174550) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "permalink"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"

  create_table "photo_pictures", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "t_name"
  end

  create_table "picture_order_calcs", :force => true do |t|
    t.string   "size"
    t.string   "frame"
    t.string   "human_count"
    t.text     "comments"
    t.text     "first_step"
    t.text     "second_step"
    t.text     "third_step"
    t.text     "greeting"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "picture_orders", :force => true do |t|
    t.integer  "picture_id"
    t.string   "size"
    t.integer  "human_count"
    t.boolean  "gel",          :default => false
    t.string   "frame"
    t.text     "comments"
    t.string   "status",       :default => "new"
    t.string   "slug"
    t.string   "user_name"
    t.string   "user_mname"
    t.string   "user_surname"
    t.string   "user_email"
    t.string   "user_tel"
    t.string   "user_address"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "price"
  end

  add_index "picture_orders", ["picture_id"], :name => "index_picture_orders_on_picture_id"
  add_index "picture_orders", ["status"], :name => "index_picture_orders_on_status"

  create_table "picture_user_photos", :force => true do |t|
    t.integer  "picture_order_id"
    t.string   "image"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "picture_user_photos", ["picture_order_id"], :name => "index_picture_user_photos_on_picture_order_id"

  create_table "pictures", :force => true do |t|
    t.integer  "photo_picture_id"
    t.string   "name"
    t.string   "image"
    t.string   "image_mini"
    t.string   "slug"
    t.string   "title"
    t.string   "alt"
    t.text     "text"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "pictures", ["photo_picture_id"], :name => "index_pictures_on_photo_picture_id"
  add_index "pictures", ["slug"], :name => "index_pictures_on_slug"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "rich_rich_files", :force => true do |t|
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        :default => "file"
  end

end
