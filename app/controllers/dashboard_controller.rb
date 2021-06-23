class DashboardController < TenantController

  def index
    respond_with :dashboard
  end

end
