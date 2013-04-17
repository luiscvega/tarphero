require_relative "config/settings"
require_relative "shotgun"

Cuba.use Rack::Session::Cookie,
  key: "tarphero",
  secret: "askdfjsfjlaksjflkasjflaskjflasdfj"

Cuba.plugin Cuba::Mote
Cuba.plugin Cuba::TextHelpers
Cuba.plugin Cuba::With

Dir["./{lib,services,workflows,models,routes}/**/*.rb"].each {|rb| require rb}

Cuba.use Rack::Static,
  urls: ["/font", "/css", "/img", "/js"],
  root: "./public"

Cuba.plugin Helpers
Cuba.plugin TimeHelpers
Cuba.plugin Routes::Helpers

Cuba.define do
  persist_session!

  on root do
  end

  on default do
    res.status = 404

    guest_render "404", title: "Not Found"
  end

end

