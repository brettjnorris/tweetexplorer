class AddSourceJsonToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :source_json, :jsonb
  end
end
