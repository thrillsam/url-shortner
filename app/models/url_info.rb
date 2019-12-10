class UrlInfo < ApplicationRecord
	belongs_to :url

	def save_url_info(request, id)
		# when application gets huge requests from the web, We can move this as a job so that sidekiq/delayed job will handle this without affecting the http calls
		begin
			# this is using geocoder gem
			# request.ip, request.location.country will give you the proper values when this appliacation points to valid DNS
			# when run this application in local you won't get country name
			UrlInfo.create(ip_address: request.ip, country: request.location.country, url_id: id)
		rescue
			logger.info "Could not save"
		end
	end
end
