class VersionsController < ApplicationController

  before_action :set_version

  def show
    @post = @version.reify
  end

  private
    def set_version
      @version = PaperTrail::Version.find(params[:id])
    end
end
