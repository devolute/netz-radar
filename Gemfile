source 'https://rubygems.org'

# Distribute your app as a gem
# gemspec

# Server requirements
gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
gem 'oj'

# Project requirements
gem 'rake'
gem 'debugger'

# Component requirements
gem 'sass'
gem 'haml'
gem 'padrino-sprockets', require: "padrino/sprockets"
gem 'coffee-script'
gem 'uglifier'
gem 'yui-compressor'

# Test requirements
group :test do
  gem 'rspec' # , :group => 'test'
  gem 'rack-test', :require => 'rack/test' #, :group => 'test'
  gem "capybara"
  gem "poltergeist"
end

# Padrino Stable Gem
gem 'padrino', '0.11.2'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.11.2'
# end
