#prep output files from limma for analysis with homer and great.
import argparse
def parse_args():
    parser=argparse.ArgumentParser(description="prep output files from limma for analysis with HOMER and GREAT")
    parser.add_argument("--input_f",nargs="+")
    parser.add_argument("--tasks",nargs="+")
    parser.add_argument("--out_dir",help="directory to store the output files")
    return parser.parse_args()

def main():
    args=parse_args()
    for i in range(len(args.input_f)):
        data=open(args.input_f[i],'r').read().strip().split('\n')
        outf=open(args.out_dir+'/'+args.tasks[i]+'.bed','w')
        c=0
        for line in data:
            peak=line.split('\t')[-1].strip('\"').split('_')
            if len(peak)<3:
                continue 
            outf.write('\t'.join(peak)+'\t'+str(c)+'\t.\n')
            c+=1
        

if __name__=="__main__":
    main()
    
    
