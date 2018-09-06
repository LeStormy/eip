class HomeController < ApplicationController
  def index
    @last_log = Devlog.where(public: true).order(:created_at).last
  end
end
