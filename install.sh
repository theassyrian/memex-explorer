 #!/usr/bin/env bash

if [ ! -d /opt/anaconda ]; then
    wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O /opt/miniconda.sh
    bash /opt/miniconda.sh -b -p /opt/anaconda/
    echo "export PATH=/opt/anaconda/bin/:$PATH" | sudo tee -a /etc/bashrc
    echo "export PATH=/opt/anaconda/bin/:$PATH" | sudo tee -a /etc/environment
    /opt/anaconda/bin/conda config --set always_yes yes
    /opt/anaconda/bin/conda config --add create_default_packages pip --add create_default_packages ipython
    /opt/anaconda/bin/conda update conda --yes
fi

conda install -c conda conda-env
conda env create --name=memex-explorer --file=environment.yml
source activate memex-explorer

echo `which python`
echo "export ACHE_HOME='/opt/anaconda/envs/memex-explorer/lib/python2.7/site-packages/ache/" | sudo tee -a /etc/bashrc