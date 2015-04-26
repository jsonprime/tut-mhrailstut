require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @title_description = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    get :home
    assert_response :success
<<<<<<< HEAD
    assert_select "title", "Ruby on Rails Tutorial Sample App"
=======
    assert_select "title", "Home | #{@title_description}"
>>>>>>> static-pages-exercises
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@title_description}"
  end

  test "should get about" do
  	get :about
  	assert_response :success
  	assert_select "title", "About | #{@title_description}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@title_description}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
  end
end
