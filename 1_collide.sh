#!/bin/bash
set -e

BASE_DIR=/data/alice/kpipal/Trajectum/SUBMISSION/PbPb2D

# Output storage
export DCACHE_DIR=/dcache/alice/kpipal/PbPb2D
export PATH=/data/alice/kpipal/.local/bin:$PATH
export INPUT_FILES_DIR=/data/alice/kpipal/Trajectum/SUBMISSION/PbPb2D

# Environment for collide
source /cvmfs/alice.cern.ch/etc/login.sh
source /cvmfs/sft.cern.ch/lcg/views/setupViews.sh LCG_104 x86_64-el9-gcc12-opt
source /cvmfs/sft.cern.ch/lcg/releases/MCGenerators/rivet/3.1.8-79cbb/x86_64-el9-gcc12-opt/rivetenv.sh

export PKG_CONFIG=/usr/bin/pkg-config
export LD_LIBRARY_PATH=/project/alice/trajectum_packages_new/LHAPDF6.5.4/build/lib/:\
/project/alice/trajectum_packages_new/pythia8309/lib/:\
/project/alice/trajectum_packages_new/gemini_2024.8.8/build/lib/:\
/project/alice/trajectum_packages_new/fastjet-3.4.2/build/lib/:$LD_LIBRARY_PATH

export GINPUT=/project/alice/trajectum_packages_new/gemini_2024.8.8/build/share/gemini/

JOBID=$1

echo "Running job ${JOBID}"

cd ${JOBID}
# Run collide
/data/alice/kpipal/Trajectum/src/collide \
  /data/alice/kpipal/Trajectum/SUBMISSION/PbPb2D/parameters/collisionPbPb2760.par

# Combine output



