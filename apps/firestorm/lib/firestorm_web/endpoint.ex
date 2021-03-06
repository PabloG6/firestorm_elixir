defmodule FirestormWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :firestorm
  use Absinthe.Phoenix.Endpoint

  socket("/socket", FirestormWeb.UserSocket,
    websocket: true,
    longpoll: false
  )

  plug(Corsica,
    origins: "*",
    allow_headers: [
      "authorization",
      "content-type"
    ]
  )

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug(Plug.Static,
    at: "/",
    from: :firestorm,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)
  )

  plug(
    Plug.Static,
    at: "/torch",
    from: {:torch, "priv/static"},
    gzip: true,
    cache_control_for_etags: "public, max-age=86400",
    headers: [{"access-control-allow-origin", "*"}]
  )

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket("/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket)
    plug(Phoenix.LiveReloader)
    plug(Phoenix.CodeReloader)
  end

  plug(Plug.RequestId)
  plug(Plug.Logger)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug(Plug.Session,
    store: :cookie,
    key: "_firestorm_key",
    signing_salt: "aOGGPR01"
  )

  plug(FirestormWeb.Router)
end
