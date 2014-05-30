class CreatePortfolios < ActiveRecord::Migration
  def change
    drop_table :portfolios if table_exists? :portfolios
    create_table :portfolios do |t|
      t.integer :user_id
      t.string :image
      t.string :video
      t.string :title

      t.timestamps
    end
  end
end
