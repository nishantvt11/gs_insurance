{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['party', 'month'],
    partition_by= ['month', 'party'],
    file_format='delta'
)}}

{% set premium_transactions_ss = ref('premium_transactions_enriched_ss') %}

SELECT
    party,
    month,
    ROUND(SUM(amount),2) AS premium,
    CURRENT_DATE() AS load_date
FROM {{premium_transactions_ss}}
WHERE status = 'processed' --Only include processed transactions
---Only appends the new records if load_date in source is greater than the max load_date in table
{% if is_incremental() %}
    WHERE load_date > (SELECT max(load_date) FROM {{ this }})
{% endif %}

GROUP BY
    party,
    month