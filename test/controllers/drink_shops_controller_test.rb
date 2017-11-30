require 'test_helper'

class DrinkShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drink_shop = drink_shops(:one)
  end

  test "should get index" do
    get drink_shops_url
    assert_response :success
  end

  test "should get new" do
    get new_drink_shop_url
    assert_response :success
  end

  test "should create drink_shop" do
    assert_difference('DrinkShop.count') do
      post drink_shops_url, params: { drink_shop: {  } }
    end

    assert_redirected_to drink_shop_url(DrinkShop.last)
  end

  test "should show drink_shop" do
    get drink_shop_url(@drink_shop)
    assert_response :success
  end

  test "should get edit" do
    get edit_drink_shop_url(@drink_shop)
    assert_response :success
  end

  test "should update drink_shop" do
    patch drink_shop_url(@drink_shop), params: { drink_shop: {  } }
    assert_redirected_to drink_shop_url(@drink_shop)
  end

  test "should destroy drink_shop" do
    assert_difference('DrinkShop.count', -1) do
      delete drink_shop_url(@drink_shop)
    end

    assert_redirected_to drink_shops_url
  end
end
