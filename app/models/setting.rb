class Setting < ActiveRecord::Base
	def self.value(key)
		key = key.to_s
		val = Setting.find_by_key key
		if val.nil?
			Rails.logger.warn "Missing settings key: #{key}"
			""
		else
			val.value
		end
	end
	
	def self.true?(key)
		key = key.to_s
		value(key) == '1'
	end
	
	def self.set_value(key, value)
		key = key.to_s
		val = Setting.find_by_key key
		if val.nil?
			raise "Invalid setting key"
		else
			val.value = value
			val.save
		end
	end
end