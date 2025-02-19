{{
  config(
    materialized = 'view'
  )
}}

SELECT
    fd.date_date AS date,
    fd.operational_margin - icd.ads_cost AS ads_margin,
    fd.average_basket,
    fd.operational_margin,
    icd.ads_cost,
    icd.ads_impression,
    icd.ads_clicks,
    fd.quantity,
    fd.revenue,
    fd.purchase_cost,
    fd.margin,
    fd.shipping_fee,
    fd.logcost,
    fd.ship_cost
FROM {{ ref('finance_days') }} fd
JOIN {{ ref('int_campaigns_day') }} icd
ON fd.date_date = icd.date_date