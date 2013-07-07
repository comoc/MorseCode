#include "MorseCodec.h"
#include <string>
#include <iostream>
#include <unistd.h>

using namespace std;

int main(void)
{
    MorseCodec::Decoder dec;

    vector<int> codes = MorseCodec::encode("HELLO WORLD ");

    // try to decode twice
    for (int i = 0; i < 2; i++) {
        string result;
        for (vector<int>::iterator itr = codes.begin(); itr != codes.end(); itr++) {
            cout << *itr;
            cout.flush();
            
            result += dec.process((*itr));

            usleep(100000); // 100 msec
        }
        cout << endl;
        cout << i << ":" << result << endl;
    }
    return 0;
}
