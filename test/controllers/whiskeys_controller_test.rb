# # typed: false
# require 'test_helper'

# class WhiskeysControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @whiskey = whiskeys(:one)
#   end

#   test "should get index" do
#     get whiskeys_url
#     assert_response :success
#   end

#   test "should get new" do
#     get new_whiskey_url
#     assert_response :success
#   end

#   test "should create whiskey" do
#     assert_difference('Whiskey.count') do
#       post whiskeys_url, params: { whiskey: { description: @whiskey.description, name: @whiskey.name, rate_color: @whiskey.rate_color, rate_smokey: @whiskey.rate_smokey, rate_taste: @whiskey.rate_taste, user_id: @whiskey.user_id } }
#     end

#     assert_redirected_to whiskey_url(Whiskey.last)
#   end

#   test "should show whiskey" do
#     get whiskey_url(@whiskey)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_whiskey_url(@whiskey)
#     assert_response :success
#   end

#   test "should update whiskey" do
#     patch whiskey_url(@whiskey), params: { whiskey: { description: @whiskey.description, name: @whiskey.name, rate_color: @whiskey.rate_color, rate_smokey: @whiskey.rate_smokey, rate_taste: @whiskey.rate_taste, user_id: @whiskey.user_id } }
#     assert_redirected_to whiskey_url(@whiskey)
#   end

#   test "should destroy whiskey" do
#     assert_difference('Whiskey.count', -1) do
#       delete whiskey_url(@whiskey)
#     end

#     assert_redirected_to whiskeys_url
#   end
# end
