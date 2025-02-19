{{
  config(
    materialized = 'view'
  )
}}

SELECT
    date_date,
    'adwords' AS source,
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
FROM {{ ref('stg_raw__adwords') }}

UNION ALL

SELECT
    date_date,
    'bing' AS source,
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
FROM {{ ref('stg_raw__bing') }}

UNION ALL

SELECT
    date_date,
    'criteo' AS source,
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
FROM {{ ref('stg_raw__criteo') }}

UNION ALL

SELECT
    date_date,
    'facebook' AS source,
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
FROM {{ ref('stg_raw__facebook') }}
