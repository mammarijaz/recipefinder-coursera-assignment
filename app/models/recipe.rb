class Recipe
  include HTTParty	
  default_options.update(verify: false) # Turn off SSL verification
  key_value = ENV['FOOD2FORK_KEY'] || "56f76c545882678a166c431e281edf05"
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api/search"
  default_params key: key_value
  format :json

  def self.for keyword
    get("", query: { q: keyword})["recipes"]
  end
end