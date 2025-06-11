class Settings
  def initialize
    @all_settings = {}
  end

  def add(setting_name, value, **args)
    @all_settings[setting_name] = value
    instance_variable_set(:"@#{setting_name}", value)

    define_singleton_method(setting_name) do
      instance_variable_get(:"@#{setting_name}")
    end

    define_alias(setting_name, args) if args.include?(:alias)
    define_setter(setting_name) unless args[:readonly]
  end

  def all
    puts @all_settings
  end

  private

  def define_setter(setting_name)
    define_singleton_method("#{setting_name}=") do |name|
      instance_variable_set(:"@#{setting_name}", name)
    end
  end

  def define_alias(setting_name, args)
    define_singleton_method(args[:alias]) do
      instance_variable_get(:"@#{setting_name}")
    end
  end

  def method_missing(name, *_args)
    if name.to_s.include?('=')
      puts "Erro: configuração #{name.to_s.chomp('=')} é somente leitura"
    else
      "Configuração #{name} não existe."
    end
  end
end


settings = Settings.new
# Definindo configurações dinamicamente
settings.add(:timeout, 30)
settings.add(:mode, "production")

# Acessando configurações via método
puts settings.timeout # => 30
puts settings.mode # => "production"

# Tentando acessar configuração inexistente
puts settings.retry # => "Configuração 'retry' não existe."

# Checando se um método está disponível
puts settings.respond_to?(:timeout) # => true
puts settings.respond_to?(:retry) # => false

# Permita definir um alias para uma configuração, de modo
# que múltiplos métodos retornem o mesmo valor:
settings.add(:timeout, 30, alias: :espera)
puts settings.timeout # => 30
puts settings.espera # => 30

# Permita que certas configurações sejam marcadas como
# somente leitura (read-only), e causem erro se alguém
# tentar sobrescrevê-las:
settings.add(:api_key, "SECRET", readonly: true)
puts settings.api_key
settings.api_key = "HACKED" # => Erro: configuração 'api_key' é somente leitura
puts settings.api_key

# Adicione um método all que retorna um hash com todas as
# configurações definidas:
settings.all # => { timeout: 30, mode: "production", api_key: "SECRET" }

# Opcionalmente, permita alterar valores por setters
# dinâmicos (settings.timeout = 60), exceto se o campo
# for read-only:
settings.timeout = 60
puts settings.timeout # => 60