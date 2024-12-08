class Directorate < ApplicationRecord
    has_many :document_dg_forward_ministers
    has_many :users
end
