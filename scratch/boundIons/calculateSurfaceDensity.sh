# Script to calculate the surface charge density profiles (q/nm2) for each leaflet and to output their values at given points.
#
# Usage: ./calculateSurfaceDensity.sh -1.77 1.75 densityDistribution.xvg 2
#
# Markus Miettinen 11march2016


echo
# Check the inputs:
if [ $4 ]
then
    negZ=`echo ${1} | awk '{print sqrt($1**2)}'` # (Absolute) distances from bilayer center
    posZ=`echo ${2} | awk '{print sqrt($1**2)}'` # at which the surface density will be output.
    densityDistributionFile=$3                   # Number density distribution (centered around bilayer center) [input]
    ionCharge=$4                                 # Charge of the ion under study.
    echo "Output position (lower leaflet):   ${negZ}"
    echo "Output position (upper leaflet):   ${posZ}"
    echo "Density distribution file (input): ${densityDistributionFile}"
    echo "Charge of the ion under study:     ${ionCharge}"
else
  echo "Too few inputs, exiting."
  exit
fi
echo


# Calculate bin width (as the average witdth of the 10 first bins):
binWidth=`grep -v ^[\#,@] ${densityDistributionFile} \
    | head -n11 \
    | awk '{if((NR-1)%10==0) printf("%f ",$1)}' \
    | awk '{print ($2-$1)/10}'`

# Integrate over the negative leaflet:
grep -v ^[\#,@] $densityDistributionFile \
    | awk '{if ($1<=0) {print -$1, $2}}' \
    | sort -n \
    | awk -v bw=$binWidth '{sum+=bw*$2; print $1,sum}' > bar.foo
#
# Find the value at the wished point (interpolate from the neighboring points):
negSD=`cat bar.foo \
    | awk -v theZ=${negZ} -v charge=${ionCharge} \
	  '{if ($1>theZ) {print charge*(oldC+(theZ-oldZ)/($1-oldZ)*($2-oldC));exit}; oldZ=$1;oldC=$2}'`

echo "Surface densities (per nm2) for each leaflet:"
echo "Lower: ${negSD}"

# Integrate over the positive leaflet:
grep -v ^[\#,@] $densityDistributionFile \
    | awk -v bw=$binWidth '{if ($1>=0) {sum+=bw*$2; print $1,sum}}' > foo.bar
#
# Find the value at the wished point (interpolate from neighboring points):
posSD=`cat foo.bar \
    | awk -v theZ=${posZ} -v charge=${ionCharge} \
	  '{if ($1>theZ) {print charge*(oldC+(theZ-oldZ)/($1-oldZ)*($2-oldC));exit}; oldZ=$1;oldC=$2}'`

echo "Upper: ${posSD}"
echo "Mean:  `echo ${negSD} ${posSD} | awk '{print 0.5*($1+$2)}'`"

######
# Save the surface density profiles to a file:
#echo "# Surface density profile from density distribution file ${densityDistributionFile}" \
#     > $outFileForSDP
#echo -e "# Bin width ${binWidth} nm.\n" \
#     >> $outFileForSDP
#echo "# LOWER LEAFLET -- UPPER LEAFLET --" \
#     >> $outFileForSDP
#echo "# z(nm) SD(1/nm2)  z(nm) SD(1/nm2)" \
#     >> $outFileForSDP
#
#paste bar.foo foo.bar \
#     >> $outFileForSDP

rm foo.bar bar.foo

