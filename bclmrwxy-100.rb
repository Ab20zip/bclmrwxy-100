# BCLMRWXY-100: As a developer, I need some inspiration, so that I can be motivated to work on my project.

require 'net/http'
require 'json'

def fetch_quote
    url = URI("https://favqs.com/api/qotd")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = http.request(request)

    if response.code == '200'
        quote_data = JSON.parse(response.body)
        quote_data['quote']['body']
    else
        "Failed to fetch a quote. Error: #{response.code}"
    end
rescue StandardError => e
    "Error fetching quote: #{e.message}"
end

def display_quote
    quote = fetch_quote
    puts "Words to Live By:\n#{quote}"
end

display_quote
