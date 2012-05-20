source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jbuilder'

group :production do
  gem 'pg'
  gem 'newrelic_rpm' # <- For New Relic monitoring service
end

group :development do
  gem 'sqlite3'
end

group :test do
  gem 'fabrication' # <- For generating factories in testing
  gem 'turn', :require => false # <- Pretty printed test output
  gem 'minitest'
end