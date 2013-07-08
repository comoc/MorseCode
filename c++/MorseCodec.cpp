#include "MorseCodec.h"

#include <cstring>
#include <algorithm>
#include <cctype>
#include <list>

#include <unistd.h>
#include <sys/time.h>

using namespace std;

map<char, MorseCodec::Entry> MorseCodec::dictionary;

const int MorseCodec::A[] = {
    1, 3
};
const int MorseCodec::B[] = {
    3, 1, 1, 1
};
const int MorseCodec::C[] = {
    3, 1, 3, 1
};
const int MorseCodec::D[] = {
    3, 1, 1
};
const int MorseCodec::E[] = {
    1
};
const int MorseCodec::F[] = {
    1, 1, 3, 1
};
const int MorseCodec::G[] = {
    3, 3, 1
};
const int MorseCodec::H[] = {
    1, 1, 1, 1
};
const int MorseCodec::I[] = {
    1, 1
};
const int MorseCodec::J[] = {
    1, 3, 3, 3
};
const int MorseCodec::K[] = {
    3, 1, 3
};
const int MorseCodec::L[] = {
    1, 3, 1, 1
};
const int MorseCodec::M[] = {
    3, 3
};
const int MorseCodec::N[] = {
    3, 1
};
const int MorseCodec::O[] = {
    3, 3, 3
};
const int MorseCodec::P[] = {
    1, 3, 3, 1
};
const int MorseCodec::Q[] = {
    3, 3, 1, 3
};
const int MorseCodec::R[] = {
    1, 3, 1
};
const int MorseCodec::S[] = {
    1, 1, 1
};
const int MorseCodec::T[] = {
    3
};
const int MorseCodec::U[] = {
    1, 1, 3
};
const int MorseCodec::V[] = {
    1, 1, 1, 3
};
const int MorseCodec::W[] = {
    1, 3, 3
};
const int MorseCodec::X[] = {
    3, 1, 1, 3
};
const int MorseCodec::Y[] = {
    3, 1, 3, 3
};
const int MorseCodec::Z[] = {
    3, 3, 1, 1
};

const int MorseCodec::_1[] = {
    1, 3, 3, 3, 3
};
const int MorseCodec::_2[] = {
    1, 1, 3, 3, 3
};
const int MorseCodec::_3[] = {
    1, 1, 1, 3, 3
};
const int MorseCodec::_4[] = {
    1, 1, 1, 1, 3
};
const int MorseCodec::_5[] = {
    1, 1, 1, 1, 1
};
const int MorseCodec::_6[] = {
    3, 1, 1, 1, 1
};
const int MorseCodec::_7[] = {
    3, 3, 1, 1, 1
};
const int MorseCodec::_8[] = {
    3, 3, 3, 1, 1
};
const int MorseCodec::_9[] = {
    3, 3, 3, 3, 1
};
const int MorseCodec::_0[] = {
    3, 3, 3, 3, 3
};

const int MorseCodec::PERIOD[] = {
    1, 3, 1, 3, 1, 3
};
const int MorseCodec::COMMA[] = {
    3, 3, 1, 1, 3, 3
};
const int MorseCodec::QUESTION[] = {
    1, 1, 3, 3, 1, 1
};
const int MorseCodec::EXCLAMATION[] = {
    3, 1, 3, 1, 3, 3
};
const int MorseCodec::HYPHEN[] = {
    3, 1, 1, 1, 1, 3
};
const int MorseCodec::SLASH[] = {
    3, 1, 1, 3, 1
};
const int MorseCodec::AT[] = {
    1, 3, 3, 1, 3, 1
};
const int MorseCodec::OPEN_BLACKET[] = {
    3, 1, 3, 3, 1
};
const int MorseCodec::CLOSE_BLACKET[] = {
    3, 1, 3, 3, 1, 3
};

const int MorseCodec::SPACE[] = {
    1, 1, 1, 1, 1, 1
};

