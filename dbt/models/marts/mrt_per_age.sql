SELECT age,count(age) cnt, 
(select count(*) as cnt_all 
FROM {{ ref('starbucks_satisfactory') }}) as cnt_all,
round((count(age) * 100)::numeric / (select count(*) FROM {{ ref('starbucks_satisfactory') }}), 2) AS percent
FROM {{ ref('starbucks_satisfactory') }}
group by age
order by cnt
