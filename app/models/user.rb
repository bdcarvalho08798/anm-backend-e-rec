class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comment_document_dgs
  has_one :user_profile
  belongs_to :directorate
  belongs_to :natdirectorate
  belongs_to :department

  mount_uploader :user_avatar, UserAvatarUploader

  

  enum role: [:staff, :operator_dg, :operator_dn, :directorate, :natdirectorate, :department, :minister, :operator_minister, :admin, :superadmin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :staff
  end

  def allowed_minister_document_ids
    # @directorate_id = current_user.directorate_id
    ids_from_forward_directorate = MinisterDocumentForwardDirectorate.pluck(:minister_document_id)
    ids_from_directorate = MinisterDocumentDirectorate.where(directorate_id: directorate_id).pluck(:minister_document_forward_directorate_id)
    (ids_from_forward_directorate + ids_from_directorate).uniq
  end

  def allowed_dg_document_by_operator_minister_ids
    ids_from_doc_dg_forward_minister = DocumentDgForwardMinister.pluck(:document_from_dg_id)
    (ids_from_doc_dg_forward_minister).uniq
  end

  def allowed_minister_document_by_operator_dn_ids
    ids_from_doc_minister_forward_natdir = MinisterDocumentForwardNatdirectorate.pluck(:minister_document_id)
    # ids_from_natdirectorate = MinisterDocumentNatdirectorate.where(natdirectorate_id: natdirectorate_id).pluck(:minister_document_forward_natdirectorate_id)
    (ids_from_doc_minister_forward_natdir ).uniq
  end

  def allowed_minister_document_by_deps_ids
    ids_from_doc_minister_forward_deps = MinisterDocumentForwardDepartment.pluck(:minister_document_id)
    ids_from_doc_minister_forward_depUnits = MinisterDocumentForwardDepartmentUnit.pluck(:minister_document_id)
    (ids_from_doc_minister_forward_deps + ids_from_doc_minister_forward_depUnits ).uniq
  end


       
end
