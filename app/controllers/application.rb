# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'efb3382558c540a1077236e6c50aed26'
  
  before_filter :choose_locale

	def choose_locale
		unless params[:locale].nil?
			I18n.locale = params[:locale]
		else
			chosen_locale = request.compatible_language_from(I18n.available_locales) || I18n.default_locale
			redirect_to request.symbolized_path_parameters.merge(:locale => chosen_locale)
		end
	end
end
