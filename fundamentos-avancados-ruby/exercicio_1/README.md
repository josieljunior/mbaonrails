# Exercício: Registro Dinâmico de Configurações

### Objetivo:
Criar uma classe Settings que permita o registro e a
leitura dinâmica de configurações, utilizando
define_method, method_missing, respond_to_missing? e
send.

### Enunciado:
Implemente uma classe Settings com a seguinte interface:

### Exemplo de uso esperado:
```ruby
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
```
### Objetivos Extras (Desafio)

1. Suporte a aliases

    Permita definir um alias para uma configuração, de modo
    que múltiplos métodos retornem o mesmo valor:
    ```ruby
    settings.add(:timeout, 30, alias: :espera)
    puts settings.timeout # => 30
    puts settings.espera # => 30
    ```

2. Configuração somente leitura

    Permita que certas configurações sejam marcadas como
    somente leitura (read-only), e causem erro se alguém
    tentar sobrescrevê-las:
    ```ruby
    settings.add(:api_key, "SECRET", readonly: true)
    settings.api_key = "HACKED" # => Erro: configuração 'api_key' é somente leitura
    ```
3. Listagem de configurações

    Adicione um método all que retorna um hash com todas as
    configurações definidas:
    ```ruby
    settings.all # => { timeout: 30, mode: "production", api_key: "SECRET" }
    ```
4. Integração com method_missing para setters

    Opcionalmente, permita alterar valores por setters
    dinâmicos (settings.timeout = 60), exceto se o campo
    for read-only:
    ```ruby
    settings.timeout = 60
    puts settings.timeout # => 60
    ```