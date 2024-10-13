import sys
import pandas as pd

run_df = pd.read_csv('data/run_metadata.tsv',sep='\t',header='infer')
sample_df = pd.read_csv('data/samples.tsv',sep='\t',header='infer')
#print(run_df)

run_df.index = run_df['run']
sample_df.index = sample_df['sample']

#print(run_df)
#print(sample_df)

def get_all_runs_for_a_sample(wildcards):
	#print(wildcards)
	#print(sample_df)
	all_runs = sample_df.loc[wildcards,"runs"]
	
	run_path_list = []
	for r in list(all_runs)[0].split(','):
		p= run_df.loc[r,'file_path']
		run_path_list.append(p)
	return run_path_list

rule SortChromo:
	input:
		all_runs = lambda wildcards:get_all_runs_for_a_sample(wildcards)
	output:
		top_100_lines = "sorted/for_{sample}.bed"
	shell:
		"sh scripts/get_top_100.sh \"{input.all_runs}\" {output.top_100_lines}"
	
	
