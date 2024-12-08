class MinisterDocumentForwardNatdirectorate < ApplicationRecord
  belongs_to :minister_document
  has_many :minister_document_natdirectorates
  accepts_nested_attributes_for :minister_document_natdirectorates, reject_if: :all_blank, allow_destroy: true
end
