class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :photo_url, default: '', null: true
      t.string :video_url, default: '', null: true
      t.string :title, default: '', null: true
      t.boolean :status, default: true
      t.integer :width, default: 0
      t.integer :height, default: 0
      t.belongs_to :user

      t.timestamps
    end
  end
end
