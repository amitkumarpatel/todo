class PagesController < ApplicationController
	def read_page
		@page = Page.find(params[:page_id])
		@page.read_html
	  render json: @page.as_json
	end	
end
