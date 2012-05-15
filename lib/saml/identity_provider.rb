module SAML
  class IdentityProvider
    
    def initialize
      @session_register = SessionRegister.new
    end

    def register_session(session)
      @session_register.add(session)
    end

    def session_exists?(id)
      false
    end

    def login
      User.new
    end

    def logout(id)
      @session_register.logout_participants(id)
      @session_register.remove(id)
    end

  end
end
