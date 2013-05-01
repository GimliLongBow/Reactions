class CreateFeedback < ActiveRecord::Migration
  def change
    create_table :feedback do |t|
      t.integer :rating
      t.text :comment
      t.integer :user_id
      t.timestamps
    end

    add_index :feedback, :user_id
  end
end
