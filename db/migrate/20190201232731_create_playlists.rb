class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :spotify_id
      t.string :uri
      t.string :href
      t.string :device_id

      t.timestamps
    end
  end
end
