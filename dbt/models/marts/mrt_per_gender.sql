SELECT gender ,count(gender) cnt, 
(select count(*) as cnt_all 
from {{ ref('starbucks_satisfactory') }}) as cnt_all,
round((count(gender) * 100)::numeric / (select count(*) from {{ ref('starbucks_satisfactory') }}), 2) AS percent
from {{ ref('starbucks_satisfactory') }}
group by gender
order by cnt