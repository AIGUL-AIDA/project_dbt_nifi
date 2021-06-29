SELECT nearest_place ,count(nearest_place) cnt, 
(select count(*) as cnt_all 
from {{ ref('starbucks_satisfactory') }}) as cnt_all,
round((count(currently) * 100)::numeric / (select count(*) from {{ ref('starbucks_satisfactory') }}), 2) AS percent
from {{ ref('starbucks_satisfactory') }}
group by nearest_place
order by cnt