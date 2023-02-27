#include <reg51.h>
#include <stdio.h>

sbit delay=P1^1;
sbit toggle=P1^2;
int counter=0;
unsigned int a=0;
void  start_timer0(void)
{
   TR0=1;
}
void timer0(void)interrupt 1
{
   if(counter==0)
   {
      if(delay==0 && a==0)
      {
	 delay=1;
	 TH0=0xD8;
	 TL0=0xEF;
      }
      else
      {
	 a++;
	 delay=0;
	 if(a==9)
	 {
	    a=0;
	 }
	 TH0=0xD8;
	 TL0=0xEF;
      }
   }
   else if(counter==1)
   {
      if(delay==1)
      {
	 TH0=0x63;
	 TL0=0xBF;
      }
      else{
	  TH0=0xD8;
	 TL0=0xEF;
      }
      delay=~delay;
   }
   else if(counter==2)
   {
      if(delay==1)
      {
	 TH0=0xC5;
	 TL0=0x67;
      }
      else {
	 TH0=0xD8;
	 TL0=0xEF;
      }
      delay=~delay;
   }
     else if(counter==3)
   {
      if(delay==1)
      {
	 TH0=0xF6;
	 TL0=0x3B;
      }
      else {
	 TH0=0xD8;
	 TL0=0xEF;
      }
      delay=~delay;
   }
}

void init_timer0(void){
   TMOD=0x01;
   TH0=0xFB;
   TL0=0x9A;
   IE=0x83;
}

 
void main(void)
 { 
   // Write your code here
  init_timer0();
    start_timer0();
    while(1)
    {
       if(toggle==0)
       {
	  if(counter<3)
	     counter++;
	  else if(counter==3)
	     counter=0;
       }
    }
 }
