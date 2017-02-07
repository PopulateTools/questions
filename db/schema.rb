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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170206190021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.integer  "option_id"
    t.string   "text_answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["user_id", "question_id"], name: "index_answers_on_user_id_and_question_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "decks", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "slug",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "options", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "value",       null: false
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_options_on_question_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "deck_id"
    t.string   "title",      null: false
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_questions_on_deck_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              null: false
    t.string   "verification_token"
    t.string   "remember_digest"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
