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

ActiveRecord::Schema.define(version: 20170302124540) do

  create_table "carrinhos", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carrinhos_on_user_id"
  end

  create_table "categorias", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itens_carrinho", force: :cascade do |t|
    t.integer  "carrinho_id"
    t.integer  "produto_id"
    t.integer  "quantidade"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "pedido_id"
    t.index ["carrinho_id"], name: "index_itens_carrinho_on_carrinho_id"
    t.index ["pedido_id"], name: "index_itens_carrinho_on_pedido_id"
    t.index ["produto_id"], name: "index_itens_carrinho_on_produto_id"
  end

  create_table "itens_pedido", force: :cascade do |t|
    t.integer  "pedido_id"
    t.integer  "produto_id"
    t.integer  "quantidade"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "valor_unitario"
    t.decimal  "valor_total"
    t.index ["pedido_id"], name: "index_itens_pedido_on_pedido_id"
    t.index ["produto_id"], name: "index_itens_pedido_on_produto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "valor_total"
    t.index ["user_id"], name: "index_pedidos_on_user_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "descricao"
    t.decimal  "preco"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.integer  "quantidade"
    t.integer  "categoria_id"
    t.integer  "item_carrinho_id"
    t.index ["categoria_id"], name: "index_produtos_on_categoria_id"
    t.index ["item_carrinho_id"], name: "index_produtos_on_item_carrinho_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
