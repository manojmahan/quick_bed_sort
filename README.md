# quick_bed_sort
## 1. Clone the repository
~~~
git clone https://github.com/manojmahan/quick_bed_sort.git
cd quick_bed_sort
~~~
## 2. Create environment
~~~
mamba create -n bed_sort_env python=3.9
mamba activate bed_sort
~~~
## 3. install required libraries
~~~
mamba install -c bioconda snakemake
~~~
~~~
mamba install pandas
~~~

## 4. Download the data
~~~
curl -JLO "https://figshare.com/ndownloader/files/49358275?private_link=727f8d920a1b8415f09a" -o data/shuf.a.bed.gz
curl -JLO "https://figshare.com/ndownloader/files/49358278?private_link=727f8d920a1b8415f09a" -o data/shuf.a.bed.gz
~~~

## 4. Split the file for each chromosome
~~~
zcat "data/shuf.a.bed.gz" | awk '{print >> "data/"$1".bed"}'
zcat "data/shuf.b.bed.gz" | awk '{print >> "data/"$1".bed"}'
~~~

## 5. Run Snakemake to get the sorted file
~~~
snakemake --snakefile sort_bed.smk sorted/for_sort.bed -j1
~~~
