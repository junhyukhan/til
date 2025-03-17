## Replication

Replication is the process of creating copies of data across multiple nodes.

### Definitions
- failover - The process of promoting a replica to be the new primary node. Failover can be managed manually or automatically. **Periodic Heartbeats** are used to detect if the primary node is down.
- durability - The ability of the system to withstand failures and continue to function.
- consistency - The ability of the system to maintain a consistent view of the data across all nodes.

### Types of Replication

1. **Pessimistic Replication** - Tries to guarantee from the start that the data is consistent across all nodes.
2. **Optimistic Replication (lazy replication)** - Allows for different replicas to diverge and guarantees they will converge again if there are no updates for a period of time.


## Replication Algorithms

### Primary-Backup Replication (single master replication) - The primary or leader node is responsible for all the updates to the data. The backup or follower nodes are responsible for serving read requests. All replicas maintain a consistent copy of the data.
- Scalable for read heavy workloads as more read replicas can be added.
- Not very scalable for write heavy workloads as the primary node must be able to handle all the writes.

#### Replication Techniques

1. Synchronous Replication - All replicas must acknowledge the write before the write is considered successful.
- Increased durability as all subsequent reads will be the most recent data.
- Increased latency as all replicas must acknowledge the write before the write is considered successful.

2. Asynchronous Replication - The primary node does not wait for the replicas to acknowledge the write.
- Increased performance as the primary node does not have to wait for the replicas to acknowledge the write.
- Decreased durability as the data may not be consistent across all replicas.

### Multi-Primary Replication (multi-master replication) - Each node is both a primary and a backup. All nodes are equal and can accept writes.
- Highly scalable for both read and write heavy workloads.
- Not very durable as any node can accept writes and there is no guarantee that the data is consistent across all nodes.
- Conflict resolution is required to ensure data consistency.

#### Conflict Resolution
Conflict resolution can be done 
- lazily
- eagerly

Approaches to conflict resolution
1. Exposing the conflict to the user
2. Last Write Wins (LWW) - The last write wins.
3. Causality tracking algorithms

### Quorum-based Replication

Write data only to the node that is responsiblle for processing the write operation,
and read data from all nodes and take the latest value.
The concept of quorums are used extensively in distributed transactions or concensus protocols.
