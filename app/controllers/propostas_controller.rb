class PropostasController < ApplicationController
  before_action :set_apolice, only: [:show, :edit, :update, :destroy]

  
  def relatorio_proposta
    @apolice = Apolice.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf { render pdf: "reserva"
       # footer: { center: "[page] de [topage]" }
        }
    end
  end


def relatorio_proposta_html
  @apolice = Apolice.find(params[:id])
end


def aceitarProposta 
  @apolice = Apolice.find(params[:apolice_id])
  @apolice.flag_propostaaceita = true
  @apolice.save

  render :json => true

end 

  
  # GET /apolices
  # GET /apolices.json
  def index
      if params[:q]
          @q =  params[:q].downcase
          @apolices = Apolice.where("page = 'proposta' AND lower(nome_segurado) like '%#{@q}%' OR lower(apartamento) like '%#{@q}%'").page(params[:page]).per(10)
        else
          @apolices = Apolice.where("page = 'proposta'").page(params[:page]).per(10)
      end
  end

  # GET /apolices/new
  def new
    @apolice = Apolice.new
    @apolice.page = "proposta"

    respond_to do |format|
    if @apolice.save
        coberturas = Cobertura.all
      
        coberturas.each do |item|
          coberturaapolice = Coberturaapolice.new
          coberturaapolice.apolice_id = @apolice.id
          coberturaapolice.cobertura_id = item.id
          coberturaapolice.valor = item.valor
          coberturaapolice.valor_franquia = item.valor_franquia
          coberturaapolice.save
        end

        format.html { redirect_to edit_apolice_path(@apolice), notice: 'Cadastro realizado com sucesso.' }
        format.json { render :show, status: :created, location: @apolice }
      else
        format.html { render :new }
        format.json { render json: @apolice.errors, status: :unprocessable_entity }
      end
    end
  end

  def showproposta

    @id = params[:id]
    @apolice = Apolice.find(@id)
    @url = "http://localhost:3000/relatorioproposta.pdf?id=#{@id}"
  
  end

  # GET /apolices/1/edit
  def edit
    @apolice.data_proposta = @apolice.data_proposta.strftime("%d/%m/%Y") rescue nil
    @apolice.vig_inicio = @apolice.vig_inicio.strftime("%d/%m/%Y") rescue nil
    @apolice.vig_termino = @apolice.vig_termino.strftime("%d/%m/%Y") rescue nil
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_apolice
    @apolice = Apolice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def apolice_params
    params.require(:apolice).permit(:ramo, :produto, :apolice, :item, :data_proposta, :vig_inicio, :vig_termino, :nome_segurado, :cpf, :endereco, :cidade, :bairro, :cep, :uf, :valr_premioliquido, :valr_adicional, :valr_custo, :valr_iof, :valr_premiototal, :desc_obs, :numr_mensal, :cnpj, :apartamento, :page, :valor_franquiaportao)
  end

end
