#include <reg51.h>
#include <stdio.h>


sbit PIN = P1^1;
sbit LED = P1^2;

void Delay(unsigned int delay);

int main(){
    while(1){
        if(PIN == 0){
            LED = 1;
            Delay(6);
            LED = 0;
            Delay(4);
        }else if (PIN == 1){
            LED = 1;
            Delay(2);
            LED = 0;
            Delay(3);
        }else;
    }

    return 0;
}

void Delay(unsigned int delay){
    unsigned int i;
    unsigned int j;

    for (i = 0; i<delay; i++){
        for (j = 0; j<123; j++);
    }
}