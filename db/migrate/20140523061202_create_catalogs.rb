class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :path, default: ''
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
