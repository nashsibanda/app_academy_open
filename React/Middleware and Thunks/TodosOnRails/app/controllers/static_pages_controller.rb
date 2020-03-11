# frozen_string_literal: true

class StaticPagesController < ApplicationController
  before_action :ensure_logged_in
  
  def root; end
end
