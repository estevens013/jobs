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

ActiveRecord::Schema.define(:version => 20131104195425) do

  create_table "customers", :force => true do |t|
    t.string   "customername"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.string   "purchaseOrder"
    t.string   "customer"
    t.string   "owner"
    t.string   "internalOwner"
    t.string   "status"
    t.date     "modified"
    t.date     "due"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "owners", :force => true do |t|
    t.string   "ownername"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "parts", :force => true do |t|
    t.string   "partNumber"
    t.string   "partQuantity"
    t.integer  "job_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "fullname"
    t.string   "email"
    t.string   "customer"
    t.string   "admin"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "password_hash"
    t.string   "password_salt"
  end

end
