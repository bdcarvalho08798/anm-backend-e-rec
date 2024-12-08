class DocumentDnForwardDepartment < ApplicationRecord
    belongs_to :document_from_dn
    
    has_many :document_dn_departments
    accepts_nested_attributes_for :document_dn_departments, reject_if: :all_blank, allow_destroy: true
end
