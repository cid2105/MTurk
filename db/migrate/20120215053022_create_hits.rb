class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.integer :assignments
      t.text :description
      t.float :reward
      t.integer :min_approval_rate
      t.integer :max_approval_rate
      t.string :url
      t.string :question

      t.timestamps
    end
  end
end
