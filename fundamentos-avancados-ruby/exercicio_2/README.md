# Exercício: Classe Vector2
### Objetivo:
Criar uma classe Vector2 que receba dois parâmetros (X e
Y) e permita a multiplicação desse Vector2 por objetos do
tipo Numeric e Vector2.

### Enunciado:
Implemente uma classe Vector2 com o seguinte
comportamento:
```ruby
class Vector2
# code
end
v = Vector2.new(3, 4)
puts v * 2 # Output: (6, 8)
puts v * 2.5 # Output: (7.5, 10.0)
puts v * v # Output: 25 (dot product)
puts 2 * v # Output: (6, 8)
puts 2.5 * v # Output: (7.5, 10.0)
```
# Exercício: HtmlBuilder com tags aninhadas

### Objetivo:

Modificar a classe HtmlBuilder vista em aula a fim de permitir a construção de HTMLs mais complexos.

### Enunciado:
Altere a classe abaixo:

```ruby
class HtmlBuilder
  def initialize(&block)
    @html = ""
    instance_eval(&block) if block_given?
  end

  def div(content)
    @html << "<div>#{content}</div>\n"
  end

  def span(content)
    @html << "<span>#{content}</span>\n"
  end

  def result
    @html
  end
end
```

Após alterar, a classe deve ser capaz de executar
corretamente o seguinte input:
```ruby
builder = HtmlBuilder.new do
  div do
    div "Conteúdo em div"
    span "Nota em div"
  end
    span "Nota de rodapé"
end
```
Obs.: não precisa se preocupar em formatar corretamente o HTML gerado, então uma saída assim:

`<div><div></div><span></span></div>`

será aceita sem problemas.