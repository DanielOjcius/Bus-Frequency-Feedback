class BusFrequencyController < ApplicationController
	def register
		frequency = params[:frequency]
		bus_frequency = BusFrequency.where(:bus_no => params[:bus_no], :time_range => params[:range]).first_or_create
		bus_frequency.update_attribute(frequency, bus_frequency.send(frequency) + 1)
		render :text => 'registered'
	end
end