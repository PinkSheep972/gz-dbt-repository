WITH sales_with_cost AS (
    SELECT
        s.products_id,
        s.date_date,
        s.orders_id,
        s.revenue,
        s.quantity,
        p.purchase_price,
        ROUND(s.quantity * p.purchase_price, 2) AS purchase_cost
    FROM {{ref("stg_raw__sales")}} s
    LEFT JOIN {{ref("stg_raw__product")}} p
        USING (products_id)
),

sales_with_margin AS (
    SELECT
        *,
        ROUND(revenue - purchase_cost, 2) AS margin
    FROM sales_with_cost
)

SELECT
    *,
    {{ margin_percent('revenue', 'purchase_cost', 2) }} AS margin_percent
FROM sales_with_margin
