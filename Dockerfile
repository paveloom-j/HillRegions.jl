# Base image
FROM paveloom/binder-julia:0.1.2

# Meta information
LABEL maintainer="Pavel Sobolev (https://github.com/Paveloom)"
LABEL version=""
LABEL description="A playground for the `HillRegions.jl` package."
LABEL github-repository="https://github.com/paveloom-j/HillRegions.jl"
LABEL docker-repository="https://github.com/orgs/paveloom-j/packages/container/hillregions/"

# Install the C compiler
RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections && \
    sudo apt-get update >/dev/null && \
    sudo apt-get install -y --no-install-recommends gcc >/dev/null && \
    sudo rm -rf /var/lib/apt/lists/* && \
    echo 'debconf debconf/frontend select Dialog' | sudo debconf-set-selections

# Install the package
RUN julia -e 'using Pkg; \
              pkg"registry add https://github.com/paveloom-j/PaveloomRegistry"; \
              pkg"add HillRegions, Plots"; using HillRegions, Plots'

# Get the notebook
RUN wget https://raw.githubusercontent.com/paveloom-j/HillRegions.jl/master/binder/playground.ipynb >/dev/null 2>&1
