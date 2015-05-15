class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :summary,  length: 150
      t.timestamps null: false
      t.belongs_to :topic, index: true
    end
  end
end
