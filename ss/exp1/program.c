/*
Program: Implementation of scheduling Algorithm
Shuaib Abubakker Bapputty Haji
roll no : 56
TCR18CS056
*/

// Header File
#include<stdio.h>
#include<stdlib.h>
// Setting Quantum for Round Robin
#define QUANTUM 3

// Global Variables: Number of processes n , arr_time: Arrival Time
// burst_time: Burst Time, tat: Turn Arround Time, wait_time: Wait Time, prio: Priority
int n =0, *arr_time, *burst_time, *tat, *wait_time, *prio;
// Temp Variables
int a, b , c, x = 0;

// Print to file file pointer
FILE *fout;

// Re-read file: without quitting the program we can modify file
void reread(){
    // Reinitialization
    n  = 0;
    arr_time = NULL;
    burst_time = NULL;
    tat = NULL;
    wait_time = NULL;
    prio = NULL;
    x = 0;
    // Reading from the input.txt file
    FILE *fptr;
    if ((fptr = fopen("input.txt", "r")) == NULL) {
        printf("Error! opening file");
        exit(1);
    }
    // Taking the count of number of processes
    while (!feof(fptr)){
        fscanf(fptr, "%d\t%d\t%d", &a, &b, &c);
        n ++;
    }
    rewind(fptr);

    // Allocating space for the dynamic array
    arr_time = (int*) malloc(n  * sizeof(int));
    burst_time = (int*) malloc(n  * sizeof(int));
    tat = (int*) malloc(n  * sizeof(int));
    wait_time = (int*) malloc(n  * sizeof(int));
    prio = (int*) malloc(n  * sizeof(int));

    if(arr_time == NULL || burst_time == NULL || tat == NULL || wait_time == NULL || prio == NULL){
        printf("Error! memory not allocated.");
        exit(0);
    }

    // Reading from file
    while (!feof(fptr)){
        fscanf(fptr, "%d\t%d\t%d", arr_time+x, burst_time+x, prio+x);
        x++;        
    }
    fclose(fptr);
}

// First in first served Turn Around Calculation
void findTurnAroundFCFS(int n , int *arr_time, int *burst_time, int *tat){
    int cum=0;
    for (int x=0; x < n ; x++){
        *(tat+x) = cum - *(arr_time+x) + *(burst_time + x);
        cum += *(burst_time + x);
    }
}

// Shortest Job First Turn Around Calculation
void findTurnAroundSJF(int n , int *arr_time, int *burst_time, int *tat){
    int cum=0, count=0, t=0, min=10000, index=-1;
    while(1) {
        min=10000;
        index=-1;
        for (int x=0; x<n ; x++){
            if (*(arr_time+x) <= t && *(arr_time+x)!=-1 && *(burst_time+x) < min) {
                min = *(burst_time+x);
                index=x;
            }
        }
        t += min;
        cum += *(burst_time+index);
        *(tat+index) = cum - *(arr_time+index);
        *(arr_time+index) = -1;
        count++;
        if (count >= n ){
            break;
        }
    }
}

// Round Robin Turn Around Calculation
void findTurnAroundRR(int n , int *arr_time, int *burst_time, int *tat){
    int *bt_temp = (int *)malloc(n *sizeof(int));
    int count=0, t=0;
    for (int x=0; x<n ; x++){
        *(bt_temp+x) = *(burst_time+x);
    }
    while(1) {
        for(int x=0; x < n ; x++){
            if (*(arr_time+x) <= t && *(arr_time+x) != -1) {
                if (*(bt_temp+x) <= QUANTUM){
                    t += *(bt_temp+x);
                    *(tat+x) = t - *(arr_time+x);
                    *(arr_time+x) = -1;
                    count++;
                } else {
                    t += QUANTUM;
                    *(bt_temp+x) -= QUANTUM;
                }
            }
        }
        if (count >= n ){
            break;
        }
    }
}

