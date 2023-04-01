--O OVER é uma função de janela (window function) do SQL que permite executar cálculos em uma coluna, com base em um conjunto de linhas definido por uma cláusula de PARTITION BY.
--Por exemplo, podemos utilizar a função OVER para calcular uma média móvel em uma coluna. A sintaxe básica para utilizar a função OVER é a seguinte:

SELECT coluna1, coluna2, ..., 
       AVG(coluna3) OVER (PARTITION BY coluna4 ORDER BY coluna5)
FROM tabela;
--Neste exemplo, a função AVG é aplicada à coluna 3 e o cálculo é feito para cada conjunto de linhas definido pela coluna 4. A cláusula ORDER BY é opcional e define a ordem em que as linhas serão processadas.

---

--A cláusula PARTITION BY é fundamental para o uso do OVER, pois ela define as partições em que a função será aplicada. Por exemplo, se utilizarmos a seguinte query:

SELECT coluna1, coluna2, coluna3, 
       AVG(coluna3) OVER (PARTITION BY coluna1)
FROM tabela;

SELECT customer_id, order_date, order_total,
       AVG(order_total) OVER (PARTITION BY customer_id ORDER BY order_date) as avg_total
FROM orders;

--Será calculada a média da coluna 3 para cada valor distinto na coluna 1, gerando uma coluna adicional com os resultados. Essa funcionalidade é particularmente útil para casos em que precisamos calcular estatísticas para grupos de linhas, sem a necessidade de realizar um GROUP BY.

---

--Segue abaixo um exemplo de código que ilustra o uso do OVER com PARTITION BY:
SELECT customer_id, order_date, order_total,
       AVG(order_total) OVER (PARTITION BY customer_id ORDER BY order_date) as avg_total
FROM orders;

--Neste exemplo, o cálculo da média do total de pedidos (order_total) é feito para cada cliente (customer_id), ordenado por data (order_date).


--Em resumo, o uso do OVER com PARTITION BY é uma funcionalidade muito útil para a realização de cálculos em grupos de linhas, sem a necessidade de realizar um GROUP BY.
