class MinisterDocumentDepartment < ApplicationRecord
  belongs_to :department
  belongs_to :minister_document_forward_department
end
