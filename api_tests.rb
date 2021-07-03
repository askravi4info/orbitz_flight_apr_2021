require 'rest-client'
require 'json'

url = 'https://jsonplaceholder.typicode.com/users'
response = RestClient.get(url)
puts "The response is: #{response}"
puts "+++++++++++++++++++++"
value = JSON.parse(response)
puts "value is #{value}"
fail "#{value[0]["name"]} is NOT correct." unless value[0]["name"] == 'Leanne Graham'

# # *************************
#
# require 'net/http'
# require 'json'
#
# url = 'https://jsonplaceholder.typicode.com/users'
# uri = URI(url)
# response = Net::HTTP.get(uri)
# puts "The response is: #{response}"
# puts "+++++++++++++++++++++"
# value = JSON.parse(response)
# puts "value is #{value}"
# fail "#{value[0]["name"]} is NOT correct." unless value[0]["name"] == 'Leanne Graham'
#
#
# # *************************
#
# require 'httparty'
#
# url = 'https://jsonplaceholder.typicode.com/users'
# response = HTTParty.get(url)
# puts "The response is: #{response}"
# puts "+++++++++++++++++++++"
# value = response.parsed_response
# puts "value is #{value}"
# fail "#{value[0]["name"]} is NOT correct." unless value[0]["name"] == 'Leanne Graham'
