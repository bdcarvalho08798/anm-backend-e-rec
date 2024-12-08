class CommentMinisterDocument < ApplicationRecord
  belongs_to :user
  belongs_to :minister_document
  validates :comment, presence: true
end
