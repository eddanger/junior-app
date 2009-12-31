require 'application'

use Rack::MethodOverride
use Rack::Static, :urls => [ '/favicon.ico', '/css', '/js', '/images' ], :root => 'public'

run MyApplication.router