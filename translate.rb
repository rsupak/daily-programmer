# # Imports the Google Cloud client library
# require 'google/cloud/translate'

# # Your Google Cloud Platform project ID
# project_id = 'translationproject-254617'

# # Instantiates a client
# translate = Google::Cloud::Translate.new project: project_id

# # The text to translate
# text = 'Hello, world!'
# # The target language
# target = 'ru'

# # Translates some text into Russian
# translation = translate.translate text, to: target

# puts 'Text: #{text}'
# puts 'Translation: #{translation}'

# Imports the Google Cloud client library
require 'google/cloud/translate'

Google::Cloud::Translate.configure do |config|
  config.project_id  = 'translationproject-254617'
  config.credentials = 'TranslationProject-97e8fa3557f5.json'
end

translate = Google::Cloud::Translate.new
text = 'Hello, world!'
translation = translate.translate 'Hello world!', to: 'ru'

puts "Text: #{text}"
puts "Translation: #{translation}"
