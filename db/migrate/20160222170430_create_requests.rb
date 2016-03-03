class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user, index: true, foreign_key: true
      t.string :content
      t.string :book_name
      t.string :author
      t.string :image
      t.string :url
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
