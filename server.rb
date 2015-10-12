require 'sinatra'

get '/' do
	File.open("./public/hello.txt").read
end

