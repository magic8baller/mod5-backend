class Api::V1::PermissionController < ApplicationController

  def new
    query_params={
      client_id: '2bb803854dae4494a2598e2fab28a489',
      response_type: 'code',
      redirect_uri: "http://localhost:3001/callback",
      scope: "playlist-modify-public playlist-modify-private",
      show_dialog: true
    }

    url = "https://accounts.spotify.com/authorize/"
    redirect_to "#{url}?#{query_params.to_query}"
  end

  def create
    if params[:error]
      puts "error!!!!", params
      redirect_to "https://localhost:3001"
    else
      body = {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: "http://localhost:3001/callback",
        client_id: '2bb803854dae4494a2598e2fab28a489',
        client_secret: 'cca17d91730b4f4badea7e9b5f568f3f'
      }

      auth_response = RestClient.post('https://accounts.spotify.com/api/token', body)
      auth_params = JSON.parse(auth_response.body)

      header = { Authorization: "Bearer #{auth_params["access_token"]}" }
      user_response = RestClient.get('https://api.spotify.com/v1/me', header)
      user_params = JSON.parse(user_response.body)

      @user = User.find_or_create_by(spotify_user_id: user_params["id"])
      @user.update(access_token: auth_params["access_token"], refresh_token: auth_params["refresh_token"])
      @user.refresh_token

      payload = { user_id: @user.id }
      token = issue_token(payload)
      render json: {user: @user, jwt: token}
    end
  end

end
