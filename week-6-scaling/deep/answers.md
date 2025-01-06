# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

One reason to adopt this approach is because it is evenly distributed. Meaning there will not be a boat that is full. But at the cost of that, if you want to query data, you will have to run the query on all the boats since the data you are looking for could be in any of the boats because of its randomization.

## Partitioning by Hour

This approach is good because it allows to minimize your queries. If the boats are partioned in order, you will know where to query for the data. But a downside is that most of the observations is collected during midnight so the boats are not going to evenly distributed since it is organized by hour.

## Partitioning by Hash Value

This apporach is beneficial because it allows to have evenly distributed data. But if you want to query for data other than the hash value you will need to query all of the boats otherwise if you are querying for data with the hash value, you can know which boat to get the data from.
