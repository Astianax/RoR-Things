require 'yaml'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "LcXX508LMEnXYrwEbHDmxozvo"
  config.consumer_secret     = "xdHvYGFc3uFxHpqOMwcYuOFqMavhvbgTFP5Gh9VaApi4HeLSl6"
  config.access_token        = "315581184-RwGGWPrdHyiGVRH31H6v5l6syDSJafcbTSuFuBAU"
  config.access_token_secret = "wxKdvPqX7HdvC7AXLWjie3QN9VkQ7YC1zLFnQLtmHB5SP"
end

#client.update('Tweet from Astianax Lopez!')

#client.search("#hello").take(5).each do |tweet|
 #    puts tweet.text
#end

#client.search("query", {options})

tweets = client.user_timeline('rubyinside', count: 20)

tweets.each { |tweet|
 puts tweet.full_text 
}


File.write('tweets.yml', YAML.dump(tweets))

 puts "-----------------------------------------------------------"
tweets = YAML.load_file('tweets.yml')

client.search('#ruby').take(3).each do |tweet|
  client.update("@#{tweet.user} Hey I love Ruby too, what are your favorite blogs? :)")
end