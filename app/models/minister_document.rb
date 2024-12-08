class MinisterDocument < ApplicationRecord

  belongs_to :creator, class_name: 'User', foreign_key: 'created_by', optional: true
  belongs_to :constitutional_government

  # before_create :set_creator

  mount_uploader :attachment_document, AttachmentDocumentUploader

  has_many :comment_minister_documents, dependent: :destroy

  has_many :minister_document_forward_directorates
  has_many :minister_document_directorates, through: :minister_document_forward_directorates
  has_many :minister_document_forward_natdirectorates
  has_many :minister_document_natdirectorates, through: :minister_document_forward_natdirectorates
  has_many :minister_document_forward_departments
  has_many :minister_document_departments, through: :minister_document_forward_departments
  has_many :minister_document_forward_department_units
  has_many :minister_document_department_units, through: :minister_document_forward_department_units

  enum priority: [:Important, :Urgent,  :Normal]
  after_initialize :set_default_priority, :if => :new_record?
  def set_default_priority
    self.priority ||= :Normal
  end

  enum category: [:Despasu, :Parecer, :Memorandum,  :Proposta, :Ofisiu, :Info]
  after_initialize :set_default_category, :if => :new_record?
  def set_default_category
    self.category ||= :Despasu
  end
  
  enum status: [:'0', :'25',  :'50', :'75', :'100']
  after_initialize :set_default_status, :if => :new_record?
  def set_default_status
    self.status ||= :'0'
  end

  enum forward_status: [:'minister', :'directorate',:'natdirectorate', :'department',  :'section']
  after_initialize :set_default_forward_status, :if => :new_record?
  def set_default_forward_status
    self.forward_status ||= :minister
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
    ["comment_minister_documents"]
  end
  # private 
  # def set_creator
  #   self.created_by ||= Current.user.id if Current.user  # Set only if `created_by` is nil
  # end


end
