#!/bin/bash
export SMASHLOCATION=/project/alice/trajectum_packages_new/smash/build/
mv PbPb.main PbPb0
numevents=$(expr $(wc -l < PbPb.extra) - 5)
sed s/NUMEVENTS/$numevents/ smashtemplate.yaml > smash.yaml
rm smashtemplate.yaml
${SMASHLOCATION}smash -i smash.yaml
mv data/0/particle_lists.oscar PbPb.afterburned
mv data/0/Photons.oscar PbPb.photons
rm -r data/
#rm PbPb0