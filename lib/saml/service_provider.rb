module SAML
  class ServiceProvider
    
    def initialize(id_provider)
      @id_provider      = id_provider
      @session_register = SessionRegister.new
    end

    def register_session(session)
      @session_register.add(session)
    end

    def session_exists?(id)
      @session_register.exists?(id)
    end

    def login
      user = @id_provider.login
      register_session(Session.new(user.session_id))
      user
    end

    def logout(id)
      if @session_register.exists?(id)
        @session_register.remove(id)
        @id_provider.logout(id)
      end
    end

  end
end
