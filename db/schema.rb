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

ActiveRecord::Schema.define(:version => 20140130084759) do

  create_table "arrivals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "arrival_flg"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "choices", :force => true do |t|
    t.integer  "question_id",   :null => false
    t.integer  "choice_number"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "explanation"
  end

  create_table "correct_answers", :force => true do |t|
    t.integer  "question_id",   :null => false
    t.integer  "choice_number"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "questions", :force => true do |t|
    t.text     "description"
    t.text     "explanation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "course"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "authority",       :default => 0
    t.integer  "trial_cnt",       :default => 0
    t.integer  "answer_cnt",      :default => 0
    t.integer  "arrival_cnt",     :default => 0
  end

end