// Priority Sheduling Turn Around Calculation
void findTurnAroundPriority(int n , int *arr_time, int *burst_time, int *tat, int *prio){
    int cum=0, count=0, t=0, min=10000, index=-1;
    while(1) {
        min=10000;
        index=-1;
        for (int x=0; x<n ; x++){
            if (*(arr_time+x) <= t && *(arr_time+x) != -1 && *(prio+x) < min){
                min = *(prio+x);
                index = x;
            }
        }
        t += *(burst_time+index);
        *(tat+index) = t - *(arr_time+index);
        count++;
        *(arr_time+index) = -1;
        if (count >= n ){
            break;
        }
    }
}

// Waiting Time calculation in all the cases
void findWaitingTime(int n , int *burst_time, int *tat, int *wait_time){
    for (int x=0; x < n ; x++){
        *(wait_time+x) = *(tat+x) - *(burst_time+x);
    }
}

// Displaying output of funtions and printing to the file
void display(){
    printf("Turn Arount Time\tWaiting Time\n ");
    fprintf(fout, "Turn Arount Time\tWaiting Time\n ");
    for (int x=0; x < n ; x++){
        // printf("%d\n ", *(tat + x));
        printf("%d\t\t\t%d\n ", *(tat + x), *(wait_time + x));
        fprintf(fout, "%d\t\t\t%d\n ", *(tat + x), *(wait_time + x));
    }
}















void main(){
    int menu=5, flag=1;
    // Printing Output to output.txt
    fout = fopen("./output.txt", "w");
    if (fout == NULL)
    {
        printf("Error opening file!\n ");
        exit(1);
    }
    // Reading and printing the contents of input.txt to console and output.txt
    printf("Input file contents:\n ");
    fprintf(fout, "Input file contents:\n ");
    FILE *fptr;
    if ((fptr = fopen("input.txt", "r")) == NULL) {
        printf("Error! opening file");
        exit(1);
    }
    printf("Arrival Time\tBurst Time\tPriority\n ");
    fprintf(fout, "Arrival Time\tBurst Time\tPriority\n ");
    while (!feof(fptr)){
        fscanf(fptr, "%d\t%d\t%d", &a, &b, &c);
        printf("%d\t\t%d\t\t%d\n ", a, b, c);
        fprintf(fout, "%d\t\t\t\t%d\t\t\t\t%d\n ", a, b, c);
    }
    
    // Menu Driver
    while (flag){
        printf("**            Choose           **\n1.FCFS\n2.SJF\n3.RR\n4.Priority\n5.Exit\nSelect:");
        scanf("%d", &menu);
        switch (menu)
        {
        case 1: 
            printf("First-Come-First-Serverd\n ");
            fprintf(fout, "First-Come-First-Serverd\n ");
            reread();
            findTurnAroundFCFS(n , arr_time, burst_time, tat);
            findWaitingTime(n , burst_time, tat, wait_time);
            display();
            break;

        case 2:
            printf("Shortest-Job-First\n ");
            fprintf(fout, "Shortest-Job-First\n ");
            reread();
            findTurnAroundSJF(n , arr_time, burst_time, tat);
            findWaitingTime(n , burst_time, tat, wait_time);
            display();
            break;

        case 3:
            printf("Round-Robin\n ");
            fprintf(fout, "Round-Robin\n ");
            reread();
            findTurnAroundRR(n , arr_time, burst_time, tat);
            findWaitingTime(n , burst_time, tat, wait_time);
            display();
            break;

        case 4:
            printf("Priority\n ");
            fprintf(fout, "Priority\n ");
            reread();
            findTurnAroundPriority(n , arr_time, burst_time, tat, prio);
            findWaitingTime(n , burst_time, tat, wait_time);
            display();
            break;
        
        case 5:
            flag=0;
            break;

        default:
            printf("Invalid Choice\n ");
            fprintf(fout, "Invalid Menu\n ");
            break;
        }
    }
    fclose(fout);
}
