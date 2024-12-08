class DocumentFromDg < ApplicationRecord
  belongs_to :directorate
  has_many :document_dg_forward_natdirectorates
  has_many :document_dg_forward_departments
  has_many :document_dg_forward_department_units
  has_many :comment_document_dgs, dependent: :destroy
  has_many :document_dg_natdirectorates, through: :document_dg_forward_natdirectorates
  has_many :document_dg_departments, through: :document_dg_forward_departments
  has_many :document_dg_department_units, through: :document_dg_forward_department_units

  has_many :document_dg_forward_ministers

  mount_uploader :attachment_doc_dg, AttachmentDocDgUploader


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

  enum forwardstatus: [:'directorate',:'natdirectorate', :'department',  :'section']
  after_initialize :set_default_forwardstatus, :if => :new_record?
  def set_default_forwardstatus
    self.forwardstatus ||= :directorate
  end

  enum document_source: [:'internal', :'external']
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
    ["comment_document_dgs", "directorate", "document_dg_forward_natdirectorates"]
  end

  # self.per_page = 10
  
end
