# Explanation for the code below:
# 1) Remove values of the upper leaflet: sed 's/ *[ ,-][0-1]\.[0-9]*U//g' CB-HB1.dat \
# 2) Remove the 'L' tokens:                  | sed 's/L//g' \
# 3) Average over time:                      | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
# 4) Average over lipids, estimate error:    | awk '{sum+=$1;sum2+=$1**2}END{print sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR)}'


mean_SEofMean=`sed 's/ *[ ,-][0-1]\.[0-9]*U//g' CB-HB1.dat \
    | sed 's/L//g' \
    | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
    | awk '{sum+=$1;sum2+=$1**2}END{print sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR)}'`
echo "CB-HB1: ${mean_SEofMean} #  lower"


mean_SEofMean=`sed 's/ *[ ,-][0-1]\.[0-9]*L//g' CB-HB1.dat \
    | sed 's/U//g' \
    | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
    | awk '{sum+=$1;sum2+=$1**2}END{print sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR)}'`
echo "CB-HB1: ${mean_SEofMean} # upper"

mean_SEofMean=`sed 's/ *[ ,-][0-1]\.[0-9]*U//g' CB-HB2.dat \
    | sed 's/L//g' \
    | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
    | awk '{sum+=$1;sum2+=$1**2}END{print sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR)}'`
echo "CB-HB2: ${mean_SEofMean} # lower"


mean_SEofMean=`sed 's/ *[ ,-][0-1]\.[0-9]*L//g' CB-HB2.dat \
    | sed 's/U//g' \
    | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
    | awk '{sum+=$1;sum2+=$1**2}END{print sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR)}'`
echo "CB-HB2: ${mean_SEofMean} # upper"


mean_SEofMean=`sed 's/ *[ ,-][0-1]\.[0-9]*U//g' CA-HA1.dat \
    | sed 's/L//g' \
    | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
    | awk '{sum+=$1;sum2+=$1**2}END{print sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR)}'`
echo "CA-HA1: ${mean_SEofMean} # lower"


mean_SEofMean=`sed 's/ *[ ,-][0-1]\.[0-9]*L//g' CA-HA1.dat \
    | sed 's/U//g' \
    | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
    | awk '{sum+=$1;sum2+=$1**2}END{print sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR)}'`
echo "CA-HA1: ${mean_SEofMean} #  upper"

mean_SEofMean=`sed 's/ *[ ,-][0-1]\.[0-9]*U//g' CA-HA2.dat \
    | sed 's/L//g' \
    | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
    | awk '{sum+=$1;sum2+=$1**2}END{print sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR)}'`
echo "CA-HA2: ${mean_SEofMean} #  lower"


mean_SEofMean=`sed 's/ *[ ,-][0-1]\.[0-9]*L//g' CA-HA2.dat \
    | sed 's/U//g' \
    | awk '{for(i=1;i<=NF;i++){sum[i]+=$i}}END{for(i=1;i<=NF;i++){print sum[i]/NR}}' \
    | awk '{sum+=$1;sum2+=$1**2}END{print sum/NR, sqrt((sum2/NR-(sum/NR)**2)/NR)}'`
echo "CA-HA2: ${mean_SEofMean} # upper"
