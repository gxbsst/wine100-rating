class FinalAwardsController < ApplicationController
  respond_to :html, :xml, :js
  before_filter :authenticate_user
  before_filter :e_group?

  def index
   page = params[:page] || 1
   per = 50
   @wine_groups = Refinery::WineGroups::WineGroup.complete.page(page).per_page(per)
   @test_papers =  Refinery::TestPapers::TestPaper.includes(:wine).order('created_at DESC').page(page).per_page(per)
  end

  def create
    award = Award.find_or_initialize_by_wine_id(params['wine_id'])
    award.final_user_id = current_user.id
    award.final = params['final']
    if award.save!
      render :json => award, :status => :ok
    else
      render :json => award, :status => :unprocessable_entity
    end
  end

  def show
    set_wine_group
  end

  private

  def e_group?
    redirect_to root_path unless current_user.e_group?
  end

  def set_wine_group
    @wine_group ||= Refinery::WineGroups::WineGroup.find(params[:id])
  end
end
