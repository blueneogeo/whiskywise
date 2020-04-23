# frozen_string_literal: true

require 'test_helper'

# test the static pages
class PageControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/'
    assert_response :success
  end

  test 'should render react hello world component' do
    get '/about'
    assert_equal 200, response.status

    # assert rendered react component and check the props
    assert_react_component 'HelloWorld' do |props|
      assert_equal 'Hello from react-rails.', props[:greeting]
      assert_equal 'react-rails', props[:info][:name]
      assert_select '[class=?]', 'hello-world'
    end

    # or just assert component rendered
    assert_react_component 'HelloWorld'
  end
end
