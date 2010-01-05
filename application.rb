require File.join(File.expand_path(File.dirname(__FILE__)), 'vendor', 'gems', 'environment')

Bundler.require_env(:app)

# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'junior', 'lib'))
# 
# require 'junior'
# require 'haml'
# require 'do_sqlite3'
# require 'dm-core'
# require 'dm-types'
# require 'dm-timestamps'

module Routes
  def self.routes
    Junior::Usher.routes do

      # TODO: create nested resources
      # resources :posts do
      #   resources :comments
      # end

      resources :posts
      resources :users

      get '/',            { :controller => :hello, :action => :index }
      get '/hello',       { :controller => :hello, :action => :index }
      get '/hello/world', { :controller => :hello, :action => :world }
    end
  end
end

class MyApplication < Junior::Application
  
  use Rack::Static, :urls => [ '/favicon.ico', '/css', '/js', '/images' ], :root => 'public'
  use Rack::Session::Cookie, :key => 'hello_junior'
  use Rack::MethodOverride
  use Rack::Deflater
  use Rack::ETag
  use Junior::Router, Routes.routes
  use Rack::Lint
  
  Dir.glob(File.join(File.dirname(__FILE__), 'controllers/*.rb')).each { |f| require f }
  Dir.glob(File.join(File.dirname(__FILE__), 'models/*.rb')).each { |f| require f }
  
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3:junior.db')
  
  DataMapper.auto_upgrade!
end

