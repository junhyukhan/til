## Distributed Systems

### 8 Fallacies of Distributed Computing
1. The network is reliable
2. Latency is zero
3. Bandwidth is infinite
4. There is one administrator
5. The network is secure
6. Topology doesn't change
7. There is one administrator
8. Transport cost is zero

### Difficulties in Designing Distributed Systems
1. Network asynchrony
2. Partial failures
3. Concurrency

#### Network asynchrony
Hard to differentiate between a slow network and a failed node.

##### Methods to detect failure
1. Timeout - if a node does not respond to a request within a certain time, it is assumed to have failed. False positives are possible as the network may be slow.

##### Properties of Failure Detectors
1. Completeness - if a node has failed, the failure detector will eventually detect it
2. Accuracy - the failure detector should not falsely report a node as failed

### Measuring Correctness
1. safety
2. liveness
There is an inherent tension between safety and liveness. Compromising liveness may be required to achieve a higher level of safety.

### A generic distributed system model
#### Properties
1. How the nodes of the system interact with each other
2. How the nodes of the system can fail

### 2 Types of communication
1. Synchronous
2. Asynchronous

### 4 Types of failures
1. Fail-stop - node halts and remains halted. But other nodes can detect that it has failed.
2. Crash - node halts silently. Other nodes may not be able to detect this and can only assume its failure when they are unable to communicate with it.
3. Omission - Node fails to respond to incoming requests
4. Byzantine - node exhibits arbitrary behavior. Usually due to a malicious actor or a bug.

### Delivery Semantics
1. At-most-once - the message may be lost
2. At-least-once - the message may be duplicated
3. Exactly-once - the message is delivered without duplication or loss

#### Definitions
1. Delivery - the act of sending a message to a node
2. Processing - the act of receiving a message and performing some action
3. Idempotent - an operation that can be applied multiple times without changing the result
4. De-duplication - the act of removing duplicate messages

#### Exactly-once delivery
It is impossible to achieve exactly-once delivery in a distributed system.
However, we can achieve exactly-once processing of messages by using idempotent operations.

### Stateless and Stateful Systems
#### Stateless Systems
Maintain no state of what happened in the past and perform all operations based on the current state of the system.

#### Stateful Systems
Responsible for maintaining and mutating state. Their result is based on the state of the system.


