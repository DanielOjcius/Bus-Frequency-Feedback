class BusFrequencyController < ApplicationController
	def register
		frequency = params[:frequency]
		bus_frequency = BusFrequency.where(:bus_no => params[:bus_no], :time_range => params[:range]).first_or_create
		bus_frequency.update_attribute(frequency, bus_frequency.send(frequency) + 1)
		render :text => 'registered', :status => 200
	end

	def bus_number
		bus_frequency = BusFrequency.find_by_bus_no(params[:bus_no])
		render :text => 'not found' and return if bus_frequency.nil?
		render :json => bus_frequency.attributes.except("id", "created_at", "updated_at").to_json
	end
end