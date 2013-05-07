class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.text :description
      t.references :album
      t.string :image
      t.string :thumbnail
    end
  end
end
