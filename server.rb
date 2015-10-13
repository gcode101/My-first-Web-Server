require 'sinatra'
require 'HTTParty'
require 'nokogiri'

get '/' do
	stock = params[:stock]
	symbol = stock.downcase
	response = HTTParty.get("http://finance.yahoo.com/q?s=#{symbol}")
	body = response.body
	dom = Nokogiri::HTML(body)
	stock_price = dom.xpath("//span[@id='yfs_l84_#{symbol}']").first.content
	"The current stock price is $#{stock_price}"
end

