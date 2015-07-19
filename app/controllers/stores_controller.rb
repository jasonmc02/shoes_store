class StoresController < ApplicationController
  before_action :validate_session, only: [:services_filter]
  before_action :validate_id, only: [:services_filter]
  before_action :validate_store, only: [:services_filter]
  before_action :set_store, only: [:show, :edit, :update, :destroy, :get_articles]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def services_filter
    if params.has_key?(:id)
      return get_articles
    end
    @stores = Store.all
    render :action => "index"
  end

  def get_articles
    set_store
    @articles = @store.articles.includes(:store)
    render "articles/index"
  end

  private
    def validate_id
      return render :json => { :error_msg => "Bad Request", :success => false }, :status => 400 unless params[:id].blank? || /\A[-+]?[0-9]*\.?[0-9]+\Z/.match(params[:id].to_s)
    end

    def validate_store
      return render :json => { :error_msg => "Record not Found", :success => false }, :status => 404 unless params[:id].blank? || Store.exists?(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :address)
    end
end
