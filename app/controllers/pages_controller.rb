class PagesController < ApplicationController
  def home
  end

  def yelp
  end

  def search
  	parameter = { term: params[:term], limit: 16 }
  	render json: Yelp.client.search("Philadelphia", parameter)
  end
end
