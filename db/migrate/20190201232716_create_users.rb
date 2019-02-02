class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :display_name
      t.string :username
      t.boolean :logged_in
      t.string :profile_img_url
      t.string :spotify_id
      t.string :spotify_url
      t.string :href
      t.string :profile_image
      t.string :uri
      t.string :access_token
      t.string :refresh_token

      t.timestamps
    end
  end
end
