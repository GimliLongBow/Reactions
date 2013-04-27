class CreateFeedback < ActiveRecord::Migration
  def change
    create_table :feedback do |t|
      t.string :description
      t.integer :rating
      t.string :client_email
      t.integer :user_id

      t.timestamps
    end

    add_index :feedback, :user_id
  end
end
