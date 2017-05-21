Dir['lib/*.rb'].each { |f| load f.to_s }
class ApiController

	def self.load_data(params)
		raise AuthenticationError unless api_key_given(params)
		
	end

	def self.fuzzy_match(params)
		
	end

	private

	def self.api_key_given(params)
		params[:api_key] == api_key
	end

	def self.api_key 
		ApiKeys.get('access_key') 
	end

end

class AuthenticationError < StandardError
end

