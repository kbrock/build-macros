class ImagesController < ApplicationController
  before_filter :check_kind

  def show
    respond_to do |format|
      format.text { render :text => random_image }
      format.html { render :text => %(<image src="#{random_image}"/>) }
    end
  end

  private

  def random_image
    IMAGES[params[:kind]][rand(IMAGES[params[:kind]].size)]
  end

  def check_kind
    render :nothing => true, :status => :bad_request unless KINDS.include?(params[:kind])
  end
end
