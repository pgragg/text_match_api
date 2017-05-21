class ApiKeys

	def self.get(api_key)
		key_string = api_key.to_s
		ENV[key_string]
	end

	def self.set_api_keys
		keys = YAML.load_file "keys.yaml"
		environment = ENV['environment']
		keys[environment].each do |k,v|
			ENV[k] = v
		end
	end

end