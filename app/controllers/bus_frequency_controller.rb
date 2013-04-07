class BusFrequencyController < ApplicationController
	def index 
	end

	def bus
		@bus_no = params[:bus_no]
	end

	def high_frequency_feedback
		# Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)")
		render :json => BusFrequency.select("bus_no, sum(low) as total").group("bus_no").to_json
	end
	def register
		frequency = params[:frequency]
		render :text => 'bus number invalid', :status => 404 and return unless BusList.has_bus_no(params[:bus_no])
		bus_frequency = BusFrequency.where(:bus_no => params[:bus_no], :time_range => params[:range]).first_or_create
		bus_frequency.update_attribute(frequency, bus_frequency.send(frequency) + 1)
		render :text => 'registered', :status => 200
	end

	def bus_number
		bus_frequencies = BusFrequency.where(:bus_no => params[:bus_no])
		render :text => 'not found' and return if bus_frequencies.empty?
		render :json => bus_frequencies.map{|bus| bus.attributes.except("id", "created_at", "updated_at", "bus_no")}.to_json
	end
end