class AwardsController < ApplicationController
  respond_to :html, :xml, :js
  before_filter :authenticate_user

  def create
    award = Award.find_or_create_by_refinery_wine_groups_wine_group_item_id(params['wine_group_item_id'])
    award.refinery_member_id = current_user.id
    award.award = params['award']
    if award.save!
      render :json => award, :status => :ok
    else
      render :json => award, :status => :unprocessable_entity
    end
  end

end
