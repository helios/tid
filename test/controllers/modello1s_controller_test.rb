require 'test_helper'

class Modello1sControllerTest < ActionController::TestCase
  setup do
    @modello1 = modello1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modello1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modello1" do
    assert_difference('Modello1.count') do
      post :create, modello1: { first: @modello1.first, name: @modello1.name }
    end

    assert_redirected_to modello1_path(assigns(:modello1))
  end

  test "should show modello1" do
    get :show, id: @modello1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modello1
    assert_response :success
  end

  test "should update modello1" do
    patch :update, id: @modello1, modello1: { first: @modello1.first, name: @modello1.name }
    assert_redirected_to modello1_path(assigns(:modello1))
  end

  test "should destroy modello1" do
    assert_difference('Modello1.count', -1) do
      delete :destroy, id: @modello1
    end

    assert_redirected_to modello1s_path
  end
end
