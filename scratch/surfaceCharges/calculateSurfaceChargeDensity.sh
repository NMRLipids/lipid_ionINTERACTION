# Script to calculate tge surface charge density profiles for each leaflet
# and to output their values at given points.
#
# Note, expects FOUR inputs!
#
# Usage: ./calculateSurfaceChargeDensity.sh 1.77 1.75 chargeDistribution.xvg surfaceChargeDensityProfile.dat
#
# Markus Miettinen 14Feb2016

posZ=$1                                     # Positions (from bilayer center) at which the SCD will be output.
negZ=`echo ${2} | awk '{print sqrt($1**2)}'` # Make negative value absolute.
chargeDistributionFile=$3                   # Charge distribution (centered around bilayer center) [input]
outFileForSCDP=$4                           # Surface charge density for both leaflets [output]

# Calculate bin width (as the average witdth of the 10 first bins):
binWidth=`grep -v ^[\#,@] ${chargeDistributionFile} \
    | head -n11 \
    | awk '{if((NR-1)%10==0) printf("%f ",$1)}' \
    | awk '{print ($2-$1)/10}'`

# Integrate over the positive leaflet:
grep -v ^[\#,@] $chargeDistributionFile \
    | awk -v bw=$binWidth '{if ($1>=0) {sum+=bw*$2; print $1,sum}}' > foo.bar
#
# Find the value at the wished point (interpolate from neighboring points):
posSCD=`cat foo.bar \
    | awk -v theZ=${posZ} \
	  '{if ($1>theZ) {print oldC+(theZ-oldZ)/($1-oldZ)*($2-oldC);exit}; oldZ=$1;oldC=$2}'`

echo "Upper leaflet surface charge density at ${posZ} nm is ${posSCD} q/nm2."

# Integrate over the negative leaflet:
grep -v ^[\#,@] $chargeDistributionFile \
    | awk '{if ($1<=0) {print -$1, $2}}' \
    | sort -n \
    | awk -v bw=$binWidth '{sum+=bw*$2; print $1,sum}' > bar.foo
#
# Find the value at the wished point (interpolate from neighboring points):
negSCD=`cat bar.foo \
    | awk -v theZ=${negZ} \
	  '{if ($1>theZ) {print oldC+(theZ-oldZ)/($1-oldZ)*($2-oldC);exit}; oldZ=$1;oldC=$2}'`

echo "Lower leaflet surface charge density at ${negZ} nm is ${negSCD} q/nm2."
echo

# Save the surface charge density profiles to a file:
echo "# Surface charge density profile from charge distribution file ${chargeDistributionFile}" \
     > $outFileForSCDP
echo -e "# Bin width ${binWidth} nm.\n" \
     >> $outFileForSCDP
echo "# UPPER LEAFLET -- LOWER LEAFLET --" \
     >> $outFileForSCDP
echo "# z(nm) SCD(q/nm2) z(nm) SCD(q/nm2)" \
     >> $outFileForSCDP

paste foo.bar bar.foo \
     >> $outFileForSCDP

rm foo.bar bar.foo
