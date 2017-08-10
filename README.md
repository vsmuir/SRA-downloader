# SRA-downloader
Chunk of code to download a batch of SRR#s from the NCBI repository using sra-toolkit derived tools

This uses Aspera connect and parallel-fastq-dump (https://github.com/rvalieris/parallel-fastq-dump) to download fastq files for a set of SRR IDs.  
It's designed to work on a Mac, so the prefetch and Aspera paths may require some tinkering if you use it on a different OS.

Thanks to Nathan Haigh for giving me a good idea of where to start (https://gist.github.com/nathanhaigh/5972725)!
