source 'http://rubygems.org'

gem 'rails', '3.1.0'

gem 'sqlite3'
gem 'jquery-rails'

gem 'daemons'
gem 'redis'
gem 'resque', :require => "resque/server"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'uglifier'
  gem 'therubyracer'
end

group :development, :test do
  gem 'cucumber-rails'
  gem 'simplecov'
  gem 'rspec-rails'
  gem 'factory_girl', '2.2.0'
  gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions  
  gem 'database_cleaner' # to clear Cucumber's test database between runs
end

group :development do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "pickler", "~> 0.2.1"
end

group :test do
  # Pretty printed test output
  gem 'resque_spec'
  gem 'turn', '< 0.8.3', :require => false
# gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
end
