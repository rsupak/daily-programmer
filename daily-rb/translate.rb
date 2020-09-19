# Imports the Google Cloud client library
require 'google/cloud/translate'

# Configures Google Cloud project w/ credentials
Google::Cloud::Translate.configure do |config|
  config.project_id  = 'translationproject-254617'
  config.credentials = 'TranslationProject-97e8fa3557f5.json'
end

# Instantiates a translation
translate = Google::Cloud::Translate.new
text = 'goodbye'

translation = translate.translate text, to: 'ru'

puts "Text: #{text}"
puts "Translation: #{translation}"
