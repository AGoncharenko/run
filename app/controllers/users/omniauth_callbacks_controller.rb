class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    facebook_info = {
        :uid => request.env["omniauth.auth"]["extra"]["raw_info"]["id"],
        :gender => request.env["omniauth.auth"]["extra"]["raw_info"]["gender"],
        :date_of_birth => (Date.strptime(request.env["omniauth.auth"]["extra"]["raw_info"]["birthday"], '%m/%d/%Y') if request.env["omniauth.auth"]["extra"]["raw_info"]["birthday"]),
        :avatar_url => request.env["omniauth.auth"]["info"]["image"],
        :provider => "facebook",
        :first_name => request.env["omniauth.auth"]["info"]["first_name"],
        :last_name => request.env["omniauth.auth"]["info"]["last_name"],
        :email => request.env["omniauth.auth"]["info"]["email"],
        :type => request.env["omniauth.params"]["type"]
    }.delete_if { |k, v| v.nil? }
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(facebook_info)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  end
end
