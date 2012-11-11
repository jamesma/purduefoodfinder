class RegistrationsController < Devise::RegistrationsController

  protected

    # Overriding the update_path method after successful edit of an user's profile
    def after_update_path_for(resource)
      user_path(resource)
    end
end