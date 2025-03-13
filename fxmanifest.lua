fx_version 'cerulean'
game 'gta5'

name 'ox_repairkit'
author 'thats_johnny'
description 'Repairkit item with ox_target'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_script 'client.lua'
server_script 'server.lua'

files {
    'locales/*.json'
}

dependencies {
    'ox_lib',
    'ox_inventory',
    'ox_target'
}

lua54 'yes'