require "test_helper"

class SitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site = sites(:one)
  end

  test "should get index" do
    get sites_url, as: :json
    assert_response :success
  end

  test "should create site" do
    assert_difference("Site.count") do
      post sites_url, params: { site: { little_url: @site.little_url, long_url: @site.long_url } }, as: :json
    end

    assert_response :created
  end

  test "should show site" do
    get site_url(@site), as: :json
    assert_response :success
  end

  test "should update site" do
    patch site_url(@site), params: { site: { little_url: @site.little_url, long_url: @site.long_url } }, as: :json
    assert_response :success
  end

  test "should destroy site" do
    assert_difference("Site.count", -1) do
      delete site_url(@site), as: :json
    end

    assert_response :no_content
  end
end
