class Episode
  
  attr_accessor :title

  def initialize(attrs)
    attrs.each_pair do |key, value|
      self.send("#{key}=", value)
    end
  end

  def self.from_json(json)
    new(:title => json["title"])
  end

  def self.fetch_episodes(&block)
    p 'fetch_episodes'
    AFMotion::JSON.get("http://railscasts.com/episodes.json") do |response|
      p 'response'
      p "#{response}"
      block.call(true, response.body)
    end
  end
end
