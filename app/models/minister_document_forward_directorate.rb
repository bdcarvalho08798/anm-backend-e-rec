class MinisterDocumentForwardDirectorate < ApplicationRecord
  belongs_to :minister_document
  has_many :minister_document_directorates
  accepts_nested_attributes_for :minister_document_directorates, reject_if: :all_blank, allow_destroy: true
end
