class CreatePictures < ActiveRecord::Migration[5.2]
  def change
     create_table :pictures do |t|
      t.string :imageable_type
      t.integer :imagaeable_id
      t.references :imageable, polymorphic: true
      t.timestamps
    end
  end
end