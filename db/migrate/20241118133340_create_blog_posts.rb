class CreateBlogPosts < ActiveRecord::Migration[7.2]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :string
      t.text :body

      t.timestamps
    end
  end
end
