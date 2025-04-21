{% macro fix_status(status) %}

/*
    This macro is used to fix the status column values. 
    We often encounter issues with the status column in the source data, 
    where it contains values like 'processed' or 'process'.
    This macro is used to replace those values with 'processed'.
    The macro takes a single argument, status, which is the value of the status column in the source data.
    The macro returns the fixed status value.

    Arguments:
    ----------
    status: string
        The value of the status column in the source data.
*/

CASE WHEN status IN ('processed', 'process') THEN 'processed'
ELSE status
END
{% endmacro %}