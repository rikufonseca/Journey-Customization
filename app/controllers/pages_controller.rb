class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
<<<<<<< HEAD
=======

>>>>>>> 0ca1928a80d9bfa173e16892935618f90859d775
  def home
  end

  def dashboard
    @user = current_user
  end
end
