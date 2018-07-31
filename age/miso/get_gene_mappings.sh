#for f in ./d3_v_d1_Y.Comparison/d3_Y.bam.out_vs_d1_Y.bam.out/bayes-factors/filtered.events.bed ./d7_v_d5_Old.Comparison/d7_Old.bam.out_vs_d5_Old.bam.out/bayes-factors/filtered.events.bed ./d3_v_d1_Old.Comparison/d3_Old.bam.out_vs_d1_Old.bam.out/bayes-factors/filtered.events.bed ./d1_v_d0_Old.Comparison/d1_Old.bam.out_vs_d0_Old.bam.out/bayes-factors/filtered.events.bed ./d0.Comparison/d0_Old.bam.out_vs_d0_Y.bam.out/bayes-factors/filtered.events.bed ./d5_v_d3_Y.Comparison/d5_Y.bam.out_vs_d3_Y.bam.out/bayes-factors/filtered.events.bed ./d5.Comparison/d5_Old.bam.out_vs_d5_Y.bam.out/bayes-factors/filtered.events.bed ./d7_v_d5_Y.Comparison/d7_Y.bam.out_vs_d5_Y.bam.out/bayes-factors/filtered.events.bed ./d7.Comparison/d7_Old.bam.out_vs_d7_Y.bam.out/bayes-factors/filtered.events.bed ./d3.Comparison/d3_Old.bam.out_vs_d3_Y.bam.out/bayes-factors/filtered.events.bed ./d1_v_d0_Y.Comparison/d1_Y.bam.out_vs_d0_Y.bam.out/bayes-factors/filtered.events.bed ./d1.Comparison/d1_Old.bam.out_vs_d1_Y.bam.out/bayes-factors/filtered.events.bed ./d5_v_d3_Old.Comparison/d5_Old.bam.out_vs_d3_Old.bam.out/bayes-factors/filtered.events.bed
for analysis in A3SS A5SS MXE RI
do
    for f in /home/annashch/nobel_lab_projects/age/miso/$analysis/d0.Comparison/d0_Old.bam.out_vs_d0_Y.bam.out/bayes-factors/filtered.events.bed /home/annashch/nobel_lab_projects/age/miso/$analysis/d5.Comparison/d5_Old.bam.out_vs_d5_Y.bam.out/bayes-factors/filtered.events.bed /home/annashch/nobel_lab_projects/age/miso/$analysis/d7.Comparison/d7_Old.bam.out_vs_d7_Y.bam.out/bayes-factors/filtered.events.bed /home/annashch/nobel_lab_projects/age/miso/$analysis/d3.Comparison/d3_Old.bam.out_vs_d3_Y.bam.out/bayes-factors/filtered.events.bed /home/annashch/nobel_lab_projects/age/miso/$analysis/d1.Comparison/d1_Old.bam.out_vs_d1_Y.bam.out/bayes-factors/filtered.events.bed
    do
	bedtools intersect -wao -a $f -b gene_assignments/Mus_musculus.bed | cut -f4,8 | sort | uniq > $f.intersection
	python collapse_mapping.py $f.intersection
    done
done
