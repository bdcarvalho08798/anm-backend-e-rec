require "administrate/base_dashboard"

class MinisterDocumentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    attachment_document: Field::String,
    category: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    comment_minister_documents: Field::HasMany,
    constitutional_government: Field::BelongsTo,
    created_by: Field::Number,
    creator: Field::BelongsTo,
    document_source: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    forward_status: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    minister_document_department_units: Field::HasMany,
    minister_document_departments: Field::HasMany,
    minister_document_directorates: Field::HasMany,
    minister_document_forward_department_units: Field::HasMany,
    minister_document_forward_departments: Field::HasMany,
    minister_document_forward_directorates: Field::HasMany,
    minister_document_forward_natdirectorates: Field::HasMany,
    minister_document_natdirectorates: Field::HasMany,
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
    attachment_document
    category
    comment_minister_documents
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    attachment_document
    category
    comment_minister_documents
    constitutional_government
    created_by
    creator
    document_source
    forward_status
    minister_document_department_units
    minister_document_departments
    minister_document_directorates
    minister_document_forward_department_units
    minister_document_forward_departments
    minister_document_forward_directorates
    minister_document_forward_natdirectorates
    minister_document_natdirectorates
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
    attachment_document
    category
    comment_minister_documents
    constitutional_government
    created_by
    creator
    document_source
    forward_status
    minister_document_department_units
    minister_document_departments
    minister_document_directorates
    minister_document_forward_department_units
    minister_document_forward_departments
    minister_document_forward_directorates
    minister_document_forward_natdirectorates
    minister_document_natdirectorates
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

  # Overwrite this method to customize how minister documents are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(minister_document)
  #   "MinisterDocument ##{minister_document.id}"
  # end
end
