class MinisterDocumentDirectorate < ApplicationRecord
  belongs_to :directorate
  belongs_to :minister_document_forward_directorate
end
