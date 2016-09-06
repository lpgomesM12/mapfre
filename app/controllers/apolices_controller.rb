class ApolicesController < ApplicationController
  before_action :set_apolice, only: [:show, :edit, :update, :destroy]


 def relatorio

   @apolice = Apolice.find(params[:id])

   respond_to do |format|
     format.html
     format.pdf { render pdf: "reserva"
      # footer: { center: "[page] de [topage]" }
       }
   end
 end

  # GET /apolices
  # GET /apolices.json
  def index
    @apolices = Apolice.page(params[:page]).per(10)
  end

  # GET /apolices/1
  # GET /apolices/1.json
  def show

    respond_to do |format|
      format.html
      format.pdf { render pdf: "Apolice",
        header: {center: "lllL"},
        footer: { center: "[page] de [topage]" }
        }
    end
  end

  # GET /apolices/new
  def new
    @apolice = Apolice.new

    respond_to do |format|
      format.html
      format.pdf { render pdf: "Apolice",
        header: {center: "lllL"},
        footer: { center: "[page] de [topage]" }
        }
    end
  end

  # GET /apolices/1/edit
  def edit
  end

  # POST /apolices
  # POST /apolices.json
  def create
    @apolice = Apolice.new(apolice_params)

    respond_to do |format|
      if @apolice.save
        format.html { redirect_to @apolice, notice: 'Cadastro realizado com sucesso.' }
        format.json { render :show, status: :created, location: @apolice }
      else
        format.html { render :new }
        format.json { render json: @apolice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apolices/1
  # PATCH/PUT /apolices/1.json
  def update
    respond_to do |format|
      if @apolice.update(apolice_params)
        format.html { redirect_to @apolice, notice: 'Registro alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @apolice }
      else
        format.html { render :edit }
        format.json { render json: @apolice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apolices/1
  # DELETE /apolices/1.json
  def destroy
    @apolice.destroy
    respond_to do |format|
      format.html { redirect_to apolices_url, notice: 'Registro deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apolice
      @apolice = Apolice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apolice_params
      params.require(:apolice).permit(:ramo, :produto, :apolice, :item, :data_proposta, :vig_inicio, :vig_termino, :nome_segurado, :cpf, :endereco, :cidade, :bairro, :cep, :uf, :valr_premioliquido, :valr_adicional, :valr_custo, :valr_iof, :valr_premiototal, :desc_obs)
    end
end
