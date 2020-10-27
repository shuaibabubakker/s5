/*
C program to generate Area and Perimeter of Parallelogram given base, height, and side

Shuaib Abubakker Bapputty Haji
Roll no :56   TCR18CS056

*/
#include <stdio.h>
#include <stdlib.h>

int area(int b, int h)
{
  return b * h;
}

int perimeter(int b, int s)
{
  return 2 * (b + s);
}

void main()
{
  int base, height, side, a, p;

  printf("Enter the base, height and side in order : \n");
  scanf("%d %d %d", &base, &height, &side);

  a = area(base, height);
  p = perimeter(base, side);

  printf("Area of the Parallelogram: %d x %d = %d \n", base, height, a);
  printf("Perimeter of the Parallelogram: 2(%d + %d) = %d \n", base, side, p);
}
