SELECT spend_per_visit,count(spend_per_visit) cnt, 
(select count(*) as cnt_all 
from {{ ref('starbucks_satisfactory') }}) as cnt_all,
round((count(spend_per_visit) * 100)::numeric / (select count(*) from {{ ref('starbucks_satisfactory') }}), 2) AS percent
from {{ ref('starbucks_satisfactory') }}
group by spend_per_visit
order by cnt