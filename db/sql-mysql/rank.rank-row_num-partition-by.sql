SELECT YEAR
  , QUARTER
  , AMOUNT
  , RANC() OVER (ORDER BY AMOUNT DESC) AS AMOUNT_RANK
FROM TEST_TABLE


SELECT YEAR
  , QUARTER
  , AMOUNT
  , DENSE_RANK() OVER (ORDER BY AMOUNT DESC) AS AMOUNT_RANK
FROM TEST_TABLE


SELECT YEAR
  , QUARTER
  , AMOUNT
  , ROW_NUMBER() OVER (ORDER BY AMOUNT DESC) AS AMOUNT_RANK
FROM TEST_TABLE


SELECT YEAR
  , QUARTER
  , AMOUNT
  , RANK() OVER (PARTITION BY YEAR ORDER BY AMOUNT DESC) AS PARTITION_YEAR_AMOUNT_RANK
FROM TEST_TABLE


SELECT YEAR
  , QUARTER
  , AMOUNT
  , NTILE(6) OVER (ORDER BY AMOUNT DESC) AS AMOUNT_RANK_NTILE_6
FROM TEST_TABLE