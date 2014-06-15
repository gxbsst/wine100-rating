class WineGroupsController < ApplicationController
  respond_to :html, :xml, :js
  before_filter :authenticate_user

  def complete
    set_wine_group
    if @wine_group.update_attribute(:state, 'complete')
      redirect_to "/challenges/#{@wine_group.id}"
    end
  end

  def cancel
    set_wine_group
    if @wine_group.update_attribute(:state, 'cancel')
      redirect_to "/challenges/#{@wine_group.id}"
    end
  end

  private

  def set_wine_group
    @wine_group ||= Refinery::WineGroups::WineGroup.find(params[:id])
  end
end