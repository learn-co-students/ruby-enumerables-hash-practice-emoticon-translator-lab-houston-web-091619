require "yaml"

path = "./lib/emoticons.yml"
def load_library(path)
  #path = YAML.load_file('./lib/emoticons.yml')
  emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(path).each do |meaning, describe|
     eng, jan = describe
     emoticons["get_meaning"][jan] = meaning
     emoticons["get_emoticon"][eng] = jan
  end
  emoticons
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path) #call load_library
  result = emoticons["get_emoticon"][emoticon]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  result = emoticons["get_meaning"][emoticon] #the same above but change get_meaning
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end