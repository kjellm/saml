module SAML
  class SessionRegister

    def initialize
      @registry = {}
    end

    def add(session)
      @registry[session.id] = session
    end

    def remove(id)
      @registry.delete(id)
    end

    def exists?(id)
      @registry.key?(id)
    end

    def logout_participants(id)
      @registry[id].logout_participants
    end

  end
end
