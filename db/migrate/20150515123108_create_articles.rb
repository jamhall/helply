class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :summary, length: 150
      t.string :slug, null: false
      t.datetime :published_at, default: nil
      t.timestamps null: false
      t.belongs_to :topic, index: true
      t.integer :impressions_count, :default => 0
    end
    add_index :articles, :slug, unique: true
  end
end
