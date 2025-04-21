<!-- markdownlint-disable MD041 -->
{% docs premium_transactions_enriched_ss %}

# premium_transactions_ap

## About Source Table `ref('premium_transactions_raw_ss')`

The source here is the transactions table generated in raw layer. The `raw` in the table name implies it belongs to raw layer. The `ss` implies it's a slowly changing dimension table. 

## About the model `premium_transactions_enriched_ss`

We use merge stratergy for this table. It appends the new transaction_id or updates the 
old transaction_ids with the combination of `transaction_date` and `transaction_id` column.

The data is partitioned by `load_date`, `party` column.

In this model we change the column names to make it more business friendly or inline with the stakeholders from Finance team.

We convert the month column to display the value in reporting format. For example: 2024-07 is converted to 2024-Jul

We also use a macro to correct the `status` column. Here the assumption is that values `processed` and `process` have same meaning and both of them are converted to `processed`.

Please note that above assumption can be confirmed with relevant stakeholders in real world scenario.

{% enddocs %}