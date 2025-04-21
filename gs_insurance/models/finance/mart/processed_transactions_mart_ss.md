<!-- markdownlint-disable MD041 -->
{% docs processed_transactions_mart_ss %}

# premium_transactions_ap

## About Source Table `ref('premium_transactions_enriched_ss')`

The source here is the transactions table generated in enriched layer. The `enriched` in the table name implies it belongs to enriched layer. The `ss` implies it's a slowly changing dimension table. 

## About the model `processed_transactions_mart_ss`

The model gives information about monthly premiums for different parties and considers only processed transactions

We use merge stratergy for this table. It appends the new data at `party`, `month` combination or updates the data for old `party`, `month` combination, if there is any change in the historic data.

The data is partitioned by `month`, `party` column.

This model is a mart which will be used for reporting purpose, so this is aggregated at `party`, `month` level. The `premium` amount is rounded to two decimals.

{% enddocs %}