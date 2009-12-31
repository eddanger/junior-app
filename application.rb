require File.join(File.expand_path(File.dirname(__FILE__)), 'vendor', 'gems', 'environment')

Bundler.require_env(:app)

class MyApplication < Junior::Application

  use Rack::Session::Cookie, :key => 'hello_junior'
  use Rack::Deflater
  #use Rack::ETag
  use Rack::Lint
  
  Dir.glob(File.join(File.dirname(__FILE__), 'controllers/*.rb')).each { |f| require f }
  Dir.glob(File.join(File.dirname(__FILE__), 'models/*.rb')).each { |f| require f }
  
  DataMapper.setup(:default, 'sqlite3:junior.db')
  
  DataMapper.auto_upgrade!
  
  resource :users
  
  route '/',            { :controller => :hello,  :action => :index }, 'GET'
  route '/hello',       { :controller => :hello, :action => :index }
  route '/hello/world', { :controller => :hello, :action => :world }
end

