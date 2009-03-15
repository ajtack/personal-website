class CvsController < ApplicationController
	def show
		respond_to do |format|
			format.html # show.html.erb
			format.pdf	{ send_file 'app/views/cvs/show.pdf' }
		end
	end
end
