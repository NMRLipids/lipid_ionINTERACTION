# Script to average order parameters over time and lipids. Note that inputs must have the structure of outputs
# from scripts getLeafletwiseOPsFromCenteredTraj.sh / getLeafletwiseOPsFromCenteredTraj_withProtonation.sh.
#
# Returns the mean order parameter and its standard error separately for each leaflet, and for both combined.
#
# Usage: ./getAverageOPsOfBothLeaflets.sh lipidwiseOPsVStime/DPPC/Berger/noIons/CB-HB1.dat
#
# Explanation for the code below:
# 1) Remove values of the upper leaflet: sed 's/ *[ ,-][0-1]\.[0-9]*U//g' CB-HB1.dat \
# 2) Remove the 'L' tokens:                  | sed 's/L//g' \
# 3) Average over time:                      | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
# 4) Average over lipids, estimate error:    | awk '{sum+=$1;sum2+=$1**2}END{print sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR)}'
#
# Markus Miettinen 9march2016

OPvsTimeFile=$1

mean_SEofMean=`sed 's/ *[ ,-][0-1]\.[0-9]*U//g' ${OPvsTimeFile} \
    | sed 's/L//g' \
    | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
    | awk '{sum+=$1;sum2+=$1**2}END{printf("%8.7f %8.7f", sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR))}'`
echo "${mean_SEofMean} # lower leaflet of ${OPvsTimeFile}"

mean_SEofMean=`sed 's/ *[ ,-][0-1]\.[0-9]*L//g' ${OPvsTimeFile} \
    | sed 's/U//g' \
    | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
    | awk '{sum+=$1;sum2+=$1**2}END{printf("%8.7f %8.7f", sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR))}'`
echo "${mean_SEofMean} # upper leaflet of ${OPvsTimeFile}"

mean_SEofMean=`sed 's/L//g' ${OPvsTimeFile} \
    | sed 's/U//g' \
    | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
    | awk '{sum+=$1;sum2+=$1**2}END{printf("%8.7f %8.7f", sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR))}'`
echo "${mean_SEofMean} # both leaflets of ${OPvsTimeFile}"

