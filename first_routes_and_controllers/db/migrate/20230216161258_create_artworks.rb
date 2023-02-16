class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.text :title, null: false
      t.string :image_url, null: false, unique: true
      t.references :artist, null: false, index: true, foreign_key: {to_table: :users}
      t.timestamps
      
    end
    add_index :artworks, [:artist_id, :title], unique: true
  end
end
