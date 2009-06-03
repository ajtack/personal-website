class CvsController < ApplicationController
	def show
		respond_to do |format|
			format.html # show.html.erb
			format.pdf	{ send_file Rails.root + 'app/views/cvs/show.pdf' }
		end
	end
end
