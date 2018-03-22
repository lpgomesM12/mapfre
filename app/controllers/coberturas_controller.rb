class CoberturasController < ApplicationController
  before_action :set_cobertura, only: [:show, :edit, :update, :destroy]

  # GET /coberturas
  # GET /coberturas.json
  def index
    @coberturas = Cobertura.all
  end

  # GET /coberturas/1
  # GET /coberturas/1.json
  def show
  end

  # GET /coberturas/new
  def new
    @cobertura = Cobertura.new
  end

  # GET /coberturas/1/edit
  def edit
  end

  # POST /coberturas
  # POST /coberturas.json
  def create
    @cobertura = Cobertura.new(cobertura_params)

    respond_to do |format|
      if @cobertura.save
        format.html { redirect_to @cobertura, notice: 'Cobertura was successfully created.' }
        format.json { render :show, status: :created, location: @cobertura }
      else
        format.html { render :new }
        format.json { render json: @cobertura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coberturas/1
  # PATCH/PUT /coberturas/1.json
  def update
    respond_to do |format|
      if @cobertura.update(cobertura_params)
        format.html { redirect_to @cobertura, notice: 'Cobertura was successfully updated.' }
        format.json { render :show, status: :ok, location: @cobertura }
      else
        format.html { render :edit }
        format.json { render json: @cobertura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coberturas/1
  # DELETE /coberturas/1.json
  def destroy
    @cobertura.destroy
    respond_to do |format|
      format.html { redirect_to coberturas_url, notice: 'Cobertura was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cobertura
      @cobertura = Cobertura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cobertura_params
      params.require(:cobertura).permit(:nome, :valor, :valor_franquia)
    end
end
