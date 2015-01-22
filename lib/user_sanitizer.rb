class User::ParameterSanitizer &lt; Devise::ParameterSanitizer
    private
    def account_update
        default_params.permit(:role, :bio, :gender, :doner, :bloodtype, :address, :date_of_birth, :first_name, :profile_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end