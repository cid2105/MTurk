class AddTitleToHits < ActiveRecord::Migration
  def change
    add_column :hits, :title, :text
  end
end
