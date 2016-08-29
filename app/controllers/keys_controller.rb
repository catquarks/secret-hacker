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

  def destroy
    # @secret = Secret.find(params[:id])
    key = Key.find(params[:id])
    secret = Secret.find(params[:id])
    flash[:notice]="Secret ##{secret.id} was deleted: '#{secret.content}'"
    key.destroy
    secret.destroy
    redirect_to :dashboard
  end


  def new
    # @secret=Secret.new
    @key=Key.new
  end

  def create
    @key=Key.new(key_params)
    @secret=@key.secret
    @secret.key=@key
    @category = Category.find(key_params[:secret_attributes][:category_id])
    @secret.category = @category
		if @key.save && @secret.save && @category.save
  			current_user.keys<<@key
        flash[:notice]= "You created a new secret!"
  			redirect_to secret_path(@secret)
    else
      render :new
		end
  end

  private

  def key_params
      params.require(:key).permit(:string, :secret_attributes => [:content, :category_id])
  end

end
