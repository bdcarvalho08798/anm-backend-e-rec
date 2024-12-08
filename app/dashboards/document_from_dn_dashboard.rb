require "administrate/base_dashboard"

class DocumentFromDnDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    attachment_doc_dn: Field::String,
    category: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    comment_document_dns: Field::HasMany,
    directorate_id: Field::Number,
    document_dn_forward_departments: Field::HasMany,
    document_source: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    forwardstatus: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    natdirectorate: Field::BelongsTo,
    priority: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    reference_number: Field::String,
    sender: Field::String,
    status: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    subject: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    attachment_doc_dn
    category
    comment_document_dns
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    attachment_doc_dn
    category
    comment_document_dns
    directorate_id
    document_dn_forward_departments
    document_source
    forwardstatus
    natdirectorate
    priority
    reference_number
    sender
    status
    subject
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    attachment_doc_dn
    category
    comment_document_dns
    directorate_id
    document_dn_forward_departments
    document_source
    forwardstatus
    natdirectorate
    priority
    reference_number
    sender
    status
    subject
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how document from dns are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(document_from_dn)
  #   "DocumentFromDn ##{document_from_dn.id}"
  # end
end
