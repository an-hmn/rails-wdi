class CreateTables < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :nationality
      t.date :dob
      t.string :period
      t.text :image
      t.timestamps
    end

    create_table :paintings do |t|
      t.string :title
      t.string :year
      t.string :medium
      t.string :style
      t.text :image
      t.timestamps
    end
  end
end
