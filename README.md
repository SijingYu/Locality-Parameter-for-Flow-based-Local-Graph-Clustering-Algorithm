# Locality Parameter for Flow based Local Graph Clustering Algorithm
This project is based on a flow-based local clustering algorithm introduced by Dr. Nate Veldt in 


"Flow-Based Local Graph Clustering with Better Seed Set Inclusion"  
Nate Veldt, Christine Klymko, and David Gleich  
*Proceedings of the 2019 SIAM International Conference on Data Mining*

ArXiv preprint: [https://arxiv.org/abs/1811.12280](https://arxiv.org/abs/1811.12280)


Github repository: [https://github.com/nveldt/FlowSeed](https://github.com/nveldt/FlowSeed)

## Original sources of some code:
**FlowSeed-1.0.jl**: [https://github.com/nveldt/FlowSeed/blob/master/algorithms/FlowSeed-1.0.jl](https://github.com/nveldt/FlowSeed/blob/master/algorithms/FlowSeed-1.0.jl)

**displaygraph.jl**: functions adopted from [https://github.com/nveldt/fauci-email/blob/7e1998108343a0c2969cf816bc42f2416da36400/methods.jl] (https://github.com/nveldt/fauci-email/blob/7e1998108343a0c2969cf816bc42f2416da36400/methods.jl)


**DBLP-seed-starter.mat**, **DBLP-top10.mat**: [https://github.com/nveldt/FlowSeed/tree/master/Exp1-snap-communities/datasets] (https://github.com/nveldt/FlowSeed/tree/master/Exp1-snap-communities/datasets)
 
## Code developed for this project:
**utilities.jl**: function used to explore the characteristics of the sets returned by FlowSeed with different locality parameter

**test_DBLP-sets.ipynb**: a demo of functions in utilitis.jl and outputs the result of experiments.
