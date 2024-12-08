class CommentDocumentDn < ApplicationRecord
  belongs_to :user
  belongs_to :document_from_dn
  validates :comment, presence: true
end
