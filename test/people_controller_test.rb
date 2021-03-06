require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  def test_action
    get :list
    assert_response :success

    get :list, params: {format: :csv}
    assert_response :success

    get :list, params: {format: :ods}
    assert_response :success
  end

  test 'rendering on empty list' do
    Person.destroy_all
    get :list
  end

  test 'parameters' do
    get :list, params: {'people-id' => 10}
    assert_response :success

    get :list, params: {page: 0}
    assert_response :success

    get :list, params: {page: 5, per_page: 25}
    assert_response :success

    get :list, params: {page: 50, per_page: 25}
    assert_response :success

    get :list, params: {page: 500, per_page: 25}
    assert_response :success
  end
end

# # module WithinController
#   include AppMockHelper
#   # mock_app

#   module MyTestingApp
#     class Application < Rails::Application
#     end
#   end

#   class PeopleController < ActionController::Base
#     layout nil

#     include ActiveList::ActionController
#     list

#     def index
#       render :inline => "<h1></h1><%=list-%>"
#     end
#   end

#   class PeopleControllerTest < ActionController::TestCase # Test::Unit::TestCase

#     def setup
#       @routes = ActionDispatch::Routing::RouteSet.new
#       @routes.draw do
#         resources :people do
#           get :list, :on => :collection
#         end
#         resources :contacts
#       end
#     end

#     def test_action
#       get :list
#       # raise @response
#       # assert _response :success
#     end

#   end
# # end
