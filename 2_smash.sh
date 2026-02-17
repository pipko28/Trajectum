#!/bin/bash
set -e

JOBID=$1

source /cvmfs/alice.cern.ch/etc/login.sh
source /cvmfs/sft.cern.ch/lcg/views/setupViews.sh LCG_104 x86_64-el9-gcc12-opt
source /cvmfs/sft.cern.ch/lcg/releases/MCGenerators/rivet/3.1.8-79cbb/x86_64-el9-gcc12-opt/rivetenv.sh
export PKG_CONFIG=/usr/bin/pkg-config
export LD_LIBRARY_PATH=/project/alice/trajectum_packages_new/LHAPDF6.5.4/build/lib/:/project/alice/trajectum_packages_new/pythia8309/lib/:/project/alice/trajectum_packages_new/gemini_2024.8.8/build/lib/:/project/alice/trajectum_packages_new/fastjet-3.4.2/build/lib/:$LD_LIBRARY_PATH
export GINPUT=/project/alice/trajectum_packages_new/gemini_2024.8.8/build/share/gemini/

# Extra sourcing needed for smash
source /cvmfs/sft.cern.ch/lcg/releases/MCGenerators/rivet/3.1.8-79cbb/x86_64-el9-gcc12-opt/rivetenv.sh 
source /cvmfs/sft.cern.ch/lcg/views/setupViews.sh LCG_104 x86_64-el9-gcc12-opt

# Run SMASH
/data/alice/kpipal/Trajectum/SUBMISSION/PbPb2D/runsmashall.sh "$JOBID"

# Combine output
cat */PbPb.afterburned > PbPb.afterburned
cat */PbPb.photons > PbPb.photons
