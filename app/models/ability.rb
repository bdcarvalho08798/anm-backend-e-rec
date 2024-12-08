# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.operator_minister?
      can :manage, MinisterDocument, created_by: user.id
      can :manage, UserProfile, user_id: user.id
      can :manage, DocumentFromDg, id: user.allowed_dg_document_by_operator_minister_ids
      can :manage, MinisterArchive

    elsif user.minister?
        # can :read, MinisterDocument
        can :manage, UserProfile, user_id: user.id
        can :manage, User, id: user.id
        can :read, MinisterArchive
        can :update, MinisterArchive
    
    elsif user.directorate?
      can :read, :DashboardDirectorate
      can :manage, :CommentDocumentDg
      can :read, DocumentFromDg,  directorate_id: user.directorate_id
      can :manage, UserProfile, user_id: user.id
      can :manage, User, id: user.id
      can :manage, Archive, user_id: user.id
      can :read, Archive, directorate_id: user.directorate_id

    elsif user.natdirectorate?
      can :read, :DashboardNatdirectorate
      can :manage, :CommentDocumentDg
      can :manage, DocumentFromDg,  directorate_id: user.directorate_id
      can :manage, UserProfile, user_id: user.id
      can :manage, User, id: user.id
      can :manage, Archive, user_id: user.id
      can :read, Archive, directorate_id: user.directorate_id
      
    elsif user.operator_dg?
      can :manage, DocumentFromDg,  directorate_id: user.directorate_id
      can :manage, MinisterDocument, id: user.allowed_minister_document_ids
      can :manage, UserProfile, user_id: user.id
      can :manage, User, id: user.id
      can :manage, Archive, user_id: user.id
      can :read, Archive, directorate_id: user.directorate_id

    elsif user.operator_dn?
      can :manage, DocumentFromDn, natdirectorate_id: user.natdirectorate_id
      can :manage, DocumentFromDg, directorate_id: user.directorate_id
      can :manage, MinisterDocument, id: user.allowed_minister_document_by_operator_dn_ids
      can :manage, UserProfile, user_id: user.id
      can :manage, User, id: user.id
      can :manage, Archive, user_id: user.id
      can :read, Archive, directorate_id: user.directorate_id

    elsif user.department?
      can :manage, DocumentFromDn, natdirectorate_id: user.natdirectorate_id
      can :manage, DocumentFromDg, directorate_id: user.directorate_id
      can :manage, UserProfile, user_id: user.id
      can :manage, MinisterDocument, id: user.allowed_minister_document_by_deps_ids
      can :manage, User, id: user.id
      can :manage, Archive, user_id: user.id
      can :read, Archive, directorate_id: user.directorate_id


    elsif user.staff?
      can :manage, DocumentFromDn, natdirectorate_id: user.natdirectorate_id
      can :manage, DocumentFromDg, directorate_id: user.directorate_id
      can :manage, MinisterDocument, id: user.allowed_minister_document_by_deps_ids
      can :manage, UserProfile, user_id: user.id
      can :manage, User, id: user.id
      can :manage, Archive, user_id: user.id
      can :read, Archive, directorate_id: user.directorate_id

    elsif user.admin?
        can :manage, User
        can :manage, ConstitutionalGovernment
        can :manage, Directorate 
        can :manage, Natdirectorate
        can :manage, Department
        can :manage, User, id: user.id
        can :manage, Archive, user_id: user.id
     

    elsif user.superadmin?
      can :manage, :all
      # can :manage, :dbadmin
    end
  end
end
