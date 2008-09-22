module AuthenticatedTestHelper
  
  def stub_login_as(login)
    user = stub_user(login)
    controller.stub!(:current_user).and_return(user);
    user
  end

  def stub_user(login)
    user = mock_model(User, :login => login, :id => 1)
    User.stub!(:find).and_return(user)
    User.stub!(:find_by_id).and_return(user)
    User.stub!(:new).and_return(user)
    user
  end
  
  def login_as(user)
    @request.session[:user_id] = user.id 
  end

 
  def authorize_as(user)
    @request.env["HTTP_AUTHORIZATION"] = user ? ActionController::HttpAuthentication::Basic.encode_credentials(users(user).login, 'test') : nil
  end
end
