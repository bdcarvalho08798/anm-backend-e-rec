class HomeController < ApplicationController
  before_action :set_directorate_id, only: %i[index ]
  before_action :set_goverment_constitutional, only: %i[index ]

  def index
    if (current_user&.minister? or current_user&.operator_minister?)
      @minister_documents = MinisterDocument.where(constitutional_government_id: @constitutional_government_id).order(created_at: :desc).limit(5)
      # @document_from_dgs = DocumentFromDg.order(created_at: :desc).limit(5)
      @document_from_dgs = DocumentFromDg
          .joins(:document_dg_forward_ministers)
          .where(document_dg_forward_ministers: { document_from_dg_id: DocumentFromDg.select(:id) })
          .distinct.order(created_at: :desc).limit(5)

    elsif (current_user&.operator_dg? or current_user&.directorate?)
      @minister_documents = MinisterDocument.joins(minister_document_forward_directorates: :minister_document_directorates)
         .where(minister_document_forward_directorates: {minister_document_id: MinisterDocument.select(:id)})
         .where(minister_document_directorates: {minister_document_forward_directorate_id: MinisterDocumentForwardDirectorate.select(:id)})
         .where(minister_document_directorates: {directorate_id: @directorate_id})
         .distinct.order(created_at: :desc).limit(5)
      
       @document_from_dgs = DocumentFromDg.where(directorate_id: @directorate_id).limit(5)
       @document_from_dns = DocumentFromDn.where(directorate_id: @directorate_id).limit(5)

    elsif (current_user&.operator_dn? or current_user&.natdirectorate?)
      @minister_documents = MinisterDocument.joins(minister_document_forward_natdirectorates: :minister_document_natdirectorates)
      .where(minister_document_forward_natdirectorates: {minister_document_id: MinisterDocument.select(:id)})
      .where(minister_document_natdirectorates: {minister_document_forward_natdirectorate_id: MinisterDocumentForwardNatdirectorate.select(:id)})
      .where(minister_document_natdirectorates: {natdirectorate_id: @natdirectorate_id})
      .distinct.order(created_at: :desc).limit(5)
      
      @document_from_dgs = DocumentFromDg.where(directorate_id: @directorate_id).limit(5)
      @document_from_dns = DocumentFromDn.where(directorate_id: @directorate_id).limit(5)

    elsif (current_user&.department? or current_user&.staff?)
      if @directorate_units.present?
        @minister_documents = MinisterDocument.joins(minister_document_forward_department_units: :minister_document_department_units)
         .where(minister_document_forward_department_units: {minister_document_id: MinisterDocument.select(:id)})
         .where(minister_document_department_units: {minister_document_forward_department_unit_id: MinisterDocumentForwardDepartmentUnit.select(:id)})
         .where(minister_document_department_units: {department_id: @department_id})
         .distinct.order(created_at: :desc).limit(5)
      else
      @minister_documents = MinisterDocument.joins(minister_document_forward_departments: :minister_document_departments)
         .where(minister_document_forward_departments: {minister_document_id: MinisterDocument.select(:id)})
         .where(minister_document_departments: {minister_document_forward_department_id: MinisterDocumentForwardDepartment.select(:id)})
         .where(minister_document_departments: {department_id: @department_id})
         .distinct.order(created_at: :desc).limit(5)
      end
      
      @document_from_dgs = DocumentFromDg.where(directorate_id: @directorate_id).limit(5)
      @document_from_dns = DocumentFromDn.where(directorate_id: @directorate_id).limit(5)
    
    else
      @document_from_dgs = DocumentFromDg.where(directorate_id: @directorate_id).limit(5)
      @document_from_dns = DocumentFromDn.where(directorate_id: @directorate_id).limit(5)
    end

  end

  private
  def set_directorate_id
    @directorate_id = current_user.directorate_id
    @natdirectorate_id = current_user.natdirectorate_id
    @department_id = current_user.department_id
    @directorate_units = Directorate.where(id: @directorate_id ,unit: true)
  end

  def set_goverment_constitutional
    @constitutional_government_id = ConstitutionalGovernment.find_by(active: true)
  end 
end
