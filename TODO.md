# Todos

### Cleanups

#### Rename ::Server to App/Engine/or something

fix: rename ::Server  to something different e.g. App/Engine/etc.
use Server only for web server (e.g. Thin, Unicorn, Apache, etc.)

~~~
map '/db' do
  run PlutoAdmin::Server
end
~~~


make sure just 'pluto/admin' works; no need for "extra" 'pluto/admin/server'

boot.rb:

~~~
require 'pluto/admin'          ### fix: load pluto admin here (remove pluto/admin/server !!!)
require 'pluto/admin/server'   # note: pluto admin server app (requires extra require)
~~~

