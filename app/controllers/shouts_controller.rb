class ShoutsController < ApplicationController
  def create
    current_user.shouts.create(shouts_params)
    redirect_to root_path
  end
 
  private
    def shouts_params
      params.require(:shout).permit(:body)
    end
end
