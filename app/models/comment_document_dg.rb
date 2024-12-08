class CommentDocumentDg < ApplicationRecord
  belongs_to :user
  belongs_to :document_from_dg
  validates :comment, presence: true
end
