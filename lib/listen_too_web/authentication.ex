defmodule ListenTooWeb.Authentication do

  def get_token() do
    headers = [
      {"Authorization", "Basic #{Application.get_env(:listen_too, :spotify_app_token)}"},
      {"Content-Type", "application/x-www-form-urlencoded"}
    ]

    request_body =
      URI.encode_query(%{
        "grant_type" => "client_credentials"
      })

    case HTTPoison.post("https://accounts.spotify.com/api/token", request_body, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        %{"access_token" => token} = Jason.decode!(body)

        # {"access_token":"BQDZiu7nRFKfcqAf7ZVjVf_3f-cOdwS3zJCwCdn5Bc7W9r59bemfqO7A8SEIM2vg-XXryQ3Ed3u9dBfDZDE","token_type":"Bearer","expires_in":3600,"scope":""}
        token

      {:ok, %HTTPoison.Response{status_code: 404, body: body}} ->
        IO.puts(body)

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end
end
