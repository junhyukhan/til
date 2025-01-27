## Oracle
assuming there's a created_date column of type DATE.

`WHERE TRUNC(created_date) = TRUNC(SYSDATE)`

can be used to remove the time portion of the DATE value and query data that was created today.