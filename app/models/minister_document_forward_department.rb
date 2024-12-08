class MinisterDocumentForwardDepartment < ApplicationRecord
  belongs_to :minister_document
  belongs_to :natdirectorate
  has_many :minister_document_departments
  accepts_nested_attributes_for :minister_document_departments, reject_if: :all_blank, allow_destroy: true
end
