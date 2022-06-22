class CreatedComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :created_date
      t.text :content
      t.string :post_id

      t.timestamps
    end 
  end
end
