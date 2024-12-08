class DocumentDgDepartment < ApplicationRecord
  belongs_to :document_dg_forward_department
  belongs_to :department
end