void MorseCodec::initializeDictionary()
{
    if (!dictionary.empty())
        return;
    dictionary.insert(pair<char, Entry>('A', Entry(A, sizeof(A)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('B', Entry(B, sizeof(B)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('C', Entry(C, sizeof(C)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('D', Entry(D, sizeof(D)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('E', Entry(E, sizeof(E)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('F', Entry(F, sizeof(F)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('G', Entry(G, sizeof(G)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('H', Entry(H, sizeof(H)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('I', Entry(I, sizeof(I)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('J', Entry(J, sizeof(J)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('K', Entry(K, sizeof(K)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('L', Entry(L, sizeof(L)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('M', Entry(M, sizeof(M)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('N', Entry(N, sizeof(N)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('O', Entry(O, sizeof(O)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('P', Entry(P, sizeof(P)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('Q', Entry(Q, sizeof(Q)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('R', Entry(R, sizeof(R)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('S', Entry(S, sizeof(S)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('T', Entry(T, sizeof(T)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('U', Entry(U, sizeof(U)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('V', Entry(V, sizeof(V)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('W', Entry(W, sizeof(W)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('X', Entry(X, sizeof(X)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('Y', Entry(Y, sizeof(Y)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('Z', Entry(Z, sizeof(Z)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('1', Entry(_1, sizeof(_1)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('2', Entry(_2, sizeof(_2)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('3', Entry(_3, sizeof(_3)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('4', Entry(_4, sizeof(_4)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('5', Entry(_5, sizeof(_5)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('6', Entry(_6, sizeof(_6)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('7', Entry(_7, sizeof(_7)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('8', Entry(_8, sizeof(_8)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('9', Entry(_9, sizeof(_9)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('0', Entry(_0, sizeof(_0)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('.', Entry(PERIOD, sizeof(PERIOD)/sizeof(int))));
    dictionary.insert(pair<char, Entry>(',', Entry(COMMA, sizeof(COMMA)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('?', Entry(QUESTION, sizeof(QUESTION)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('!', Entry(EXCLAMATION, sizeof(EXCLAMATION)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('-', Entry(HYPHEN, sizeof(HYPHEN)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('/', Entry(SLASH, sizeof(SLASH)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('@', Entry(AT, sizeof(AT)/sizeof(int))));
    dictionary.insert(pair<char, Entry>('(', Entry(OPEN_BLACKET, sizeof(OPEN_BLACKET)/sizeof(int))));
    dictionary.insert(pair<char, Entry>(')', Entry(CLOSE_BLACKET, sizeof(CLOSE_BLACKET)/sizeof(int))));
    dictionary.insert(pair<char, Entry>(' ', Entry(SPACE, sizeof(SPACE)/sizeof(int))));
}

char MorseCodec::getCharacter(const int* array, size_t len)
{
    initializeDictionary();
    for (map<char, Entry>::iterator it = dictionary.begin();
            it != dictionary.end(); it++) {
        size_t l = (*it).second.length;
        if (len != l)
            continue;

        const int* s = (*it).second.array;
        if (memcmp(array, s, sizeof(int) * l) == 0)
            return (*it).first; 
    }
    return 0;
}

const int* MorseCodec::getPattern(char c, size_t* length)
{
    initializeDictionary();
    map<char, Entry>::iterator it = dictionary.find(c);
    if (it == dictionary.end()) {
        if (length != 0)
            *length = 0;
        return 0;
    }
    if (length != 0)
        *length = (*it).second.length;
    return (*it).second.array;
}

vector<int> MorseCodec::encode(const std::string& str)
{
    string s(str);
    transform(s.begin(), s.end(), s.begin(), toupper);
    vector<int> c;
    for (int i = 0; i < s.length(); i++) {
        char ch = s.at(i);
        size_t len;
        const int* code = getPattern(ch, &len);
        if (code == 0)
            continue;
        if (len > 0) {
            for (int j = 0; j < len; j++) {
                int n = code[j];
                for (int k = 0; k < n; k++) {
                    c.push_back(1);
                } 
                c.push_back(0);
            }
        } else
            c.push_back(0);
        c.push_back(0);
        c.push_back(0);
    }

    return c;
}


namespace
{
    int64_t currentTimeMillis()
    {
        timeval tv;
        gettimeofday(&tv, 0);
        return (int64_t)tv.tv_sec * 1000 + (int64_t)tv.tv_usec / 1000;
    }
}


const float MorseCodec::Decoder::TOLERANCE = 2.0f;
const int64_t MorseCodec::Decoder::MINIMUM_RESOLUTION = 16;

MorseCodec::Decoder::Decoder()
: upstrokeTime(0), downstrokeTime(0), minimum(0), maximum(0), hlPrev(false)
{
}

string MorseCodec::Decoder::process(bool isHigh)
{
    string res = "";

    int64_t now = currentTimeMillis();
    if (!hlPrev && isHigh) {
        // LOW to HIGH
        if (downstrokeTime != 0) {
            int64_t d = downstrokeTime - now;
            if (d <= -MINIMUM_RESOLUTION)
                queue.push_back(d); // blank dulation, negative value represents a marker.
        }
        upstrokeTime = now;
    } else if (hlPrev && !isHigh) {
        // HIGH to LOW
        if (upstrokeTime != 0) {
            int64_t d = now - upstrokeTime;
            if (d >= MINIMUM_RESOLUTION)
                queue.push_back(d);
        }
        downstrokeTime = now;
    }
    hlPrev = isHigh;

    int lastIndex = -1;

    if (queue.size() >= 2) {
        for (int i = 0; i < queue.size(); i++) {
            int64_t d = (int64_t)queue.at(i);
            if (d < 0)
                d = -d;
            if (minimum == 0)
                minimum = maximum = d;
            else {
                // moving average
                if (minimum > d)
                    minimum = (d + minimum) / 2;
                else if (maximum < d)
                    maximum = (d + maximum) / 2;
            }
        }

        if (maximum >= minimum * 3) {
            int64_t dotMax = (int64_t)(minimum * TOLERANCE);
            int64_t dashMax = dotMax * 3;
            ///for (int i = queue.size() - 1; i >= 0; i--) {
            for (int i = 0; i < queue.size(); i++) {
                int64_t d = (int64_t)queue.at(i);  
                if (d < -dotMax) { // dash
                    lastIndex = i;
                    break;
                }
            }

            if (lastIndex >= 0) {

                // convert to string
                list<int> tmp;
                for (int i = 0; i < lastIndex; i++) {
                    int64_t d = (int64_t)queue.at(i);
                    if (d > 0 && d <= dotMax) {
                        tmp.push_back(1);
                    } else if (d > dotMax && d < dashMax) {
                        tmp.push_back(3);
                    }
                }            
                int* array = new int[tmp.size()];
                int j = 0;
                for (list<int>::iterator it = tmp.begin(); it != tmp.end(); it++) {
                    array[j] = *it;
                    j++;
                }
                char c = getCharacter(array, tmp.size());
                delete[] array;
                if (c != 0)
                    res = c;

                // remove processed items
                do {
                    queue.erase(queue.begin() + lastIndex);
                    lastIndex--;
                } 
                while (lastIndex >= 0);

            }
        }
    }
    return res;
}
