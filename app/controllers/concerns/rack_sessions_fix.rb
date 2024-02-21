module RackSessionsFix
  extend ActiveSupport::Concern

  class FakeRackSession < Hash
    def enabled?
      false
    end

    def destroy; end
  end

  included do
    before_action :set_rack_session

    private

    def set_rack_session
      request.env['rack.session'] ||= FakeRackSession.new 
    end

  end

end