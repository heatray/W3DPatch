#include "stdafx.h"

const char* DataPath = "Data2";

DWORD XString__XString = 0x61A545;
DWORD XString__RemoveInstance = 0x62A5CB;
DWORD XString__FreeRep = 0x61A4A5;

void __declspec(naked) InitOptionalPathsCodeCave()
{
    __asm {
        push    DataPath
        lea     ecx, dword ptr ss : [esp + 0x8]
        call    XString__XString
        mov     ecx, dword ptr ds : [esi]
        lea     edx, dword ptr ss : [esp + 0x4]
        push    edx
        push    esi
        call    dword ptr ds : [ecx + 0xC]
        lea     ecx, dword ptr ss : [esp + 0x4]
        call    XString__RemoveInstance
        mov     ecx, dword ptr ss : [esp + 0x4]
        add     ecx, 0xFFFFFFFA
        dec     word ptr ds : [ecx]
        cmp     word ptr ds : [ecx] , 0
        jne     InitPathsEnd
        call    XString__FreeRep
    InitPathsEnd :
        pop     esi
        pop     ecx
        ret
    }
}

void Init()
{
    injector::MakeJMP(0x44A8B9, InitOptionalPathsCodeCave, true);
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID lpReserved)
{
    if (reason == DLL_PROCESS_ATTACH)
    {
        if (strcmp((char*)0x70ADBC, "Worms 3D") == 0)
        {
            Init();
        }
    }
    return TRUE;
}
