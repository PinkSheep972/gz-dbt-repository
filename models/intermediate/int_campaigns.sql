{{ config(materialized='view') }}

SELECT
    date_date,
    paid_source,
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
FROM {{ ref('stg_raw__adwords') }}

UNION ALL

SELECT
    date_date,
    'bing' AS paid_source,  -- Bing n'a pas de colonne paid_source, donc nous en ajoutons une
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
FROM {{ ref('stg_raw__bing') }}

UNION ALL

SELECT
    date_date,
    'criteo' AS paid_source,  -- Criteo n'a pas de colonne paid_source, donc nous en ajoutons une
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
FROM {{ ref('stg_raw__criteo') }}

UNION ALL

SELECT
    date_date,
    'facebook' AS paid_source,  -- Facebook n'a pas de colonne paid_source, donc nous en ajoutons une
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
FROM {{ ref('stg_raw__facebook') }}
