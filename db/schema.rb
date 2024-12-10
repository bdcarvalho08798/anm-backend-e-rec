# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_12_10_122433) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "applicant_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "user_avatar"
    t.index ["email"], name: "index_applicant_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_applicant_users_on_reset_password_token", unique: true
  end

  create_table "archives", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "reference_number"
    t.integer "prioroty"
    t.integer "category"
    t.integer "status"
    t.bigint "directorate_id", null: false
    t.bigint "natdirectorate_id", null: false
    t.string "attachment_doc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", default: 1, null: false
    t.index ["directorate_id"], name: "index_archives_on_directorate_id"
    t.index ["natdirectorate_id"], name: "index_archives_on_natdirectorate_id"
    t.index ["user_id"], name: "index_archives_on_user_id"
  end

  create_table "comment_document_dgs", force: :cascade do |t|
    t.text "comment"
    t.bigint "user_id", null: false
    t.bigint "document_from_dg_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_from_dg_id"], name: "index_comment_document_dgs_on_document_from_dg_id"
    t.index ["user_id"], name: "index_comment_document_dgs_on_user_id"
  end

  create_table "comment_document_dns", force: :cascade do |t|
    t.string "comment"
    t.bigint "user_id", null: false
    t.bigint "document_from_dn_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_from_dn_id"], name: "index_comment_document_dns_on_document_from_dn_id"
    t.index ["user_id"], name: "index_comment_document_dns_on_user_id"
  end

  create_table "comment_minister_documents", force: :cascade do |t|
    t.text "comment"
    t.bigint "user_id", null: false
    t.bigint "minister_document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["minister_document_id"], name: "index_comment_minister_documents_on_minister_document_id"
    t.index ["user_id"], name: "index_comment_minister_documents_on_user_id"
  end

  create_table "constitutional_governments", force: :cascade do |t|
    t.integer "sequential_number"
    t.string "constitutional_government_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
  end

  create_table "departments", force: :cascade do |t|
    t.string "depcode"
    t.string "depname"
    t.bigint "natdirectorate_id", null: false
    t.bigint "directorate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["directorate_id"], name: "index_departments_on_directorate_id"
    t.index ["natdirectorate_id"], name: "index_departments_on_natdirectorate_id"
  end

  create_table "directorates", force: :cascade do |t|
    t.string "dircode"
    t.string "dirname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "unit"
  end

  create_table "document_dg_department_units", force: :cascade do |t|
    t.bigint "department_id", null: false
    t.bigint "document_dg_forward_department_unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_document_dg_department_units_on_department_id"
    t.index ["document_dg_forward_department_unit_id"], name: "idx_on_document_dg_forward_department_unit_id_e0100ec3c4"
  end

  create_table "document_dg_departments", force: :cascade do |t|
    t.bigint "document_dg_forward_department_id", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_document_dg_departments_on_department_id"
    t.index ["document_dg_forward_department_id"], name: "idx_on_document_dg_forward_department_id_cca0c265a6"
  end

  create_table "document_dg_forward_department_units", force: :cascade do |t|
    t.bigint "document_from_dg_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_from_dg_id"], name: "idx_on_document_from_dg_id_8357033f0b"
  end

  create_table "document_dg_forward_departments", force: :cascade do |t|
    t.bigint "document_from_dg_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_from_dg_id"], name: "index_document_dg_forward_departments_on_document_from_dg_id"
  end

  create_table "document_dg_forward_ministers", force: :cascade do |t|
    t.text "description"
    t.bigint "document_from_dg_id", null: false
    t.bigint "directorate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["directorate_id"], name: "index_document_dg_forward_ministers_on_directorate_id"
    t.index ["document_from_dg_id"], name: "index_document_dg_forward_ministers_on_document_from_dg_id"
  end

  create_table "document_dg_forward_natdirectorates", force: :cascade do |t|
    t.text "description"
    t.bigint "document_from_dg_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_from_dg_id"], name: "idx_on_document_from_dg_id_a494c2a4e3"
  end

  create_table "document_dg_natdirectorates", force: :cascade do |t|
    t.bigint "natdirectorate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "document_dg_forward_natdirectorate_id", null: false
    t.index ["document_dg_forward_natdirectorate_id"], name: "idx_on_document_dg_forward_natdirectorate_id_9b7a214f29"
    t.index ["natdirectorate_id"], name: "index_document_dg_natdirectorates_on_natdirectorate_id"
  end

  create_table "document_dn_departments", force: :cascade do |t|
    t.bigint "document_dn_forward_department_id", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_document_dn_departments_on_department_id"
    t.index ["document_dn_forward_department_id"], name: "idx_on_document_dn_forward_department_id_576246428f"
  end

  create_table "document_dn_forward_departments", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "document_from_dn_id", null: false
    t.index ["document_from_dn_id"], name: "index_document_dn_forward_departments_on_document_from_dn_id"
  end

  create_table "document_from_dgs", force: :cascade do |t|
    t.string "sender"
    t.string "subject"
    t.string "reference_number"
    t.integer "priority"
    t.integer "category"
    t.integer "status"
    t.bigint "directorate_id", null: false
    t.integer "forwardstatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment_doc_dg"
    t.integer "document_source"
    t.index ["directorate_id"], name: "index_document_from_dgs_on_directorate_id"
  end

  create_table "document_from_dns", force: :cascade do |t|
    t.string "sender"
    t.string "subject"
    t.string "reference_number"
    t.integer "priority"
    t.integer "category"
    t.integer "status"
    t.integer "forwardstatus"
    t.string "attachment_doc_dn"
    t.bigint "directorate_id", null: false
    t.bigint "natdirectorate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "document_source"
    t.index ["directorate_id"], name: "index_document_from_dns_on_directorate_id"
    t.index ["natdirectorate_id"], name: "index_document_from_dns_on_natdirectorate_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "job_list_id", null: false
    t.string "email"
    t.string "resume"
    t.string "diplomadegree"
    t.string "transcriptdegree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_list_id"], name: "index_job_applications_on_job_list_id"
  end

  create_table "job_essential_criteria_responses", force: :cascade do |t|
    t.bigint "job_application_id", null: false
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_application_id"], name: "index_job_essential_criteria_responses_on_job_application_id"
  end

  create_table "job_essential_critria_lists", force: :cascade do |t|
    t.bigint "job_list_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_list_id"], name: "index_job_essential_critria_lists_on_job_list_id"
  end

  create_table "job_lists", force: :cascade do |t|
    t.string "title"
    t.string "deadline"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "minister_archives", force: :cascade do |t|
    t.string "document_title"
    t.string "document_number"
    t.string "reference_number"
    t.integer "document_type"
    t.integer "author"
    t.text "remarks"
    t.bigint "constitutional_government_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "minister_archive_attachment"
    t.index ["constitutional_government_id"], name: "index_minister_archives_on_constitutional_government_id"
  end

  create_table "minister_document_department_units", force: :cascade do |t|
    t.bigint "minister_document_forward_department_unit_id", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_minister_document_department_units_on_department_id"
    t.index ["minister_document_forward_department_unit_id"], name: "idx_on_minister_document_forward_department_unit_id_025503ed35"
  end

  create_table "minister_document_departments", force: :cascade do |t|
    t.bigint "department_id", null: false
    t.bigint "minister_document_forward_department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_minister_document_departments_on_department_id"
    t.index ["minister_document_forward_department_id"], name: "idx_on_minister_document_forward_department_id_74729caebf"
  end

  create_table "minister_document_directorates", force: :cascade do |t|
    t.bigint "directorate_id", null: false
    t.bigint "minister_document_forward_directorate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["directorate_id"], name: "index_minister_document_directorates_on_directorate_id"
    t.index ["minister_document_forward_directorate_id"], name: "idx_on_minister_document_forward_directorate_id_2a8a14fef7"
  end

  create_table "minister_document_forward_department_units", force: :cascade do |t|
    t.text "description"
    t.bigint "minister_document_id", null: false
    t.bigint "directorate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["directorate_id"], name: "idx_on_directorate_id_5fc40ced02"
    t.index ["minister_document_id"], name: "idx_on_minister_document_id_53b962cfd8"
  end

  create_table "minister_document_forward_departments", force: :cascade do |t|
    t.text "description"
    t.bigint "minister_document_id", null: false
    t.bigint "natdirectorate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["minister_document_id"], name: "idx_on_minister_document_id_b84f744410"
    t.index ["natdirectorate_id"], name: "idx_on_natdirectorate_id_d634f78c76"
  end

  create_table "minister_document_forward_directorates", force: :cascade do |t|
    t.text "description"
    t.bigint "minister_document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["minister_document_id"], name: "idx_on_minister_document_id_c96cbd202b"
  end

  create_table "minister_document_forward_natdirectorates", force: :cascade do |t|
    t.string "description"
    t.bigint "minister_document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "directorate_id", default: 1, null: false
    t.index ["directorate_id"], name: "idx_on_directorate_id_db0966b05c"
    t.index ["minister_document_id"], name: "idx_on_minister_document_id_d80112d671"
  end

  create_table "minister_document_natdirectorates", force: :cascade do |t|
    t.bigint "minister_document_forward_natdirectorate_id", null: false
    t.bigint "natdirectorate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["minister_document_forward_natdirectorate_id"], name: "idx_on_minister_document_forward_natdirectorate_id_70e5f42405"
    t.index ["natdirectorate_id"], name: "index_minister_document_natdirectorates_on_natdirectorate_id"
  end

  create_table "minister_documents", force: :cascade do |t|
    t.string "sender"
    t.string "subject"
    t.string "reference_number"
    t.string "document_source"
    t.integer "priority"
    t.integer "category"
    t.integer "status"
    t.integer "forward_status"
    t.string "attachment_document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by"
    t.bigint "constitutional_government_id", default: 1, null: false
    t.index ["constitutional_government_id"], name: "index_minister_documents_on_constitutional_government_id"
  end

  create_table "natdirectorates", force: :cascade do |t|
    t.string "natdircode"
    t.string "natdirname"
    t.bigint "directorate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["directorate_id"], name: "index_natdirectorates_on_directorate_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "complete_name"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_avatar"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "directorate_id", default: 1, null: false
    t.string "username"
    t.string "complete_name"
    t.integer "role"
    t.bigint "natdirectorate_id", default: 1, null: false
    t.bigint "department_id", default: 1, null: false
    t.string "name"
    t.string "user_avatar"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["directorate_id"], name: "index_users_on_directorate_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["natdirectorate_id"], name: "index_users_on_natdirectorate_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "archives", "directorates"
  add_foreign_key "archives", "natdirectorates"
  add_foreign_key "archives", "users"
  add_foreign_key "comment_document_dgs", "document_from_dgs"
  add_foreign_key "comment_document_dgs", "users"
  add_foreign_key "comment_document_dns", "document_from_dns"
  add_foreign_key "comment_document_dns", "users"
  add_foreign_key "comment_minister_documents", "minister_documents"
  add_foreign_key "comment_minister_documents", "users"
  add_foreign_key "departments", "directorates"
  add_foreign_key "departments", "natdirectorates"
  add_foreign_key "document_dg_department_units", "departments"
  add_foreign_key "document_dg_department_units", "document_dg_forward_department_units"
  add_foreign_key "document_dg_departments", "departments"
  add_foreign_key "document_dg_departments", "document_dg_forward_departments"
  add_foreign_key "document_dg_forward_department_units", "document_from_dgs"
  add_foreign_key "document_dg_forward_departments", "document_from_dgs"
  add_foreign_key "document_dg_forward_ministers", "directorates"
  add_foreign_key "document_dg_forward_ministers", "document_from_dgs"
  add_foreign_key "document_dg_forward_natdirectorates", "document_from_dgs"
  add_foreign_key "document_dg_natdirectorates", "document_dg_forward_natdirectorates"
  add_foreign_key "document_dg_natdirectorates", "natdirectorates"
  add_foreign_key "document_dn_departments", "departments"
  add_foreign_key "document_dn_departments", "document_dn_forward_departments"
  add_foreign_key "document_dn_forward_departments", "document_from_dns"
  add_foreign_key "document_from_dgs", "directorates"
  add_foreign_key "document_from_dns", "directorates"
  add_foreign_key "document_from_dns", "natdirectorates"
  add_foreign_key "job_applications", "job_lists"
  add_foreign_key "job_essential_criteria_responses", "job_applications"
  add_foreign_key "job_essential_critria_lists", "job_lists"
  add_foreign_key "minister_archives", "constitutional_governments"
  add_foreign_key "minister_document_department_units", "departments"
  add_foreign_key "minister_document_department_units", "minister_document_forward_department_units"
  add_foreign_key "minister_document_departments", "departments"
  add_foreign_key "minister_document_departments", "minister_document_forward_departments"
  add_foreign_key "minister_document_directorates", "directorates"
  add_foreign_key "minister_document_directorates", "minister_document_forward_directorates"
  add_foreign_key "minister_document_forward_department_units", "directorates"
  add_foreign_key "minister_document_forward_department_units", "minister_documents"
  add_foreign_key "minister_document_forward_departments", "minister_documents"
  add_foreign_key "minister_document_forward_departments", "natdirectorates"
  add_foreign_key "minister_document_forward_directorates", "minister_documents"
  add_foreign_key "minister_document_forward_natdirectorates", "directorates"
  add_foreign_key "minister_document_forward_natdirectorates", "minister_documents"
  add_foreign_key "minister_document_natdirectorates", "minister_document_forward_natdirectorates"
  add_foreign_key "minister_document_natdirectorates", "natdirectorates"
  add_foreign_key "minister_documents", "constitutional_governments"
  add_foreign_key "natdirectorates", "directorates"
  add_foreign_key "user_profiles", "users"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "directorates"
  add_foreign_key "users", "natdirectorates"
end
