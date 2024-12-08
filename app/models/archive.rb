class Archive < ApplicationRecord
  belongs_to :directorate
  belongs_to :natdirectorate
  belongs_to :user

  mount_uploader :attachment_doc, AttachmentDocArchiveUploader


  enum prioroty: [:Important, :Urgent,  :Normal]
  after_initialize :set_default_prioroty, :if => :new_record?
  def set_default_prioroty
    self.prioroty ||= :Normal
  end

  enum category: [:Diretriz, :Instrusaun, :Treinamentu, :Literasia, :Parecer, :Memorandum, :Proposta, :Ofisiu]
  after_initialize :set_default_category, :if => :new_record?
  def set_default_category
    self.category ||= :Ofisiu
  end
  
  enum status: [:'0', :'25',  :'50', :'75', :'100']
  after_initialize :set_default_status, :if => :new_record?
  def set_default_status
    self.status ||= :'0'
  end

  def self.ransackable_attributes(_auth_object = nil)
    [
      "author",
      "title",
      "reference_number",
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["directorate", "natdirectorate"]
  end


end
