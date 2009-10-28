# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
	config.time_zone = 'Central Time (US & Canada)'
	config.i18n.default_locale = :en
	config.action_controller.session = {
		:session_key => '_website_session',
		:secret      => '5ea7f317ca16ad18f0f0f2e9b6cd6f185e4785ad2acc32ebc6661a3a68b017a04159487f7a060332765ae5e393b55085d8cfdce5a0f8b78330b6da37d6f57399'
	}
end
