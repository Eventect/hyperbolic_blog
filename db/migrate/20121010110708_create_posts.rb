class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.boolean :published
      t.date :published_at
      t.text :body
      t.string :permalink

      t.timestamps
    end
  end
end
