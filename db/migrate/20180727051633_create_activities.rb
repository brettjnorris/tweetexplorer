class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :author_id
      t.string :author_name
      t.string :message
      t.string :message_id
      t.string :provider
      t.string :type
      t.string :link
      t.boolean :sent
      t.float :posted_at
      t.float :created_at
    end
  end
end
