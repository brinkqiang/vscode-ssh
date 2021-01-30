
#include "sample.h"

int main( int argc, char* argv[] ) {

    Isample* module = sampleGetModule();
    if (module)
    {
        module->Test();
        module->Release();
    }
    return 0;
}
