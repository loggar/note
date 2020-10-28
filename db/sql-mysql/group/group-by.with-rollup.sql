SELECT year, SUM(sales) FROM booksales GROUP BY year WITH ROLLUP;

SELECT country, year, genre, SUM(sales) 
  FROM booksales GROUP BY country, year, genre WITH ROLLUP LIMIT 4;

SELECT country, year, genre, SUM(sales) 
  FROM booksales GROUP BY country, year DESC, genre WITH ROLLUP;
  