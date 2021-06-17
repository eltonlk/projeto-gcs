class TenantController < ApplicationController

  set_current_tenant_through_filter

  before_action :set_user_as_tenant

  def set_user_as_tenant
    set_current_tenant current_user
  end
end
