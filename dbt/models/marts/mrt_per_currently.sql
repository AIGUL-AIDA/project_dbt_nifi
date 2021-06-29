SELECT currently ,count(currently) cnt, 
(select count(*) as cnt_all 
FROM {{ ref('starbucks_satisfactory') }}) as cnt_all,
round((count(currently) * 100)::numeric / (select count(*) FROM {{ ref('starbucks_satisfactory') }}), 2) AS percent
FROM {{ ref('starbucks_satisfactory') }}
group by currently
order by cnt