defmodule Discuss.Router do
  use Discuss.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  steamex_route_auth

  scope "/", Discuss do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", TopicController, :index)
    get("/topics/new", TopicController, :new)
    post("/topics", TopicController, :create)
    get("/topics/:id/edit", TopicController, :edit)
    put("/topics/:id", TopicController, :update)
    delete("/topics/:id", TopicController, :delete)

    # resources("/topics", TopicController)

    get("/steam/callback", AuthController, :callback)
  end

  # scope "/auth", Discuss do
  #   pipe_through(:browser)
  #
  #  get("/:provider", AuthController, :request)
  #  get("/:provider/callback", AuthController, :callback)
  # end

  # steamex_route_auth()

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end
