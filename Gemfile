source 'http://rubygems.org'

gem 'rails', '3.1.8'
gem 'twitter'
gem 'devise', '1.5.3'
gem 'cancan'
gem "nifty-generators"
gem 'paperclip'
gem 'aws-s3', :require => 'aws/s3'
gem 'metropoli', :git => 'git://github.com/innku/metropoli.git'
gem "mocha", :group => :test
gem 'RedCloth'
gem "will_paginate", "~> 3.0.pre2"
gem 'hoptoad_notifier'
gem 'bitly'
gem "rake", "0.9.2"
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'thin'

group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :production, :staging do
  gem 'pg'
end

group :development, :test, :staging do 
  gem 'factory_girl_rails'
end

group :development, :test do 
  gem 'capybara', '1.1.1'
  gem 'database_cleaner'
  gem 'cucumber-rails', '1.2.0'
  gem 'cucumber', '1.1.4'
  gem 'rspec-rails', '2.8.1'
  gem 'spork'
  gem 'launchy'
  gem "debugger"
  gem "selenium-webdriver"
  gem 'sqlite3', '1.3.4'
end
