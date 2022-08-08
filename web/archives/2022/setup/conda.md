## Conda

You need several packages installed to work on the practices during the bootcamp, to ensure consistent package versions, [conda](https://docs.conda.io/en/latest/) is recommended to be used. Please refer to [conda installer](https://docs.conda.io/en/latest/miniconda.html) for downloading and installing conda.

After installation, open a new terminal and run

```bash
$ conda install -c conda-forge mamba
```

to install `mamba`, `mamba` provides conda parallel functionality, which significantly speeds up downloading and installing large bundle of packages.

If the above command finishes successfully, `mamba --veresion` should return you the installed version.

Download the [environment yaml file](bootcamp.yaml), run the following command to create environment based on descriptions in yaml file (replace parameter of `-n` with the name you like if need)

```bash
$ mamba env create -f bootcamp.yaml -n bootcamp
```

If succeed, the following commands should return you the version of `snakemake`

```bash
$ conda activate bootcamp
$ snakemake --version
```

Any issue on above steps, feel free to contact Jianyu Yang: jmy5455@psu.edu