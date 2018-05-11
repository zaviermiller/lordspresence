class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.group_id == nil && current_user.group_code != ""
      @group = Group.find_by(group_code: current_user.group_code)
      current_user.group_id = @group.id
      current_user.save!
    end
  end
end
