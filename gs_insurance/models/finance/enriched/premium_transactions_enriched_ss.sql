{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['transaction_id', 'transaction_date'],
    partition_by= ['load_date','party'],
    file_format='delta'
)}}

{% set premium_transactions_ss = ref('premium_transactions_raw_ss') %}

SELECT
    transaction_id,
    created_at AS transaction_date,
    premium_amount AS amount,
    premium_currency AS currency,
    charged_party AS party,
    {{ fix_status('status') }} AS status,  --Fixing the status column value with a macro
    STRFTIME(STRPTIME(month, '%Y-%m'), '%Y-%b') AS month, --Converting month to YYYY-MMM format
    CURRENT_DATE() AS load_date
FROM {{premium_transactions_ss}}
---Only appends the new records if load_date in source is greater than the max load_date in table
{% if is_incremental() %}
    WHERE load_date > (SELECT max(load_date) FROM {{ this }})
{% endif %}
