source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "rollbar"
gem "meta-tags"

# frontend 
gem "bourbon"
gem "vuejs-rails"
gem "jquery-rails"

group :development, :test do
  gem "byebug", platform: :mri
  gem "i18n-tasks"
end

group :test do
  gem "minitest-rails"
  gem "minitest-rails-capybara"
  gem "minitest-reporters"
  gem "minitest-stub_any_instance"
  gem "spy"
  gem "capybara"
  gem "poltergeist"
  gem "database_cleaner"
  gem "launchy"
  gem "webmock"
end

group :development do
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "puma"
end
