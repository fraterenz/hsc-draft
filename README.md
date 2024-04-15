# README
Code to regenerate the figures for the preprint [ADD LINK HERE](https://github.com/fraterenz/hsc-draft).

Instructions to reproduce each figure can be found in the following jupyter notebooks:
- `sde.ipynb`
- `abc/posteriors.ipynb`
- `dynamics.ipynb`


## Requirements
This code requires Python greater or equal to 3.9.7 and the following requirements:
1. a Python jupyter kernel with `hscpy` installed
2. the processed data of [Mitchell et al.](https://www.nature.com/articles/s41586-022-04786-y) that can be downloaded from [here](https://drive.google.com/file/d/1xHLEKScljoO4-d7R08fFXD2CF14jMIcZ/view?usp=drive_link)
3. The output of the simulations that can be either downloaded from yy **TODO** or regenerated with the Rust binary.

### 1. The Python kernel
A Python environment available as a jupyter kernel (preferably named as `hsc-draft`) with `hscpy` version `V` installed. **TODO**

One way to do it:
- create a directory for the environment `mkdir ~/venvs/`
- create an empty environment `python -m venv ~/venvs/hsc-draft`
- activate the environment `source ~/venvs/hsc-draft/bin/activate`
- install the `hscpy` package `pip install git+https://github.com/fraterenz/hscpy@v0.4.9` **TODO**: change this to new tag
- install ipykernel package `pip install ipykernel` 
- make the environment available as a jupypter kernel `python -m ipykernel install --user --name hsc-draft`
- run the notebooks to regenerate the images


### 2. The donor data
- Get the processed data of Mitchell et al. from
[here](https://www.dropbox.com/scl/fi/vsuebfgfcegdoqtuvcsan/mitchell-data.tar.gz?rlkey=favnmgl4ccd246bfnikazg513&st=kx4qpbn4&dl=0):
`wget --output-document=mitchell-data.tar.gz https://www.dropbox.com/scl/fi/vsuebfgfcegdoqtuvcsan/mitchell-data.tar.gz?rlkey=favnmgl4ccd246bfnikazg513&st=kx4qpbn4&dl=0`
- create a directory `mkdir mitchell` 
- untar the data with with gzip: `tar xvf mitchell-data.tar.gz --directory=mitchell`


### 3. The output of the simulations
The output of the simulations can either downloaded from
here **TODO link** or generated with the Rust binary `hsc` with version `v4.3.6`.

The binary `hsc` can be either [downloaded](https://github.com/fraterenz/hsc/releases/tag/v4.3.6) or 
compiled from the source code (requires [Rust](https://www.rust-lang.org) to be installed).
To compile from source, get the code from
[here](https://github.com/fraterenz/hsc/tree/v4.3.6) and compile it with Rust.

