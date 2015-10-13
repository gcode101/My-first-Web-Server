require 'sinatra'
require 'HTTParty'
require 'nokogiri'

get '/' do
response = HTTParty.get("http://finance.yahoo.com/q?s=googl")
 body = response.body
dom = Nokogiri::HTML(body)
stock_price = dom.xpath("//span[@id='yfs_l84_googl']").first.content
"The current stock price of Google $#{stock_price}"
end

