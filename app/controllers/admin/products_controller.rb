class Admin::ProductsController <  Admin::BaseController
  
  def new
    if params[:goods_id].present?
      @product = Product.new
      @goods = Good.find(params[:goods_id])
      @product.build_with_goods(@goods )
    else
      redirect_to new_list_admin_products_path
    end
  end
  
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path,:notice=>"新建商品记录成功"
    else
      render 'new'
    end
  end
  
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path,:notice=>"更新商品记录成功"
    else
      render 'edit'
    end
  end
  
  def index
    @q = Product.search(params[:q])
    @products = @q.result(distinct: true).order("no asc")
    @products_grid = initialize_grid(@products,:per_page => 20)
    
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
      format.xls
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new_list
    @q = Good.search(params[:q])
    @goods = @q.result(distinct: true)
    @goods_grid = initialize_grid(@goods,:per_page => 20)
  end
  
  def on_sale
    @product = Product.find(params[:id])
    @product.on_sale = true
    @success =  @product.save
  end
  
  def off_sale
    @product = Product.find(params[:id])
    @product.on_sale = false
    @success =  @product.save    
  end
  
  def upload_form
  
  end
  
  def upload
    Product.transaction do
      xlsfile = upload_file(params[:file]['xlsfile'])
      book = Spreadsheet.open("#{::Rails.root}/public/uploads/#{xlsfile}")
      sheet = book.worksheet(0)
      sheet.each_with_index do |row, i|
        if i>0
          id = row[0]
          product = Product.find(id)
          if product
            product.no = row[1]
            product.name = row[2]
            product.mk_price = row[4].to_f
            product.price = row[5].to_f
            product.weight = row[6]
            product.unit = row[7]
            product.on_sale = row[8]=="Y" ? true : false
            product.save
          end
        end
      end
    end
    redirect_to admin_products_path,:notice=>"上传成功"
  end


  protected
  def upload_file(file)
    if !file.original_filename.empty?
      @filename = get_file_name(file.original_filename)
      File.open("#{::Rails.root.join('public','uploads',@filename)}", "wb") do |f|
        f.write(file.read)
      end
      return @filename
    end
  end

  def get_file_name(filename)
    if !filename.nil?
      # chinese filename not supported?
      Time.now.strftime("%Y%m%d%H%M%S") + '.xls'
    end
  end
  
  private
  def product_params
    params.require(:product).permit!
  end
end