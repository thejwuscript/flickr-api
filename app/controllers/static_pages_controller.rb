require 'flickr'

class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new(ENV['FLICKR_KEY'], ENV['FLICKR_SECRET'])
    @list = flickr.people.getPhotos(user_id: clean_params, per_page: 6, media: 'photos')
  end

  private

  def clean_params
    if params[:user_id].nil? || params[:user_id] == ''
      "195474231@N02"
    else
      params[:user_id]
    end
  end

end
