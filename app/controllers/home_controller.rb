class HomeController < ApplicationController
 after_action :get_detail, only: :short_url

  def generate_short_url
  	@url = Url.generate(params[:long_url])
  	respond_to do |format|
    	format.js
    end
  end

  def short_url
  	@url = Url.find_url(params[:short_url])
  	if @url.is_valid?
  		redirect_to @url.long_url
  	else
  		raise ActiveRecord::RecordNotFound
  	end
  	rescue ActiveRecord::RecordNotFound
	    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  def stats
  	@urls = Url.includes(:url_infos)
  end

  private
	  def url_params
	  	params.permit(:long_url, :short_url)
	  end

	  def get_detail
	  	UrlInfo.new.save_url_info(request, @url.id)
	  end
end
