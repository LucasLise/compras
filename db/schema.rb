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

ActiveRecord::Schema.define(version: 20170309133515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carrinhos", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carrinhos_on_user_id", using: :btree
  end

  create_table "categorias", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enderecos", force: :cascade do |t|
    t.string   "logradouro"
    t.integer  "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cep"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
    t.integer  "municipio_id"
    t.integer  "unidade_federativa_id"
    t.string   "rua"
    t.index ["municipio_id"], name: "index_enderecos_on_municipio_id", using: :btree
    t.index ["unidade_federativa_id"], name: "index_enderecos_on_unidade_federativa_id", using: :btree
    t.index ["user_id"], name: "index_enderecos_on_user_id", using: :btree
  end

  create_table "itens_carrinho", force: :cascade do |t|
    t.integer  "carrinho_id"
    t.integer  "produto_id"
    t.integer  "quantidade"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["carrinho_id"], name: "index_itens_carrinho_on_carrinho_id", using: :btree
    t.index ["produto_id"], name: "index_itens_carrinho_on_produto_id", using: :btree
  end

  create_table "itens_pedido", force: :cascade do |t|
    t.integer  "pedido_id"
    t.integer  "produto_id"
    t.integer  "quantidade"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "valor_unitario"
    t.decimal  "valor_total"
    t.index ["pedido_id"], name: "index_itens_pedido_on_pedido_id", using: :btree
    t.index ["produto_id"], name: "index_itens_pedido_on_produto_id", using: :btree
  end

  create_table "marcas", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municipios", force: :cascade do |t|
    t.string   "nome"
    t.integer  "unidade_federativa_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["unidade_federativa_id"], name: "index_municipios_on_unidade_federativa_id", using: :btree
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "valor_total"
    t.integer  "endereco_id"
    t.index ["endereco_id"], name: "index_pedidos_on_endereco_id", using: :btree
    t.index ["user_id"], name: "index_pedidos_on_user_id", using: :btree
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
    t.integer  "marca_id"
    t.index ["categoria_id"], name: "index_produtos_on_categoria_id", using: :btree
    t.index ["item_carrinho_id"], name: "index_produtos_on_item_carrinho_id", using: :btree
    t.index ["marca_id"], name: "index_produtos_on_marca_id", using: :btree
  end

  create_table "unidades_federativas", force: :cascade do |t|
    t.string   "sigla",      limit: 2
    t.string   "descricao"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
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
    t.integer  "role",                   default: 0
    t.string   "nome"
    t.string   "cpf"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "carrinhos", "users"
  add_foreign_key "enderecos", "municipios"
  add_foreign_key "enderecos", "unidades_federativas"
  add_foreign_key "enderecos", "users"
  add_foreign_key "itens_carrinho", "carrinhos"
  add_foreign_key "itens_carrinho", "produtos"
  add_foreign_key "itens_pedido", "pedidos"
  add_foreign_key "itens_pedido", "produtos"
  add_foreign_key "municipios", "unidades_federativas"
  add_foreign_key "pedidos", "enderecos"
  add_foreign_key "pedidos", "users"
  add_foreign_key "produtos", "categorias"
  add_foreign_key "produtos", "itens_carrinho"
  add_foreign_key "produtos", "marcas"
end
