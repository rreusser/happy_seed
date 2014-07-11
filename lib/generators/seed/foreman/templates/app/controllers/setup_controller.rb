class SetupController < ApplicationController
  before_filter :require_local!

  def index
    @env = File.read( File.join( Rails.root, ".env" ) )
    @docs = files
  end
  
  protected

  def require_local!
    unless local_request?
      render text: '<p>For security purposes, this information is only available to local requests.</p>', status: :forbidden
    end
  end

  def local_request?
    Rails.application.config.consider_all_requests_local || request.local?
  end

  def files
    docs = Dir.glob(File.join( Rails.root, "doc/README.*" )).collect do |file|
      name = file.gsub( /.*README.\d\d./, "seed:" ).gsub( /.rdoc/, "" )
      html = RDiscount.new( File.read( file ) ).to_html
      { name: name, html: html }
    end
  end
end
