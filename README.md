# HSC
Markov process with fixed-size population with k-types such that the type 0 is the wild-type with growth rate of `B0`. 

A cells can get a mutation conferring a proliferative advantage upon cell division. We model this process with a Bernouilli trial with success probability of `u`, with units of 1 mutation/division. To compute `u` we can do `u =  MU0 / (B0 * NCELLS)` for the symmetric division case.

## How to use it
Install a version of python greather or equal to 3.11 and then install `seaborn`, `scipy`, `pandas`, `ipykernel` with pip.
Then, install `futils` and `hscpy` in editable mode.
Finally, on the cluster, make this env availbale as a ipython kernel.

## ABC
In the folder `abc`, the framework goes as follows:
    1. generate the parameters from the prior distributions in `priors.ipynb` and save those parameters into `parameters.txt`
    2. run `qsub particles.sh parameters.txt` which is an array job that will generate the particles of abc by simulating the dynamics
    3. run `posteriors.ipynb` to get the posterior distributions of the parameters