class DocumentDgForwardNatdirectorate < ApplicationRecord
  belongs_to :document_from_dg

  has_many :document_dg_natdirectorates
  accepts_nested_attributes_for :document_dg_natdirectorates, reject_if: :all_blank, allow_destroy: true
end
