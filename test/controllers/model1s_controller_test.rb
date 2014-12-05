require 'test_helper'

class Model1sControllerTest < ActionController::TestCase
  setup do
    @model1 = model1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:model1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create model1" do
    assert_difference('Model1.count') do
      post :create, model1: { name: @model1.name, surname: @model1.surname }
    end

    assert_redirected_to model1_path(assigns(:model1))
  end

  test "should show model1" do
    get :show, id: @model1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @model1
    assert_response :success
  end

  test "should update model1" do
    patch :update, id: @model1, model1: { name: @model1.name, surname: @model1.surname }
    assert_redirected_to model1_path(assigns(:model1))
  end

  test "should destroy model1" do
    assert_difference('Model1.count', -1) do
      delete :destroy, id: @model1
    end

    assert_redirected_to model1s_path
  end
end
