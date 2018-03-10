require 'json'
require 'http'

data = JSON.parse(json_data)
residents = data['Resident'].map { |rd| Resident.new(rd['phone'], rd['addr']) }
