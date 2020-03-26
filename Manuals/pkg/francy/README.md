[![Build Status](https://travis-ci.org/gap-packages/francy.svg?branch=master)](https://travis-ci.org/gap-packages/francy)
[![Test Coverage Status](https://codecov.io/gh/gap-packages/francy/branch/master/graph/badge.svg)](https://codecov.io/gh/gap-packages/francy)

[![npm version](https://badge.fury.io/js/francy-extension-browser.svg)](https://badge.fury.io/js/francy-extension-browser)
[![npm version](https://badge.fury.io/js/jupyter-francy.svg)](https://badge.fury.io/js/jupyter-francy)
[![PyPI version](https://badge.fury.io/py/jupyter-francy.svg)](https://badge.fury.io/py/jupyter-francy)

# Francy

Francy is a package for GAP that provides a framework for Interactive Discrete Mathematics.

Unlike [XGAP](https://github.com/gap-packages/xgap), Francy is not linked with any GUI framework and instead, 
this package is responsible for the generation of a semantic model that can be used to produce a graphical representation using any other framework / language.

See [Official Documentation](https://gap-packages.github.io/francy/doc/chap1.html)

There is javascript implementation of the graphical representation that works on Jupyter, embeded in a Web page or as a Desktop Application (e.g. using electron).

See [Graphics Interface](/js)

## Binder 

Jupyter Notebook Binder

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/gap-packages/francy/master)

Jupyter Lab Binder

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/gap-packages/francy/master?urlpath=lab)

These binders include the following notebooks:

|Notebook                        |Description                                                     |
|:-------------------------------|:---------------------------------------------------------------|
|francy-features.ipynb           | Contains examples of all features present in Francy            |
|francy-monoids-mult-three.ipynb | Contains an example of proofs used in a paper                  |
|francy-monoids.ipynb            | Contains FrancyMonoids package examples                        |
|francy-numericalsgps.ipynb      | Same as above, but the algorithms are visible in the notebook  |
|francy.ipynb                    | First notebook ever created with Francy                        |
|ICMS_2018.ipynb                 | Presentation notebook for the ICMS 2018 in USA                 |
|orbital-graphs.ipynb            | Contains some reseach algorithms for orbital graphs            |
|subgroup-lattice.ipynb          | Contains Subgroup-Lattice package examples                     |

# Jupyter Integration

In order to use this module in Jupyter, install it as follows, both jupyter lab and notebook extension:

```bash
mcmartins@local:~$ pip install jupyter_francy
mcmartins@local:~$ jupyter lab build # for JupyterLab
mcmartins@local:~$ jupyter nbextension enable --py --sys-prefix jupyter_francy # for Jupyter Notebook
```

The jupyter extension requires the JupyterKernel GAP package installed. 
See [Jupyter GAP Kernel](https://github.com/gap-packages/JupyterKernel) for more information.

# Package Structure

|Directory   |Description                                                     |
|:-----------|:---------------------------------------------------------------|
| tst        | contains gap code tests                                        |
| scripts    | contains scripts used by travis                                |
| schema     | contains the francy JSON Schema                                |
| notebooks  | contains some notebooks with francy examples                   |
| js         | contains the source code of francy-js                          |
| gap        | contains the source code of francy-gap                         |
| examples   | contains examples used throughout francy-gap documentation     |
| doc        | contains introductory documentation for francy-gap             |

# Other projects based or inspired by Francy

| Project                                                    | Author                                           | Description                                              |
|:-----------------------------------------------------------|:-------------------------------------------------|:---------------------------------------------------------|
| [Jupyterviz](https://github.com/nathancarter/jupyterviz)   | [Nathan Carter](https://github.com/nathancarter) | Provides general purpose visualization tools             |                            
| [Francy Julia](https://github.com/fieker/Francy)           | [Claus Fieker](https://github.com/fieker)        | Francy ported to Julia language                          |
| [Francy Widgets](https://github.com/zerline/francy-widget) | [Odile Bénassy](https://github.com/zerline)      | Francy Python adapter for representing graphs in Jupyter |

# License

[MIT](LICENSE) License
