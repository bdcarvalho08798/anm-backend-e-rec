class MinisterDocumentDepartmentUnit < ApplicationRecord
  belongs_to :minister_document_forward_department_unit
  belongs_to :department
end
