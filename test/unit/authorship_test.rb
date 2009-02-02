require 'test_helper'

class PublicationTest < ActiveSupport::TestCase

	test 'paper has correctly-ordered authorships' do
		scheduling_paper_authorship = [authorships(:tack_wrote_scheduling_paper), authorships(:haris_also_wrote_scheduling_paper)]
		assert_equal scheduling_paper_authorship.length, publications(:scheduling_paper).authorships.count
		assert_equal scheduling_paper_authorship, publications(:scheduling_paper).authorships
		
		paper_one_authorship = [authorships(:haris_wrote_paper_one), authorships(:tack_also_wrote_paper_one)]
		assert_equal paper_one_authorship.length, publications(:one).authorships.count
		assert_equal paper_one_authorship, publications(:one).authorships
	end
	
end
