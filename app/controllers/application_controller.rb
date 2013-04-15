class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  before_filter :signed_in_user
  
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
 
  private
 
	  def record_not_found
	    respond_to do |format|
	      format.html { redirect_to request.referrer ? :back : root_url, alert: 'Limited access to record' }
	      format.all  { render :nothing => true, :status => 404 }
	    end
	    true
	  end
end
