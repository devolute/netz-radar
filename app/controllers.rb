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
    @faqs = KreuzOMat::Faq.all
    render :faq
  end

  get '/imprint' do
    render :imprint
  end

  get '/survey' do
    @parties = KreuzOMat.data.parties.to_json
    @cards = KreuzOMat::Card.all
    render :survey
  end


end
