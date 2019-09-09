# require modules here
require "yaml"

def load_library(path)
  emote = {}
  emote[:get_meaning], emote[:get_emoticon] = {}, {}
  library = YAML.load_file(path)
  library.keys.each do |key|
    emote[:get_meaning][library[key][1]] = key
    emote[:get_emoticon][library[key][0]] = library[key][1]
  end
  emote
end

def get_japanese_emoticon(path, emoticon)
  emote = load_library(path)
  emote[:get_emoticon].include?(emoticon) ? emote[:get_emoticon][emoticon] : 'Sorry, that emoticon was not found'
end

def get_english_meaning(path, emoticon)
  emote = load_library(path)
  emote[:get_meaning].include?(emoticon) ? emote[:get_meaning][emoticon] : 'Sorry, that emoticon was not found'
end