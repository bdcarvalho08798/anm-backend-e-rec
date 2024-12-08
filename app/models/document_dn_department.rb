class DocumentDnDepartment < ApplicationRecord
  belongs_to :document_dn_forward_department
  belongs_to :department
end
