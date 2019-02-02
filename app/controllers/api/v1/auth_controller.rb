class Api::V1::AuthController < ApplicationController

  def login
    query_params={
      client_id: '2bb803854dae4494a2598e2fab28a489',
      response_type: 'code',
      redirect_uri: "http://localhost:3001/callback",
scope: "user-library-read user-library-modify playlist-modify-public user-top-read playlist-modify-public user-modify-playback-state user-follow-modify user-read-currently-playing user-read-playback-state user-follow-read app-remote-control streaming user-read-birthdate user-read-email user-read-private",
      show_dialog: true
    }

    url = "https://accounts.spotify.com/authorize/"

    redirect_to "#{url}?#{query_params.to_query}"
  end

  def verify
    render json: current_user
  end
end
