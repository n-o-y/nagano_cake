class Admin::ApplicationController < ApplicationController
before_action :authenticate_admin_admin!, except: [:admin_admins_sessions_new]

end
