class KeysController < ApplicationController

  def acquire

    @key=Key.find_by(string:params[:string])
    if @key
      if current_user.keys.any?{|key| key.string==@key.string}
        flash[:notice]= "You already used that key!"
        redirect_to dashboard_path
      else
      current_user.keys<<@key
      flash[:notice]= "You got a new Secret!"
      # binding.pry
      redirect_to secret_path(@key.secret)
      end
    else
      flash[:notice]="Incorrect key!"
      redirect_to dashboard_path
    end
  end

end
