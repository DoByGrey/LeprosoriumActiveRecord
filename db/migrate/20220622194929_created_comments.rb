class CreatedComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.text :content

      t.timestamps
    end 
  end
end
