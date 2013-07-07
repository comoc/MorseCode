#include "MorseCodec.h"
#include <string>
#include <iostream>
#include <unistd.h>

using namespace std;

int main(void)
{
    MorseCodec::Decoder dec;

    vector<int> codes = MorseCodec::encode("START HELLO WORLD END ");

    // try to decode twice
    for (int i = 0; i < 2; i++) {
        cout << "======== Loop:" << i << " ========"<< endl;
        string result;
        for (vector<int>::iterator itr = codes.begin(); itr != codes.end(); itr++) {
            
            result += dec.process((*itr));
            cout << *itr << ":" << result << endl;

            usleep(100000); // 100 msec
        }
    }
    return 0;
}
