#include<stdio.h>
#include<stdlib.h>

int a=0,head=0;  //global variables
FILE *fout;
void fcfs(int head,int request[],int n)
{
    int j=0,diff=0,seek=0;
    seek=0;
    int curr_head=head;
    for(j=0;j<n;j++)
    {
    diff=abs(curr_head-(request[j]));
    curr_head=(request[j]);
    seek=seek+diff;
    }
    printf("\n\nTotal head movements in FCFS is: %d\n",seek);
    fprintf(fout,"\n\nTotal head movements in FCFS is: %d",seek);

}

void scan(int n,int head,int R[],int max){
    int i=0,diff=0,seek=0,pos=0;
    seek=0;
    for(i=0;i<n;i++){
        if(R[i]<head)
          pos=i;

        else
            break;
        }
    int curr_head=head;

    for(i=pos+1;i<n;i++){
      diff=abs(curr_head-(R[i]));
      curr_head=R[i];
      seek=seek+diff;
    }
    diff=abs(curr_head-max);
    curr_head=max;
    seek=seek+diff;
    for(i=pos;i>=0;i--){
       diff=abs(curr_head-(R[i]));
      curr_head=R[i];
      seek=seek+diff;
    } 
     printf("\n\nTotal head movements in SCAN is: %d\n",seek);
     fprintf(fout,"\n\nTotal head movements in SCAN is: %d\n",seek);

}
void cscan(int n,int head,int R[],int max){
    int i=0,diff=0,seek=0,pos=0;
    seek=0;
    for(i=0;i<n;i++){
        if(R[i]<head)
          pos=i;

        else
            break;
        }
    int curr_head=head;
    for(i=pos+1;i<n;i++){
      diff=abs(curr_head-(R[i]));
      curr_head=R[i];
      seek=seek+diff;
    }
    diff=abs(curr_head-max);
    curr_head=max;
    seek=seek+diff;
    seek=seek+max;
    curr_head=0;
     for(i=0;i<=pos;i++){
      diff=abs(curr_head-(R[i]));
      curr_head=R[i];
    seek=seek+diff;}
    
    
     printf("\n\nTotal head movements in CSCAN is: %d\n",seek);
     fprintf(fout,"\n\nTotal head movements in CSCAN is: %d\n",seek);
}
void main()
{   int i=0,n=0,max=0,j=0;

    fout = fopen("output.txt", "w");
    if (fout == NULL)
    {
        printf("Error opening file!\n");
        exit(1);
    }

   
    FILE *fptr;
    if ((fptr = fopen("input.txt", "r")) == NULL) {
        printf("Error! opening file\n");
        exit(1);
    }
    fscanf(fptr, "%d", &head);
    printf("Current head position: %d\n",head);
    fprintf(fout, "Current head position is: %d\n",head);
    fscanf(fptr, "%d", &max);
    printf("Maximum possible value: %d\n",max);
    fprintf(fout, "Maximum possible value is %d\n",max);
    
     i=ftell(fptr);

    printf("Requests are: ");
    fprintf(fout,"Requests are: ");
    while (!feof(fptr)){
        fscanf(fptr, "%d", &a);
        printf("%d ", a);
        fprintf(fout, "%d ", a);
        n++;
    }

    int R[n];

    fseek(fptr, i, SEEK_SET);
    while (!feof(fptr)){
        fscanf(fptr, "%d", &a);
        R[j]=a;
        j++;
    }
     fcfs(head,R,n);
     for (i = 0; i < n; ++i) 
        {
          for (j = i + 1; j < n; ++j)
            {
              if (R[i] >R[j]) 
                {
                    a = R[i];
                    R[i] = R[j];
                    R[j] = a;
 
                }
             }
         }
        
     scan(n,head,R,max);
     cscan(n,head,R,max);
fclose(fout);
}
