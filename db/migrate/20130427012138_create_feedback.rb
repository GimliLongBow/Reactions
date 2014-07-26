class CreateFeedback < ActiveRecord::Migration
  def change
    create_table :feedback do |t|
      t.integer :rating
      t.text :comment
      t.references :user
      t.timestamps
    end
  end
end
