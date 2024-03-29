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

ActiveRecord::Schema.define(version: 20130916154108) do

  create_table "amistads", force: true do |t|
    t.integer  "amigo"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comentarios", force: true do |t|
    t.string   "autor"
    t.string   "contenido"
    t.integer  "publicacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notificacions", force: true do |t|
    t.string   "autor"
    t.string   "contenido"
    t.boolean  "leido"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publicacions", force: true do |t|
    t.string   "autor"
    t.string   "contenido"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solicituds", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "ref"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "mail"
    t.string   "password_digest"
    t.string   "sexo"
    t.string   "pregunta_secreta"
    t.date     "fecha_nacimiento"
    t.string   "respuesta_secreta"
    t.string   "rol"
    t.string   "estado"
    t.string   "foto_perfil"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

end
