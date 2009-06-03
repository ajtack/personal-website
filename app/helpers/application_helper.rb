module ApplicationHelper
	private
		RelativeRootPrefix = /^#{ActionController::Base.relative_url_root}/
		LocalePrefix = /^\/([a-zA-Z]{2})(?=\/|$)/
	
		def locale_independentize(path = request.path)
			newpath = path.gsub(RelativeRootPrefix, '')  # Only happens when testing.
			newpath.gsub!(LocalePrefix, '')
			newpath
		end

	public
		def public_links
			link_labels = {
					locale_independentize(publications_path) => {:title => t('page_titles.publications'), :path => publications_path},
					locale_independentize(about_path) => {:title => t('page_titles.about_me'), :path => about_path},
					locale_independentize(cv_path) => {:title => t('page_titles.cv'), :path => cv_path}
				}
			
			link_labels
		end
	
		def page_title_for(path = nil)
			titles = {
					locale_independentize(session_path) => 'Login',
					locale_independentize(login_path) => 'Login',
					locale_independentize(about_path) => t('page_titles.about_me'),
					locale_independentize(index_path) => t('page_titles.home'),
					locale_independentize(root_path) => t('page_titles.home'),
					locale_independentize(publications_path) => t('page_titles.publications'),
					locale_independentize(cv_path) => t('page_titles.cv')
				}
			
			titles[locale_independentize(path)]
		end
end
