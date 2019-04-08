class PagesController < ApplicationController
	def read_page
		@page = Page.find(params[:page_id])
		@page.read_html
		#render 
	end	
end
