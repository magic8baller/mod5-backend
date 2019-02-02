class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artists
      t.string :uri
      t.string :duration_ms
      t.string :spotify_id
      t.integer :playlist_id
      t.boolean :queued

      t.timestamps
    end
  end
end
