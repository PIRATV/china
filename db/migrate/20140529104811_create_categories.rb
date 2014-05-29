class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category
      t.string :title
      t.string :category_url

      t.timestamps
    end
  end
end
