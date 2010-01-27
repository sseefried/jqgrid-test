class ProductsController < ApplicationController

  protect_from_forgery :except => [:post_data]

  def index
    order = params[:sidx] && params[:sidx].length >0 && params[:sord] && params[:sord].length > 0  ?  "#{params[:sidx]} #{params[:sord]}" : nil

    @products = Product.paginate :page => params[:page], :per_page => params[:rows], :order => order

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
      format.json { render :json => @products.to_jqgrid_json([:name, :description, :quantity, :price, :available ], params[:page], params[:rows], @products.size) }
    end
  end


  def post_data
    if params[:oper] == "del"
      Product.find(params[:id]).destroy
    else
      product_params = [ :name, :description, :quantity, :price, :available].inject({}) do |h,s|
        h.merge({s => params[:s]})
      end
      if params[:id] == "_empty"
        Product.create(product_params)
      else
        Product.find(params[:id]).update_attributes(product_params)
      end
    end
    render :nothing => true
  end

  ###################### Scaffold methods ####################################

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to(@product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end

end
