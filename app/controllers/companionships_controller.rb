class CompanionshipsController < ApplicationController
  def create
    @companionship = current_user.companionships.build(:companion_id => params[:companion_id])
    if @companionship.save
      flash[:notice] = "Added companion."
      redirect_to root_url
    else
      flash[:error] = "Unable to add companion."
      redirect_to current_user
    end
  end

  def destroy
    @companionship = current_user.companionships.find(params[:id])
    @companionship.destroy
    flash[:notice] = "Removed companion."
    redirect_to current_user
  end
end
