source "http://gemcutter.org"
disable_system_gems

only :app do
  gem 'junior'
  gem 'haml'
  gem 'do_sqlite3'
  #gem 'do_postgres' # needed for heroku
  gem 'dm-core'
  gem 'dm-types'
  gem 'dm-timestamps'
  # gem 'rackamole' # use Rack::Mole
end
 
only :test do
  gem 'rake'
  gem 'rspec'
  gem 'rack-test'
  gem 'rcov'
  gem 'yard'
end
