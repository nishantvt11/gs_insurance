{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['transaction_id', 'created_at'],
    partition_by= ['load_date','charged_party'],
    file_format='delta'
)}}

{% set premium_transactions = source('public_transactions_data', 'premium_transactions_ap') %}

SELECT
    CAST(transaction_id AS STRING) AS transaction_id,
    STRFTIME(STRPTIME(created_at, '%m/%d/%Y %H:%M:%S'), '%Y-%m-%d %H:%M:%S') AS created_at,
    CAST(premium_amount AS FLOAT) AS premium_amount,
    CAST(premium_currency AS STRING) AS premium_currency,
    CAST(charged_party AS STRING) AS charged_party,
    CAST(status AS STRING) AS status,
    month,
    CURRENT_DATE() AS load_date
FROM {{premium_transactions}}
---Only appends the new records if created_at in source is greater than the max created_at in table
{% if is_incremental() %}
    WHERE created_at > (SELECT max(created_at) FROM {{ this }})
{% endif %}
