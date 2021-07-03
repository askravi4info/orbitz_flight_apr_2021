require 'httparty'

url = 'https://jsonplaceholder.typicode.com/users'
response = HTTParty.get(url)
puts "The response is: #{response}"
puts "+++++++++++++++++++++"
value = response.parsed_response
puts "value is #{value}"
fail "#{value[0]["name"]} is NOT correct." unless value[0]["name"] == 'Leanne Graham'





