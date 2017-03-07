require 'spec_helper'
include Warden::Test::Helpers
include ActionView::Helpers::NumberHelper
include ApplicationHelper

module FeatureHelpers
  def criar_usuario_logado
    user = FactoryGirl.create(:user)
    login(user)
    user
  end

  def login(user)
    login_as user, :scope => :user
  end

  def usuario_admin
    User.admins.ativos.first
  end

  def logout
    logout(:user)
  end

  def fill_date(selector, options)
    page.driver.execute_script "$('#{selector}').val('#{options.fetch(:with)}')"
  end
end
