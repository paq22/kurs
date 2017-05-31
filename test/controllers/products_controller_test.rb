require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { article: @product.article, base_price: @product.base_price, current_price: @product.current_price, full_description: @product.full_description, list_id_images: @product.list_id_images, minimum_quantity: @product.minimum_quantity, quantity_in_stock: @product.quantity_in_stock, short_description: @product.short_description, title: @product.title }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { article: @product.article, base_price: @product.base_price, current_price: @product.current_price, full_description: @product.full_description, list_id_images: @product.list_id_images, minimum_quantity: @product.minimum_quantity, quantity_in_stock: @product.quantity_in_stock, short_description: @product.short_description, title: @product.title }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
