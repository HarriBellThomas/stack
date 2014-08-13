class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title  #column 'title' of type string
      t.string :description
      t.string :url
      t.timestamps
    end
  end
end