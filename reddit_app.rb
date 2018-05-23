require "unirest"

system "clear"
puts "Welcome to the Reddit app!"
response = Unirest.get("https://www.reddit.com/r/programming.json").body

# puts response['data']['children'][0]['data']['title']
# puts JSON.pretty_generate(response['data']['children'][0]['data']['title'])

posts = response['data']['children'] #array of posts

posts.each do |post|
	puts post['data']['title']
end



