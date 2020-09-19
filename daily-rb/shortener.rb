ALPHA_NUMERIC_RANGE = [*'0'..'9', *'A'..'Z', *'a'..'z']

def shorten(url_hash, url)
  url_hash.each { |k, v| return k if v == url }
  short = Array.new(6) { ALPHA_NUMERIC_RANGE.sample }.join
  url_hash[short] = url
  puts "Shortened URL: #{short}"
  url_hash
end

def restore(url_hash, shortened_url)
  url_hash[shortened_url]
end

# tests
url1 = 'this-is-a-test-of-the-url-shortener'
url2 = 'see-i-told-you-this-would-work'
url_hash = {}
shorten(url_hash, url1)
shorten(url_hash, url2)

puts 'List of Shortened URLS: '
url_hash.each { |k, v| puts "\tShortened: #{k} | Original: #{v}" }

puts 'Extracts URL from short'
short = url_hash.keys[0]
short2 = Array.new(6) { ALPHA_NUMERIC_RANGE.sample }.join
puts "\tShortened URL: #{short}"
puts "\tOriginal URL: #{url_hash[short]}"

puts "\tShortened URL2: #{short2}"
puts "\tOriginal URL2: #{url_hash[short2]}"
