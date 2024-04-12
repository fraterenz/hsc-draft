# README
Code to regenerate the figures for the preprint [ADD LINK HERE](https://github.com/fraterenz/hsc-draft).

Instructions to reproduce each figure can be found in the following jupyter notebooks:
- `sde.ipynb`
- `abc/posteriors.ipynb`
- `dynamics.ipynb`

## Requirements
1. The Rust binary [hsc](https://github.com/fraterenz/hsc/releases) simualting the stem-cell dynamics (**TODO**: update link to include new tag)
2. A Python environment preferably named as `hsc-draft` (requires Python greater or equal to 3.7)
3. Get the data of Mitchell et al.

This code is intended to run on a computer cluster, locally it might not work.

### 1. The Rust binary
Either download the binary directly according to your operating system [hsc](https://github.com/fraterenz/hsc/releases) (**TODO**: update link) or download the [source code]((https://github.com/fraterenz/hsc) and compile it (requires Rust to be installed).

### 2. The Python enviroment
A Python environment preferably named as `hsc-draft` which requires Python greater or equal to 3.7.

One way to do it:
- create a directory for the environment `mkdir ~/venvs/`
- create an empty environment `python -m venv ~/venvs/hsc-draft`
- activate the environment `source ~/venvs/hsc-draft/bin/activate`
- install the `hscpy` package `pip install git+https://github.com/fraterenz/hscpy@v0.4.5` **TODO**: change this to new tag
- install ipykernel package `pip install ipykernel` 
- make the environment available as a jupypter kernel `python -m ipykernel install --user --name hsc-draft`
- run the notebooks to regenerate the images


### 3. Get the data
Get the data of Mitchell et al. from
[here](https://drive.google.com/file/d/1xHLEKScljoO4-d7R08fFXD2CF14jMIcZ/view?usp=sharing).

TODO.
