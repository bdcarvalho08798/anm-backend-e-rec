class DocumentDgForwardDepartmentUnit < ApplicationRecord
  belongs_to :document_from_dg

  has_many :document_dg_department_units
  accepts_nested_attributes_for :document_dg_department_units, reject_if: :all_blank, allow_destroy: true
  
end
