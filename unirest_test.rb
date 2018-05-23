require 'unirest'

response = Unirest.get("https://data.sfgov.org/resource/jjew-r69b.json")

puts JSON.pretty_generate(response.body)