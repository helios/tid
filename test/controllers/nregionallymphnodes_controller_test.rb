require 'test_helper'

class NregionallymphnodesControllerTest < ActionController::TestCase
  setup do
    @nregionallymphnode = nregionallymphnodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nregionallymphnodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nregionallymphnode" do
    assert_difference('Nregionallymphnode.count') do
      post :create, nregionallymphnode: {  }
    end

    assert_redirected_to nregionallymphnode_path(assigns(:nregionallymphnode))
  end

  test "should show nregionallymphnode" do
    get :show, id: @nregionallymphnode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nregionallymphnode
    assert_response :success
  end

  test "should update nregionallymphnode" do
    patch :update, id: @nregionallymphnode, nregionallymphnode: {  }
    assert_redirected_to nregionallymphnode_path(assigns(:nregionallymphnode))
  end

  test "should destroy nregionallymphnode" do
    assert_difference('Nregionallymphnode.count', -1) do
      delete :destroy, id: @nregionallymphnode
    end

    assert_redirected_to nregionallymphnodes_path
  end
end
