require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "Make sure a user can only see his/her tasks." do
    session[:user_id]  = users(:ada).id
    get :show, id: tasks(:adas_task).id

    assert_response :success
  end

  test "Make sure a user cannot see another user's tasks." do
    session[:user_id] = users(:babbage).id
    get :show, id: tasks(:adas_task).id

    assert_response :redirect
    assert_equal flash[:notice], "You do not have access to that task."
  end
  #task migration so tasks have users and users have many tasks
  #users can log in and track their on tasks
  #practice writing basic tests

end
