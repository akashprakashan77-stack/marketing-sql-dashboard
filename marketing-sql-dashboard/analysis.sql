-- Leads + conversions + revenue + ROI

SELECT 
    campaigns.campaign_name,
    COUNT(leads.lead_id) AS total_leads,

    SUM(CASE 
        WHEN leads.status = 'converted' THEN 1 
        ELSE 0 
    END) AS conversions,

    SUM(sales.amount) AS total_revenue,

    ROUND(COALESCE(SUM(sales.amount), 0) / campaigns.budget, 2) AS ROI

FROM leads

JOIN campaigns 
ON leads.campaign_id = campaigns.campaign_id

LEFT JOIN sales 
ON leads.lead_id = sales.lead_id

GROUP BY campaigns.campaign_name, campaigns.budget;