require 'test_helper'

class PrescriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get prescriptions_update_url
    assert_response :success
  end

  test "should get delete" do
    get prescriptions_delete_url
    assert_response :success
  end

  test "should get destroy" do
    get prescriptions_destroy_url
    assert_response :success
  end

end
