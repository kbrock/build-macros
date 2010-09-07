class ImagesController < ApplicationController
  before_filter :check_kind

  def show
    respond_to do |format|
      format.text { render :text => fetch_image }
      format.jpg { redirect_to fetch_image }
      format.html { render :text => %(<image src="#{fetch_image}"/>) }
    end
  end

  private

  def random_image
    IMAGES[params[:kind]][rand(IMAGES[params[:kind]].size)]
  end

  def fetch_image
    if params[:seed].blank?
      random_image
    else
      Rails.cache.fetch(params[:seed].to_s) do
        random_image
      end
    end
  end

  def check_kind
    render :nothing => true, :status => :bad_request unless KINDS.include?(params[:kind])
  end
end
