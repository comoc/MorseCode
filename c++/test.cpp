#include "MorseCodec.h"
#include <string>
#include <iostream>
#include <unistd.h>

using namespace std;

int rand2(int min, int max)
{
    if (max <= min)
        return min;
    return min + rand() % (max - min);
}

int main(void)
{
    MorseCodec::Decoder dec;

    vector<int> codes = MorseCodec::encode("START HELLO WORLD END ");

    // try to decode twice
    for (int i = 0; i < 2; i++) {
        cout << "======== Loop:" << i << " ========"<< endl;
        string result;
        for (vector<int>::iterator itr = codes.begin(); itr != codes.end(); itr++) {
            
            result += dec.process((*itr) > 0);
            cout << *itr << ":" << result << endl;
            
            int waitWithJitter = rand2(-1700, 1700) + 17000;
            cout << waitWithJitter << endl;
            usleep(waitWithJitter);
        }
    }
    return 0;
}
