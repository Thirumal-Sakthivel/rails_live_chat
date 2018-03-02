class CreateMessageRecipients < ActiveRecord::Migration[5.1]
  def change
    create_table :message_recipients do |t|
      t.integer :recipient_id
      t.integer :message_id
      t.integer :recipient_group_id

      t.timestamps
    end
  end
end
