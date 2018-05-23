require "unirest"
require "tty-prompt"

prompt = TTY::Prompt.new

while true
  system "clear"
  puts "Welcome to the Reddit app!"
  response = Unirest.get("https://www.reddit.com/r/programming.json")
  posts = response.body["data"]["children"]

  index = 0
  choices = []
  posts.length.times do
    post = posts[index]
    choices << "#{index}. #{post["data"]["title"]}"
    index = index + 1
  end
  answer = prompt.select("Select a post", choices)
  index = answer.split(".")[0].to_i
  response = Unirest.get("https://www.reddit.com#{posts[index]["data"]["permalink"]}.json")
  comments = response.body[1]["data"]["children"]
  index = 0
  comments.length.times do
    comment = comments[index]
    author = comment["data"]["author"]
    body = comment["data"]["body"]
    puts "Author: #{author}"
    puts body
    puts
    index = index + 1
  end
  puts "Press enter to continue or q to quit"
  input_option = gets.chomp
  if input_option == "q"
    system "clear"
    puts "Thank you, goodbye!"
    break
  end
end