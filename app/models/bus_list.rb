class BusList < ActiveRecord::Base
	def self.has_bus_no bus_no
		BusList.where(:bus_no => bus_no).present?
	end
end
