class KeysController < ApplicationController

  def aquire
    @key=Key.find_by(string:params[:string])
    if @key
      if current_user.keys.any?{|key| key.string==@key.string}
        flash[:notice]= "You already used that key!"
        redirect_to dashboard_path
      else
      current_user.keys<<@key
      flash[:notice]= "You got a new Secret!"
      redirect_to dashboard_path
      end
    else
      flash[:notice]="Incorrect key!"
      redirect_to dashboard_path
    end
  end
end
