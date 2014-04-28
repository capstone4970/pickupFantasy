class TestCall < ActiveRecord::Base
	#attr_accessible :meta, :objects
	has_one :test_meta
	has_one :test_object
end
