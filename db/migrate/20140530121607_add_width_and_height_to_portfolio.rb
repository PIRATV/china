class AddWidthAndHeightToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :width, :integer
    add_column :portfolios, :height, :integer
  end
end
