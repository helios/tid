require 'test_helper'

class CelltypesControllerTest < ActionController::TestCase
  setup do
    @celltype = celltypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:celltypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create celltype" do
    assert_difference('Celltype.count') do
      post :create, celltype: { label: @celltype.label }
    end

    assert_redirected_to celltype_path(assigns(:celltype))
  end

  test "should show celltype" do
    get :show, id: @celltype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @celltype
    assert_response :success
  end

  test "should update celltype" do
    patch :update, id: @celltype, celltype: { label: @celltype.label }
    assert_redirected_to celltype_path(assigns(:celltype))
  end

  test "should destroy celltype" do
    assert_difference('Celltype.count', -1) do
      delete :destroy, id: @celltype
    end

    assert_redirected_to celltypes_path
  end
end
