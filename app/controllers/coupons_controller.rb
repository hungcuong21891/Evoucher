require "json"
require "net/http"
require "uri"

 
class CouponsController < ApplicationController
  	def index

		uri = URI.parse("http://127.0.0.1:8081/query?dbname=voucher&colname=coupons&limit=20")
 		
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)
	 
		response = http.request(request)
	 
		if response.code == "200"
	  		@coupons = JSON.parse(response.body)
	  	
	    else
	 		puts "ERROR!!!"
		end
	end

	def show
		itemID =  params[:id].split('-').last
		logger.debug "#{itemID}"
		uri = URI.parse("http://127.0.0.1:8081/query?dbname=voucher&colname=coupons")
 		
 		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Post.new(uri.request_uri)
	 	request.content_type = 'application/json'
	 	q = '{"itemID":' + itemID + '}'
	 	request.body = q;
		response = http.request(request)
	 
		if response.code == "200"
	  		@coupons = JSON.parse(response.body)
	  	
	    else
	 		puts "ERROR!!!"
		end
	  	
	end		
end
