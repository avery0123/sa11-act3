def extract_urls(text)
  url_pattern = /(?:https?|ftp):\/\/[\w\-]+(?:\.[\w\-]+)+(?:[\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/
  text.scan(url_pattern)
end

def print_urls(urls)
  urls.each { |url| puts url }
end

# Test the script with a new sample text containing multiple URLs
new_sample_text = "Hey, check out my website: http://mywebsite.net. You can also visit https://www.example.com/path/to/page?query=param#fragment for more information."
extracted_urls = extract_urls(new_sample_text)
print_urls(extracted_urls)
