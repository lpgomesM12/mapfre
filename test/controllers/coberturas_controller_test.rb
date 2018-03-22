require 'test_helper'

class CoberturasControllerTest < ActionController::TestCase
  setup do
    @cobertura = coberturas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coberturas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cobertura" do
    assert_difference('Cobertura.count') do
      post :create, cobertura: { nome: @cobertura.nome, valor: @cobertura.valor, valor_franquia: @cobertura.valor_franquia }
    end

    assert_redirected_to cobertura_path(assigns(:cobertura))
  end

  test "should show cobertura" do
    get :show, id: @cobertura
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cobertura
    assert_response :success
  end

  test "should update cobertura" do
    patch :update, id: @cobertura, cobertura: { nome: @cobertura.nome, valor: @cobertura.valor, valor_franquia: @cobertura.valor_franquia }
    assert_redirected_to cobertura_path(assigns(:cobertura))
  end

  test "should destroy cobertura" do
    assert_difference('Cobertura.count', -1) do
      delete :destroy, id: @cobertura
    end

    assert_redirected_to coberturas_path
  end
end
