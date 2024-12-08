class DocumentDgDepartmentUnit < ApplicationRecord
  belongs_to :department
  belongs_to :document_dg_forward_department_unit
end
