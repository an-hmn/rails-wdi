class JoelIsAnIdiot < ActiveRecord::Migration
  def change
    add_column :recipes, :image, :text
  end
end
