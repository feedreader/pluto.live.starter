# encoding: utf-8

require './config/boot'

map '/' do

  run Planet

  map '/db' do
    ### fix/todo: rename ::Server  to something different e.g. App/Engine/etc. use Server only for web server (e.g. Thin, Unicorn, Apache, etc.)
    run PlutoAdmin::Server
  end

end
