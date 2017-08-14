files=(
  'SRR1311062.sra'
  'SRR1486719.sra'
  'SRR1445365.sra'
  'SRR1471331.sra'
  'SRR1464835.sra'
)

for file in "${files[@]}"; do
  echo "${file}"
  # Download .sra file using prefetch.    
  prefetch -X 200G ${file%.sra}
  if [[ ! -e sra/${file}.cache && ! -e ${file%.sra}.fastq.bz2 && -e sra/${file} ]]; then
    # only process sra file that have completed downloading (i.e. no *.cache file) and for which no fastq.bz2 file exists
    echo -n "  Extracting data into FASTQ format ... "
    # Convert SRA to FASTQ and change the formatting of the output to reduce disk space and be consistent with normall Illumina read naming i.e. /1 and /2 suffixes
    parallel-fastq-dump -s sra/${file} -t 3 -O fastq/ --bzip2 --split-spot --clip --skip-technical --dumpbase --readids
    echo "DONE"
  else
    echo "  Skipping"
  fi
done

for file in "${files[@]}"; do
  rm sra/${file}
done
