KreuzOMat::App.controllers  do

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  get '/' do
    render :home
  end

  get '/faq' do
    render :faq
  end

  get '/impressum' do
    render :impressum
  end

  get '/survey' do
    render :survey
  end


end
