require 'test_helper'

class LotteriesControllerTest < ActionController::TestCase
  setup do
    @lottery = lotteries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lotteries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lottery" do
    assert_difference('Lottery.count') do
      post :create, lottery: { closed: @lottery.closed, final_date: @lottery.final_date, initial_date: @lottery.initial_date, vacancies: @lottery.vacancies }
    end

    assert_redirected_to lottery_path(assigns(:lottery))
  end

  test "should show lottery" do
    get :show, id: @lottery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lottery
    assert_response :success
  end

  test "should update lottery" do
    patch :update, id: @lottery, lottery: { closed: @lottery.closed, final_date: @lottery.final_date, initial_date: @lottery.initial_date, vacancies: @lottery.vacancies }
    assert_redirected_to lottery_path(assigns(:lottery))
  end

  test "should destroy lottery" do
    assert_difference('Lottery.count', -1) do
      delete :destroy, id: @lottery
    end

    assert_redirected_to lotteries_path
  end
end
