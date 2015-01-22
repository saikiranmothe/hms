require 'test_helper'

class KoMedicationReviewsControllerTest < ActionController::TestCase
  setup do
    @ko_medication_review = ko_medication_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ko_medication_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ko_medication_review" do
    assert_difference('KoMedicationReview.count') do
      post :create, ko_medication_review: { condition_id: @ko_medication_review.condition_id, description: @ko_medication_review.description, is_anonymous: @ko_medication_review.is_anonymous, rating: @ko_medication_review.rating, title: @ko_medication_review.title, user_id: @ko_medication_review.user_id }
    end

    assert_redirected_to ko_medication_review_path(assigns(:ko_medication_review))
  end

  test "should show ko_medication_review" do
    get :show, id: @ko_medication_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ko_medication_review
    assert_response :success
  end

  test "should update ko_medication_review" do
    patch :update, id: @ko_medication_review, ko_medication_review: { condition_id: @ko_medication_review.condition_id, description: @ko_medication_review.description, is_anonymous: @ko_medication_review.is_anonymous, rating: @ko_medication_review.rating, title: @ko_medication_review.title, user_id: @ko_medication_review.user_id }
    assert_redirected_to ko_medication_review_path(assigns(:ko_medication_review))
  end

  test "should destroy ko_medication_review" do
    assert_difference('KoMedicationReview.count', -1) do
      delete :destroy, id: @ko_medication_review
    end

    assert_redirected_to ko_medication_reviews_path
  end
end
