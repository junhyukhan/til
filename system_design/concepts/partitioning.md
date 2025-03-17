## Partitioning

One of the major benefits of distributed systems is scalability. Scalability allows us to store and process more data and more users.

Partitioning is a technique used to scale out a distributed system. It involves dividing the system into smaller, more manageable pieces.

### Partitioning Techniques

1. **Vertical Partitioning** - Dividing the data into multiple tables with fewer columns.
- Requests that span multiple tables are difficult to handle and/or inefficient as Joins are required.
- Usually a data modeling practice

2. **Horizontal Partitioning (Sharding)** - Dividing the data into multiple tables where each table contains a subset of the data.
- Accessing multiple nodes is generally not required as each node contains all the required data. However this is not the case for requests that are searching for a range of data.
- Harder to perform transactions as they require data from multiple nodes.
- commonly used in distributed systems


## Algorithms for Horizontal Partitioning

1. **Range Partitioning** - Dividing the data into ranges baed on a specific attribute
Google's Bigtable and Apache HBase use this technique.
2. **Hash Partitioning** - Dividing the data into ranges based on a hash of the data.
Inablility to perform range queries.
3. **Consistent Hashing** - A variation of hash partitioning that allows for more efficient data distribution.
DynamoDB and Cassandra use this technique.
