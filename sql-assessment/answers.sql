-- 1. Write a query to get the sum of impressions by day.
SELECT date, SUM(impressions) AS total_impressions
FROM marketing_performance
GROUP BY date;

-- 2. Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?
SELECT state, SUM(revenue) AS total_revenue
FROM website_revenue
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 3;
-- The third best state, Ohio, generated $37,577.

-- -- 3. Write a query that shows total cost, impressions, clicks, and revenue of each campaign. Make sure to include the campaign name in the output.
SELECT ci.name AS campaign_name, 
        SUM(mp.cost) AS total_cost,
        SUM(mp.impressions) AS total_impressions,
        SUM(mp.clicks) AS total_clicks,
        SUM(wr.revenue) AS total_revenue
FROM campaign_info ci
LEFT JOIN marketing_performance mp ON ci.id = mp.campaign_id
LEFT JOIN website_revenue wr ON ci.id = wr.campaign_id
GROUP BY ci.name;

-- -- 4. Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?
SELECT geo as state, SUM(conversions) AS total_conversions
FROM marketing_performance
WHERE campaign_id = '99058240'
GROUP BY geo
ORDER BY total_conversions DESC;


-- -- 5. In your opinion, which campaign was the most efficient, and why?
SELECT campaign_id, SUM(conversions) AS total_conversions
FROM marketing_performance
GROUP BY campaign_id
ORDER BY total_conversions DESC;
--  Campaign3, using number of conversions as a success rate.

-- -- 6. Write a query that showcases the best day of the week (e.g., Sunday, Monday, Tuesday, etc.) to run ads.
SELECT strftime('%w', date) AS day_of_week, SUM(clicks) AS total_clicks
FROM marketing_performance
GROUP BY day_of_week
ORDER BY total_clicks DESC
LIMIT 1;