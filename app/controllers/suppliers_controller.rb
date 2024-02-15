class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ report show edit update destroy ]

  # GET /suppliers or /suppliers.json
  def index
    if params[:search_supplier].present?
      @suppliers = Supplier.where("name LIKE ?","%#{params[:search_supplier]}%")
    elsif params[:search_author].present?
      @suppliers = Supplier.joins(parts: { assemblies: { books: :author } }).where(authors: { id: params[:search_author] }).distinct
    else
      @suppliers = Supplier.all
    end
  end

  # GET /suppliers/1 or /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # GET /suppliers/1/report
  def report  
  end

  # POST /suppliers or /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to supplier_url(@supplier), notice: "Supplier was successfully created." }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1 or /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to supplier_url(@supplier), notice: "Supplier was successfully updated." }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1 or /suppliers/1.json
  def destroy
    @supplier.destroy! 

    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: "Supplier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
      @books = Book.joins(assemblies: :parts).where(parts: { supplier_id: @supplier.id }).distinct
    end

    # Only allow a list of trusted parameters through.
    def supplier_params
      params.require(:supplier).permit(:name, :cnpj)
    end
end
