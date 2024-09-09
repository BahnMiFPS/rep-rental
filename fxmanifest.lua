fx_version "cerulean"
description "Rep Rental"
author "Q4D + BahnMiFPS"
version '2.0.0'

lua54 'yes'

games { "gta5", "rdr3" }

ui_page 'web/build/index.html'

client_scripts { "client/**/*" }

shared_scripts { '@ox_lib/init.lua', 'config.lua'}

server_script "server/**/*"

files { 'web/build/index.html', 'web/build/**/*', 'locales/*.json' }
