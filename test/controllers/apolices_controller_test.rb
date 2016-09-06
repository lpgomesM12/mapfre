require 'test_helper'

class ApolicesControllerTest < ActionController::TestCase
  setup do
    @apolice = apolices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apolices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apolice" do
    assert_difference('Apolice.count') do
      post :create, apolice: { apolice: @apolice.apolice, cep: @apolice.cep, cidade: @apolice.cidade, cpf: @apolice.cpf, data_proposta: @apolice.data_proposta, desc_obs: @apolice.desc_obs, endereco: @apolice.endereco, item: @apolice.item, nome_segurado: @apolice.nome_segurado, produto: @apolice.produto, ramo: @apolice.ramo, uf: @apolice.uf, valr_adicional: @apolice.valr_adicional, valr_custo: @apolice.valr_custo, valr_iof: @apolice.valr_iof, valr_premioliquido: @apolice.valr_premioliquido, valr_premiototal: @apolice.valr_premiototal, vig_inicio: @apolice.vig_inicio, vig_termino: @apolice.vig_termino }
    end

    assert_redirected_to apolice_path(assigns(:apolice))
  end

  test "should show apolice" do
    get :show, id: @apolice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apolice
    assert_response :success
  end

  test "should update apolice" do
    patch :update, id: @apolice, apolice: { apolice: @apolice.apolice, cep: @apolice.cep, cidade: @apolice.cidade, cpf: @apolice.cpf, data_proposta: @apolice.data_proposta, desc_obs: @apolice.desc_obs, endereco: @apolice.endereco, item: @apolice.item, nome_segurado: @apolice.nome_segurado, produto: @apolice.produto, ramo: @apolice.ramo, uf: @apolice.uf, valr_adicional: @apolice.valr_adicional, valr_custo: @apolice.valr_custo, valr_iof: @apolice.valr_iof, valr_premioliquido: @apolice.valr_premioliquido, valr_premiototal: @apolice.valr_premiototal, vig_inicio: @apolice.vig_inicio, vig_termino: @apolice.vig_termino }
    assert_redirected_to apolice_path(assigns(:apolice))
  end

  test "should destroy apolice" do
    assert_difference('Apolice.count', -1) do
      delete :destroy, id: @apolice
    end

    assert_redirected_to apolices_path
  end
end
