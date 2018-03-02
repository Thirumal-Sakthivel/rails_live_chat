class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :sender_id
      t.integer :status

      t.timestamps
    end
  end
end
