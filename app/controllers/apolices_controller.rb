class ApolicesController < ApplicationController
  before_action :set_apolice, only: [:show, :edit, :update, :destroy]


  include ActionView::Helpers::NumberHelper

 def coberturas_apolice
     @coberturas = Coberturaapolice.where(apolice_id: params[:apolice_id])
     render :json => @coberturas.map { |item| {:id => item.id, 
                                                :nome => item.cobertura.nome, 
                                                :valor => number_to_currency(item.valor, unit: "R$", separator: ",", delimiter: "."),
                                                :valor_franquia =>number_to_currency(item.valor_franquia, unit: "R$", separator: ",", delimiter: ".") }}
 end

 def alterar_cobertura

     params[:valor] = params[:valor].gsub("R$", '')
     params[:valor] = params[:valor].gsub(".", '')
     params[:valor] = params[:valor].gsub(",", '.')

     params[:valor_franquia] = params[:valor_franquia].gsub("R$", '')
     params[:valor_franquia] = params[:valor_franquia].gsub(".", '')
     params[:valor_franquia] = params[:valor_franquia].gsub(",", '.')

     @cobertura = Coberturaapolice.find(params[:id])
     @cobertura.valor = params[:valor]
     @cobertura.valor_franquia = params[:valor_franquia]
     @cobertura.save
     render :json => true
 end


 def delete_cobertura
  @cobertura = Coberturaapolice.find(params[:id])
  @cobertura.destroy
  render :json => true
 end


 def home
 end

 def add_servico
   @servico = Servico.new
   @servico.nome = params[:servico]
   @servico.apolice_id = params[:apolice_id]
   @servico.save
   render :json => true
 end


 def add_cobertura

  @coberturaapolice = Coberturaapolice.new 
  @cobertura = Cobertura.find(params[:cobertura_id])
  @coberturaapolice.cobertura_id = @cobertura.id
  @coberturaapolice.valor = @cobertura.valor
  @coberturaapolice.valor_franquia = @cobertura.valor_franquia
  @coberturaapolice.apolice_id = params[:apolice_id]
  @coberturaapolice.save

  render :json => true
end


def busca_servico
  @servico = Servico.where(apolice_id: params[:apolice_id])

  render :json => @servico.map { |item| {:id => item.id, :nome => item.nome }}
end

def deleta_servico
  @servico = Servico.find(params[:servico_id])
  @servico.destroy
  render :json => true
end


def relatorio
  
     @apolice = Apolice.find(params[:id])
  
     respond_to do |format|
       format.html
       format.pdf { render pdf: "reserva"
        # footer: { center: "[page] de [topage]" }
         }
     end
end

def relatorionovo

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
    if params[:q]
      @q =  params[:q].downcase
      @apolices = Apolice.where("page IS NULL and lower(nome_segurado) like '%#{@q}%' OR lower(apartamento) like '%#{@q}%'").page(params[:page]).per(10).order("id DESC")
    else
      @apolices = Apolice.where("page IS NULL and (ramo IS NOT NULL and produto IS NOT NULL and apolice IS NOT NULL)").page(params[:page]).per(10).order("id DESC")
    end
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
    if !params[:id].blank?
       apolice = Apolice.find(params[:id])
       
       @apolice.ramo = apolice.ramo
       @apolice.produto = apolice.produto
       @apolice.apolice = apolice.apolice
       @apolice.item = apolice.item
       @apolice.data_proposta = apolice.data_proposta
       @apolice.vig_inicio = apolice.vig_inicio
       @apolice.vig_termino = apolice.vig_termino
       @apolice.nome_segurado = apolice.nome_segurado
       @apolice.cpf = apolice.cpf
       @apolice.endereco = apolice.endereco
       @apolice.bairro = apolice.bairro
       @apolice.cidade = apolice.cidade
       @apolice.cep = apolice.cep
       @apolice.uf = apolice.uf
       @apolice.valr_adicional = apolice.valr_adicional
       @apolice.valr_custo = apolice.valr_custo
       @apolice.valr_iof = apolice.valr_iof
       @apolice.valr_premiototal = apolice.valr_premiototal
       @apolice.desc_obs = apolice.desc_obs
       @apolice.numr_mensal = apolice.numr_mensal
       @apolice.cnpj = apolice.cnpj
       @apolice.apartamento = apolice.apartamento
       @apolice.valor_franquiaportao = apolice.valor_franquiaportao
       @apolice.valor_mensal = apolice.valor_mensal
       @apolice.qtd_parcelas = apolice.qtd_parcelas
       @apolice.data_proposta = apolice.data_proposta
     end
    
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

  # GET /apolices/1/edit
  def edit

     @apolice.data_proposta = @apolice.data_proposta.strftime("%d/%m/%Y") rescue nil
     @apolice.vig_inicio = @apolice.vig_inicio.strftime("%d/%m/%Y") rescue nil
     @apolice.vig_termino = @apolice.vig_termino.strftime("%d/%m/%Y") rescue nil

  end

  # POST /apolices
  # POST /apolices.json
  def create
    @apolice = Apolice.new(apolice_params)

    respond_to do |format|
      if @apolice.save

        if @apolice.page == "aditivo"
          format.html { redirect_to aditivos_path, notice: 'Cadastro realizado com sucesso.' }
          format.json { render :show, status: :created, location: @apolice }
        else
          format.html { redirect_to @apolice, notice: 'Cadastro realizado com sucesso.' }
          format.json { render :show, status: :created, location: @apolice }
        end

      
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

        if @apolice.page == "aditivo"
          format.html { redirect_to aditivos_path, notice: 'Registro alterado com sucesso.' }
          format.json { render :show, status: :ok, location: @apolice }      
        else
          format.html { redirect_to @apolice, notice: 'Registro alterado com sucesso.' }
          format.json { render :show, status: :ok, location: @apolice }  
        end
      else

        if @apolice.page == "aditivo"
          format.html { render :edit }
          format.json { render json: @apolice.errors, status: :unprocessable_entity }   
        else
          format.html { render :edit }
          format.json { render json: @apolice.errors, status: :unprocessable_entity }
        end     
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
      params.require(:apolice).permit(:ramo, :produto, :apolice, :item, :data_proposta, :vig_inicio, :vig_termino, :nome_segurado, :cpf, :endereco, :cidade, :bairro, :cep, :uf, :valr_premioliquido, :valr_adicional, :valr_custo, :valr_iof, :valr_premiototal, :desc_obs, :numr_mensal, :cnpj, :apartamento, :page, :valor_franquiaportao, :valor_mensal, :qtd_parcelas, :data_propostaaceita)
    end
end
