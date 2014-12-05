# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( token-input.css )
Rails.application.config.assets.precompile += %w( jquery.tokeninput.js )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( jquery-ui.min.js )
Rails.application.config.assets.precompile += %w( autocomplete-rails.js )
Rails.application.config.assets.precompile += %w( token-input-facebook.css )

ActionController::Renderers.add :csv do |csv, options|
  self.content_type ||= Mime::CSV
  self.response_body  = csv.respond_to?(:to_csv) ? csv.to_csv : csv
end