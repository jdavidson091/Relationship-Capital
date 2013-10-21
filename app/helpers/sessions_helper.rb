module SessionsHelper
  def sign_in(user)
    #create a new token
    remember_token = User.new_remember_token
    #place unencrypted token in browser cookies
    cookies.permanent[:remember_token] = remember_token
    #save the encrypted token to the database
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    #set the current user equal to the given user
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  #change the definition of the equals sign for:
  #   self.current_user = someUser
  def current_user=(user)
    @current_user = user
  end

  #define current_user
  # each time a page is refreshed or accessed,
  # make sure that the @current_user is the same user
  # logged in according to the cookie.
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    # ||= is "or equals"
    # will set @current_user only if undefined
    # equivalent to:
    #   @current_user = @current_user || [some other user]
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
