class MinisterArchive < ApplicationRecord
  belongs_to :constitutional_government

  mount_uploader :minister_archive_attachment, MinisterArchiveAttachmentUploader
  
  enum document_type: [:Parecer, :Memorandum,  :Proposta, :Ofisiu, :Info]
  after_initialize :set_default_document_type, :if => :new_record?
  def set_default_document_type
    self.document_type ||= :Parecer
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "document_number", "document_title", "document_type"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["constitutional_government"]
  end


end
