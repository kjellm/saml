module SAML

  class Session

    attr_reader :id
    
    def initialize(id)
      @id = id
      @participants = []
    end

    def add_participant(service_provider)
      @participants << service_provider
    end

    def logout_participants
      @participants.each { |p| p.logout(@id) }
    end

  end

end
