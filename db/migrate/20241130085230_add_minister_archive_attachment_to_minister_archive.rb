class AddMinisterArchiveAttachmentToMinisterArchive < ActiveRecord::Migration[7.1]
  def change
    add_column :minister_archives, :minister_archive_attachment, :string
  end
end
