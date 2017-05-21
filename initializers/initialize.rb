Dir['lib/*.rb'].each { |f| load f.to_s }
Dir['controllers/*.rb'].each {|f| load f.to_s}
Dir['models/*.rb'].each {|f| load f.to_s}
