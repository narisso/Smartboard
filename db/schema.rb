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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20131022152157) do
=======
ActiveRecord::Schema.define(:version => 20131024204038) do
>>>>>>> create_use_case_with_template

  create_table "bugs", :force => true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "test_case_id"
    t.integer  "task_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.text     "message"
    t.boolean  "approved"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "commits", :force => true do |t|
    t.string   "url"
    t.string   "sha"
    t.string   "author_name"
    t.string   "author_email"
    t.string   "date"
    t.string   "message"
    t.integer  "task_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "document_projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url_path"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "document_tasks", :force => true do |t|
    t.text     "description"
    t.string   "name"
    t.integer  "task_id"
    t.string   "url_path"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "evaluations", :force => true do |t|
    t.integer  "task_id"
    t.text     "description"
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "goals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "labels", :force => true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_role_users", :force => true do |t|
    t.integer  "project_id"
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "initial_date"
    t.date     "finish_date"
    t.string   "status"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "project_status_id"
    t.string   "dropbox_token"
    t.string   "github_token"
    t.string   "repo_name"
    t.string   "github_user"
  end

  create_table "reported_hours", :force => true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.integer  "reporting_hours"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "requirement_templates", :force => true do |t|
    t.string   "name"
    t.text     "template_form"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "requirements", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.text     "data"
    t.integer  "template_id"
    t.integer  "use_case_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
    t.integer  "order"
  end

  create_table "task_users", :force => true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.integer  "developer_id"
    t.integer  "creator_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "task_father_id"
    t.string   "task_type"
    t.datetime "status_update_at"
    t.integer  "project_id"
    t.integer  "status_id"
    t.integer  "requirement_id"
    t.integer  "label_id"
    t.integer  "estimated_hours"
    t.integer  "effective_hours"
    t.integer  "priority"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "goal_id"
    t.integer  "task_depend_id"
  end

  create_table "test_cases", :force => true do |t|
    t.text     "description"
    t.datetime "executed_at"
    t.boolean  "approved"
    t.integer  "evaluation_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "use_case_groups", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "use_case_templates", :force => true do |t|
    t.string   "name"
    t.text     "template_form"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "project_id"
  end

  create_table "use_cases", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "use_case_template_id"
    t.text     "data"
    t.integer  "use_case_group_id"
  end

  create_table "users", :force => true do |t|
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
    t.string   "name"
    t.string   "picture"
    t.string   "curriculum"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
