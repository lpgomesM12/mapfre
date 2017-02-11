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

ActiveRecord::Schema.define(version: 20170211192118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apolices", force: :cascade do |t|
    t.string   "ramo"
    t.string   "produto"
    t.string   "apolice"
    t.string   "item"
    t.datetime "data_proposta"
    t.datetime "vig_inicio"
    t.datetime "vig_termino"
    t.string   "nome_segurado"
    t.string   "cpf"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "cep"
    t.string   "uf"
    t.string   "valr_premioliquido"
    t.string   "valr_adicional"
    t.string   "valr_custo"
    t.string   "valr_iof"
    t.string   "valr_premiototal"
    t.string   "desc_obs"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "numr_mensal"
    t.boolean  "cnpj"
  end

end
