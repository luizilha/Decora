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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160223154505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categoria", primary_key: "id_categoria", force: true do |t|
    t.string   "nome",              limit: 80,                                                           null: false
    t.text     "descricao",                                                                              null: false
    t.string   "capa_file_name"
    t.string   "capa_content_type"
    t.integer  "capa_file_size"
    t.datetime "capa_updated_at"
    t.integer  "id_usuario",                   default: "nextval('categoria_id_usuario_seq'::regclass)", null: false
  end

  create_table "item", primary_key: "id_item", force: true do |t|
    t.string   "nome",              limit: 80,                                                        null: false
    t.text     "descricao",                                                                           null: false
    t.float    "preco",                                                                               null: false
    t.float    "preco_reposicao",                                                                     null: false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.integer  "id_categoria",                 default: "nextval('item_id_categoria_seq'::regclass)", null: false
    t.integer  "quantidade"
    t.date     "alteracao"
  end

  create_table "item_projeto", primary_key: "id_item", force: true do |t|
    t.integer "id_projeto", default: "nextval('item_projeto_id_projeto_seq'::regclass)", null: false
  end

  create_table "projeto", primary_key: "id_projeto", force: true do |t|
    t.string  "nome",       limit: 80,                                                         null: false
    t.text    "descricao",                                                                     null: false
    t.integer "id_usuario",            default: "nextval('projeto_id_usuario_seq'::regclass)", null: false
  end

  create_table "usuario", force: true do |t|
    t.string   "nome"
    t.boolean  "nvl_acesso"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "usuario", ["email"], name: "index_usuario_on_email", unique: true, using: :btree
  add_index "usuario", ["reset_password_token"], name: "index_usuario_on_reset_password_token", unique: true, using: :btree

end
