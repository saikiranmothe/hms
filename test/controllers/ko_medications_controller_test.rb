require 'test_helper'

class KoMedicationsControllerTest < ActionController::TestCase
  setup do
    @ko_medication = ko_medications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ko_medications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ko_medication" do
    assert_difference('KoMedication.count') do
      post :create, ko_medication: { description: @ko_medication.description, name: @ko_medication.name }
    end

    assert_redirected_to ko_medication_path(assigns(:ko_medication))
  end

  test "should show ko_medication" do
    get :show, id: @ko_medication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ko_medication
    assert_response :success
  end

  test "should update ko_medication" do
    patch :update, id: @ko_medication, ko_medication: { description: @ko_medication.description, name: @ko_medication.name }
    assert_redirected_to ko_medication_path(assigns(:ko_medication))
  end

  test "should destroy ko_medication" do
    assert_difference('KoMedication.count', -1) do
      delete :destroy, id: @ko_medication
    end

    assert_redirected_to ko_medications_path
  end
end
