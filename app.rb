require_relative "config/settings"
require_relative "shotgun"

Cuba.use Rack::Session::Cookie,
  key: "tarphero",
  secret: "askdfjsfjlaksjflkasjflaskjflasdfj"

Cuba.plugin Cuba::Mote
Cuba.plugin Cuba::TextHelpers
Cuba.plugin Cuba::With
Cuba.plugin Shield::Helpers

Dir["./{lib,services,workflows,models,routes}/**/*.rb"].each {|rb| require rb}

Cuba.use Rack::Static,
  urls: ["/font", "/css", "/img", "/js"],
  root: "./public"

Cuba.plugin Helpers
Cuba.plugin Routes::Helpers

Cuba.define do
  persist_session!

  on root do
    render "home", {}, "layouts/layout"
  end

  on "jobs" do
    run Routes::Jobs
  end

  on "images" do
    run Routes::Images
  end

end

