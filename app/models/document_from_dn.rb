class DocumentFromDn < ApplicationRecord
  # belongs_to :directorate
  belongs_to :natdirectorate
  has_many :document_dn_forward_departments
  has_many :comment_document_dns, dependent: :destroy

  mount_uploader :attachment_doc_dn, AttachmentDocDnUploader

  enum priority: [:Important, :Urgent,  :Normal]
  after_initialize :set_default_priority, :if => :new_record?
  def set_default_priority
    self.priority ||= :Normal
  end

  enum category: [:Parecer, :Memorandum,  :Proposta, :Ofisiu, :Info]
  after_initialize :set_default_category, :if => :new_record?
  def set_default_category
    self.category ||= :Parecer
  end
  
  enum status: [:'0', :'25',  :'50', :'75', :'100']
  after_initialize :set_default_status, :if => :new_record?
  def set_default_status
    self.status ||= :'0'
  end

  enum forwardstatus: [:'natdirectorate', :'department',  :'section']
  after_initialize :set_default_forwardstatus, :if => :new_record?
  def set_default_forwardstatus
    self.forwardstatus ||= :natdirectorate
  end

  enum document_source: [:'internal',  :'external']
  after_initialize :set_default_document_source, :if => :new_record?
  def set_default_document_source
    self.document_source ||= :internal
  end

  def self.ransackable_attributes(_auth_object = nil)
    [
      "sender",
      "subject",
      "reference_number",
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["comment_document_dns", "natdirectorate"]
  end



end
