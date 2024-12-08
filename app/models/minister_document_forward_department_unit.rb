class MinisterDocumentForwardDepartmentUnit < ApplicationRecord
  belongs_to :minister_document
  belongs_to :directorate
  has_many :minister_document_department_units
  accepts_nested_attributes_for :minister_document_department_units, reject_if: :all_blank, allow_destroy: true
end
