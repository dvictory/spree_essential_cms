Spree::HomeController.class_eval do
  
  before_filter :get_homepage
  
  def index
    @searcher = Spree::Config.searcher_class.new(params)
    @products = @searcher.retrieve_products
    if !@page.nil?
      render :template => "spree/pages/home"
 	  else
 	    render :template =>"spree/home/index"
 	  end
  end
  
  private
  
    def get_homepage
      @page = Spree::Page.visible.find_by_path("/")
      redirect_to products_url if @page.nil?
    end
    
    def accurate_title
      @page.meta_title unless @page.nil?
    end
  
end
