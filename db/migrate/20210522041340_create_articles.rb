class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.string :meta_keywords
      t.text :meta_description
      t.text :content
      t.boolean :published
      t.integer :author_id

      t.timestamps
    end

    add_index :articles, :title
    add_index :articles, :slug, unique: true
    add_index :articles, :meta_keywords
    add_index :articles, :published
    add_foreign_key :articles, :users, column: 'author_id', primary_key: 'id'
  end
end
