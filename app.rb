require 'bundler'
Bundler.require

# on importe les class
require_relative 'lib/router'
# require_relative 'lib/controller'
# require_relative 'lib/gossip'
# require_relative 'lib/router'
# require_relative 'lib/view'

# on lance l'app automatiquement avec la class Router
Router.new.perform