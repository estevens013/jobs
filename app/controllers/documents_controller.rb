class DocumentsController < ApplicationController
	before_filter :authorize

	def index
  	@document = Document.new
  	@documents = Document.all
  end

  def create
  	@document = Document.new(params[:document])
  	if @document.save
  		redirect_to :back
  	end
  end

  def edit
  	@document = Document.find params[:id]
    session[:return_to] ||= request.referer
  end

  def update
  	document = Document.find params[:id]
  	if document.update_attributes params[:document]
      # ##### Functioning, but not how I want.  Redirects back to Document view ##### #
      redirect_to session.delete(:return_to), :notice => 'Your Document has successfully been updated'
  	else
  		redirect_to :back, :notice => 'There was an error updating your Document'
  	end
  end

  def destroy
  	Document.destroy params[:id]
  	redirect_to :back, :notice => 'Document has been deleted'
  end

  def show
    @document = Document.find params[:id]
  end

end
