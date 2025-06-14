# Exercício: Sistema de Vendas

### Objetivo:

Implemente uma classe SalesReport que recebe uma lista de
vendas no formato abaixo
```ruby
sales = [
{ product: "Notebook", category: "Eletrônicos", amount: 3000 },
{ product: "Celular", category: "Eletrônicos", amount: 1500 },
{ product: "Cadeira", category: "Móveis", amount: 500 },
{ product: "Mesa", category: "Móveis", amount: 1200 },
{ product: "Headphone", category: "Eletrônicos", amount: 300 },
{ product: "Armário", category: "Móveis", amount: 800 }
]
```

Implemente a classe com as seguintes responsabilidades:
1. Incluir `Enumerable` e implementar `#each` para iterar
sobre as vendas.
2. Um método `#total_by_category` que retorna um hash com
o total de vendas por categoria.
3. Um método `#top_sales(n)` que retorna os n maiores
valores de venda.
4. Um método `#grouped_by_category` que retorna um hash
com os produtos agrupados por categoria.
5. Um método `#above_average_sales` que retorna as vendas
cujo valor está acima da média geral.