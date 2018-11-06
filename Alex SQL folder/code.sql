WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT ft.user_id,
    ft.first_touch_at,
    pv.utm_source,
		pv.utm_campaign
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp;



select utm_campaign
from page_visits
group by utm_campaign;

select count(distinct utm_campaign) as 'number of campaigns'
from page_visits;


select utm_source
from page_visits
group by utm_source;


select count(distinct utm_source) as 'number of sources'
from page_visits;

select utm_source, utm_campaign
from page_visits
group by 2
order by 1 asc;




SELECT DISTINCT page_name
from page_visits
;



WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id),
 ft_attr AS (   
  SELECT ft.user_id,
         ft.first_touch_at,
         pv.utm_source,
         pv.utm_campaign
  FROM first_touch as ft
  JOIN page_visits as pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
)
SELECT ft_attr.utm_source,
       ft_attr.utm_campaign,
       COUNT(*)
FROM ft_attr
GROUP BY  2
ORDER BY 3 DESC;




WITH last_touch AS (
    SELECT user_id,
        max(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id),
 lt_attr AS (   
  SELECT lt.user_id,
         lt.last_touch_at,
         pv.utm_source,
         pv.utm_campaign
  FROM last_touch as lt
  JOIN page_visits as pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
)
SELECT lt_attr.utm_source,
       lt_attr.utm_campaign,
       COUNT(*)
FROM lt_attr
GROUP BY  2
ORDER BY 3 DESC;





select count(*)
from page_visits
where page_name = '4 - purchase'
;

select *
from page_visits
where page_name = '4 - purchase'
;





WITH last_touch AS (
    SELECT user_id,
        max(timestamp) as last_touch_at
    FROM page_visits
  WHERE page_name = '4 - purchase'
    GROUP BY user_id),
 lt_attr AS (   
  SELECT lt.user_id,
         lt.last_touch_at,
         pv.utm_source,
         pv.utm_campaign
  FROM last_touch as lt
  JOIN page_visits as pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
)
SELECT lt_attr.utm_source,
       lt_attr.utm_campaign,
       COUNT(*)
FROM lt_attr
GROUP BY  2
ORDER BY 3 DESC;



