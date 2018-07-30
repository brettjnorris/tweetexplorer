class RenameActivityTypeToObjectType < ActiveRecord::Migration[5.2]
  def change
    rename_column :activities, :type, :object_type
  end
end
