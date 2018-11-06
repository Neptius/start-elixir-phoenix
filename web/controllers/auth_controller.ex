defmodule Discuss.AuthController do
  use Discuss.Web, :controller

  import Plug.Conn


  def callback(conn, _params) do
    steamid = get_session(conn, :steamex_steamid64)
    steamApiKey = Application.get_env(:discuss, :API_STEAM_KEY)
    url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{steamApiKey}&steamids=#{steamid}"
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end

    # IO.inspect("+++++++++++")
    # IO.inspect(result)
    # IO.inspect("+++++++++++")

  end
end
