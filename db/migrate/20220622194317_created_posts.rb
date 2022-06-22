class CreatedPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :created_date
      t.text :author
      t.text :content

      t.timestamps
    end 
  end
end
