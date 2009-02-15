require 'test_helper'

class LocalizedUrlsTest < ActionController::IntegrationTest
	
	test 'plain urls' do
		assert_recognizes ({:controller => 'about', :action => 'index'}), {:path => '/about', :method => :get}
		begin
			visit '/about'
		rescue Webrat::PageLoadError => e
			flunk e.class.name + '. Failed to load page at: /about'
		end
		assert_response :success
		assert_template 'about/index'
		verify_locale_is(:en)
		verify_navbar_link_is_selected(t(:About_me))
	end
	
	test 'default locale urls' do
		assert_equal "/#{I18n.default_locale}/about", about_path
		begin
			visit about_url
		rescue Webrat::PageLoadError => e
			flunk e.class.name + '. Failed to load page at: ' + about_url
		end
		assert_response :success
		assert_template 'about/index'
		verify_locale_is(I18n.default_locale.to_s)
		verify_navbar_link_is_selected(t(:About_me))
	end
	
	test 'non-default locale urls' do
		locale = 'et'
		fail 'Test must be run with the default locale' if locale == I18n.default_locale
		localized_about_path = about_path(:locale => locale)
		
		assert_equal "/#{locale}/about", localized_about_path
		begin
			visit localized_about_path
		rescue Webrat::PageLoadError => e
			"#{flunk e.class.name}. Failed to load page at: #{localized_about_path}"
		end
		assert_response :success
		assert_template 'about/index'
		verify_locale_is(locale)
		verify_navbar_link_is_selected(t(:About_me))
	end
	
	test 'locale selector' do
		visit about_path
		verify_locale_is(I18n.default_locale)
		verify_all_locale_options_are_available
		prev_request = request
		
		new_locale = other_locales.first
		new_locale_link_name = lookup(new_locale, :language_name)
		click_link new_locale_link_name
		verify_url_differs_only_by_locale(prev_request, request)
		verify_locale_is(new_locale)
	end
	
	private
		def other_locales(from = I18n.default_locale)
			result = I18n.available_locales
			result.delete(from)
			result
		end
	
		def verify_locale_is(locale)
			assert_not_nil I18n.locale
			assert_equal locale.to_s, I18n.locale.to_s
		end
		
		def verify_navbar_link_is_selected(label)
			assert_select 'ul', :id => 'NavigationBarLinks' do
				assert_select 'li.selected_link', {:text => label, :count => 1}
			end
		end
		
		def verify_all_locale_options_are_available
			assert_select '#Locales' do
				I18n.available_locales.each do |this_locale|
					assert_select 'a', :text => lookup(this_locale, :language_name)
				end
			end
		end
		
		def verify_url_differs_only_by_locale(previous_request, current_request)
			previous_request = route_hash_for_request(previous_request.path) unless previous_request.class == Hash
			current_request = route_hash_for_request(current_request.path) unless current_request.class == Hash
			
			assert_not_equal previous_request, current_request
			previous_request.delete(:locale)
			current_request.delete(:locale)
			assert_equal previous_request, current_request
		end
		
		def route_hash_for_request(request)
			ActionController::Routing::Routes.recognize_path(request, {})
		end
	
end
