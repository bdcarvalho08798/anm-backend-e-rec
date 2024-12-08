# README

*  ```
source ~/.rvm/scripts/rvm
export PATH="$HOME/.rvm/bin:$PATH"
source ~/.bashrc  # or ~/.zshrc
rvm use 3.2.3

```

rails g migration add_minister_archive_attachment_to_minister_archive minister_archive_attachment


=======================================================================================
create_table "job_applications", force: :cascade do |t|

t.integer "job_id"

t.string "resume"

t.datetime "created_at", null: false

t.datetime "updated_at", null: false

t.string "email"

t.integer "job_list_id"

t.string "diplomadegree"

t.string "transcriptdegree"
end

=======================================================================================


create_table "job_essential_criteria_responses", force: :cascade do |t|

t.integer "job_application_id"

t.string "response"

t.datetime "created_at", null: false

t.datetime "updated_at", null: false

t.integer "job_essential_critria_list_id"
end
=======================================================================================

rails g model job_essential_critria_list job_list:references name

create_table "job_essential_critria_lists", force: :cascade do |t|

t.integer "job_list_id"

t.string "name"

t.datetime "created_at", null: false

t.datetime "updated_at", null: false

t.integer "job_application_id"
end
=======================================================================================


create_table "job_lists", force: :cascade do |t|

t.string "title"

t.date "deadline"

t.text "description"

t.datetime "created_at", null: false

t.datetime "updated_at", null: false
=======================================================================================



















=======================================================================================