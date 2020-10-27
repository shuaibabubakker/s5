#include <stdio.h>
#include <stdlib.h>
#define p 5
#define r 3
int i, j, process;
int Max[p][r], need[p][r], alloc[p][r], avail[r], completed[p], safeSequence[p], req[r]; //declaring the required data structures
void needfn(int need[][r], int Max[][r], int alloc[][r])
{
	for (i = 0; i < p; i++)
	{
		for (j = 0; j < r; j++)
			need[i][j] = Max[i][j] - alloc[i][j];
	}
}
void display(FILE *fptr,int need[][r])
{
	printf("\nNEED\n");
	fprintf(fptr,"\nNEED\n");
	for (i = 0; i < p; i++)
	{
		for (j = 0; j < r; j++){
			printf("%d\t", need[i][j]);
			fprintf(fptr,"%d\t", need[i][j]);}
		printf("\n");
		fprintf(fptr,"\n");
	}
}
int check1(int req[], int rq, int need[][r])
{
	int f = 1;
	for (j = 0; j < r; j++)
	{
		if (req[j] > need[rq][j])
		{
			f = 0;
			break;
		}
	}
	return f;
}

int check2(int req[], int avail[])
{
	int f = 1;
	for (j = 0; j < r; j++)
	{
		if (req[j] > avail[j])
		{
			f = 0;
			break;
		}
	}
	return f;
}
void clear(int completed[])
{
	for (i = 0; i < p; i++)
	{
		completed[i] = 0;
	}
}


int safety(FILE *fptr,int available[], int Need[][r], int alloc[][r])

{

	//display(Need); /////
	int z, count = 0;
	for (z = 0; z < 10; z++)
	{

		process = -1;
		for (i = 0; i < p; i++)
		{
			if (completed[i] == 0) //if not completed
			{
				process = i;
				for (j = 0; j < r; j++)
				{

					if (available[j] < Need[i][j])
					{

						process = -1;
						break;
					}
				}
				//printf(" process : %d ", process);
				if (process != -1)
				{
          safeSequence[count] = process;
					count++;
					for (j = 0; j < r; j++)
					{
						available[j] += alloc[process][j];
					}
					completed[process] = 1;
				}
			}
			//printf(" % d ", count); //////////////?
		}
		if (count == p)
		{
			printf("SAFE SEQUENCE\n");
			fprintf(fptr,"SAFE SEQUENCE\n");
			for (i = 0; i < p; i++){
				printf("P%d-", safeSequence[i]);
				fprintf(fptr,"P%d-", safeSequence[i]);}
			printf("\n");
			fprintf(fptr,"\n");
			break;
		}
	}

	return count;
}
void call(FILE *fptr,int avail[], int req[], int rq, int alloc[][r], int need[][r])
{
	int avail1[r], alloc1[p][r], need1[p][r];
	for (i = 0; i < r; i++)
	{
		avail1[i] = avail[i] - req[i];

		//printf(" %d ", avail1[i]); //////?
	}

	for (i = 0; i < p; i++)
	{
		for (j = 0; j < r; j++)
		{
			if (i == rq)
			{
				alloc1[i][j] = alloc[i][j] + req[j];
				need1[i][j] = need[i][j] - req[j];
			}
			else
			{
				alloc1[i][j] = alloc[i][j];
				need1[i][j] = need[i][j];
			}
			//printf(" %d ", alloc1[i][j]);
		}
	}
	display(fptr,need1);
	int p1;

	p1 = safety(fptr,avail1, need1, alloc1);
	//printf(" Temp p: %d ", p1); ////////////?

	if (p1 != p){
		printf("\nREQUEST DENIED ");
		fprintf(fptr,"\nREQUEST DENIED ");}
}

int main()
{
	FILE *ptr, *fptr;
	if ((ptr = fopen("input.txt", "r")) == NULL)
	{
		printf("Error in opening File\n");
		return 0;
	}
	fptr = fopen("output.txt", "w");
	if (fptr == NULL)
	{
		printf("Error opening file!\n");
		return 0;
	}
	char s[10], st;
	int t;
	fscanf(ptr, "%s", s);
	printf("%s\n", s);
	for (i = 0; i < p; i++)
	{
		//st=fgetc(ptr);
		fscanf(ptr, "%d\t%d\t%d", &Max[i][0], &Max[i][1], &Max[i][2]);
		printf("%c%d\t%d\t%d\t%d\n", 'P', i, Max[i][0], Max[i][1], Max[i][2]);
	}
	fscanf(ptr, "%s", s);
	printf("%s\n", s);
	for (i = 0; i < p; i++)
	{
		//st=fgetc(ptr);
		fscanf(ptr, "%d\t%d\t%d", &alloc[i][0], &alloc[i][1], &alloc[i][2]);
		printf("%c%d\t%d\t%d\t%d\n", 'P', i, alloc[i][0], alloc[i][1], alloc[i][2]);
	}
	fscanf(ptr, "%s", s);
	printf("%s\n", s);
	fscanf(ptr, "%d\t%d\t%d", &avail[0], &avail[1], &avail[2]);
	printf("%d\t%d\t%d", avail[0], avail[1], avail[2]);
	needfn(need, Max, alloc);
	display(fptr,need);
	int av[r];
	for (i = 0; i < r; i++)
		av[i] = avail[i];
	clear(completed);
	safety(fptr,av, need, alloc);
	int h = 1, z;
	while (!feof(ptr))
	{
		fscanf(ptr, "%s", s);
		printf("\n%s\n", s);
		//st=fgetc(ptr);
		fscanf(ptr, "%d\t%d\t%d\t%d", &t, &req[0], &req[1], &req[2]);
		printf("%c%d:\t%d\t%d\t%d", 'P', t, req[0], req[1], req[2]);
		z = check1(req, t, need);
		if (z != 1)
		{
			printf("\nREQUEST DENIED ");
			fprintf(fptr,"\nREQUEST DENIED ");
			return 0;
		}
		z = check2(req, avail);
		if (z != 1)
		{
			printf("\nREQUEST DENIED ");
			fprintf(fptr,"\nREQUEST DENIED ");
			return 0;
		}
		clear(completed);
		call(fptr,avail, req, t, alloc, need);
	}
}
