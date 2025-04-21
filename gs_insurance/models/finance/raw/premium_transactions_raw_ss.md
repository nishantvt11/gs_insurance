<!-- markdownlint-disable MD041 -->
{% docs premium_transactions_raw_ss %}

# premium_transactions_ap

## About Source Table `public_transactions_data.premium_transactions_ap`

We here assume that there is a pipeline which reads data from s3 location. The s3 location has kafka event dump from different systems for premium transactions. The table created by this pipeline is `public_transactions_data.premium_transactions_ap`

We use this table to create a table in raw_layer for data analysis.

The schema name `public_transactions_data`, in this 
`public` means that the table can be used by anyone in the organisation, if the suffix was `private` then it would have been restricted to the data producer team . The `suffix` ap indicates that the data is in append strategy. 

## About the model `premium_transactions_raw_ss`

We use merge stratergy for this table. It appends the new transaction_id or updates the 
old transaction_ids with the combination of `created_at` and `transaction_id` column.

The data is partitioned by `load_date`, `charged_party` column.

In this model we are type casting the column to represent required datatypes.

{% enddocs %}