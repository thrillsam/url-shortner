require 'securerandom'

class Url < ApplicationRecord
	has_many :url_infos

	after_create :set_expiry_date

	def set_expiry_date
		self.update_column('expiry_date', 30.days.from_now)
	end

	def is_valid?
		if self.expiry_date >= Date.today
			true
		else
			false
		end
	end

	class << self
		def generate(original_url)
			short_url = get_host+'/'+get_random_string
			url = Url.new(long_url: original_url, short_url: short_url)
			url.save
			url.short_url
		end

		def get_host
			Rails.application.credentials.host
		end

		def get_random_string
			string = ''
			loop do
				string = SecureRandom.hex.last(5)
				return string if string =~ /\d/ and string =~ /\D/
			end
		end

		def find_url(short_url)
			Url.find_by(short_url: get_host+'/'+short_url)
		end
	end
end
