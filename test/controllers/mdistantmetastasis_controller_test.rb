require 'test_helper'

class MdistantmetastasisControllerTest < ActionController::TestCase
  setup do
    @mdistantmetastasi = mdistantmetastasis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mdistantmetastasis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mdistantmetastasi" do
    assert_difference('Mdistantmetastasi.count') do
      post :create, mdistantmetastasi: { name: @mdistantmetastasi.name }
    end

    assert_redirected_to mdistantmetastasi_path(assigns(:mdistantmetastasi))
  end

  test "should show mdistantmetastasi" do
    get :show, id: @mdistantmetastasi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mdistantmetastasi
    assert_response :success
  end

  test "should update mdistantmetastasi" do
    patch :update, id: @mdistantmetastasi, mdistantmetastasi: { name: @mdistantmetastasi.name }
    assert_redirected_to mdistantmetastasi_path(assigns(:mdistantmetastasi))
  end

  test "should destroy mdistantmetastasi" do
    assert_difference('Mdistantmetastasi.count', -1) do
      delete :destroy, id: @mdistantmetastasi
    end

    assert_redirected_to mdistantmetastasis_path
  end
end
