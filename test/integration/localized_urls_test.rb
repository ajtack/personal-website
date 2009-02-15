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
		verify_page_link_is_selected(t(:About_me))
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
		verify_page_link_is_selected(t(:About_me))
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
		verify_page_link_is_selected(t(:About_me))
	end
	
	private
		def verify_locale_is(locale)
			assert_not_nil I18n.locale
			assert_equal locale, I18n.locale
		end
		
		def verify_page_link_is_selected(label)
			assert_select 'ul', :id => 'NavigationBarLinks' do
				assert_select 'li.selected_link', {:text => label, :count => 1}
			end
		end
	
end
