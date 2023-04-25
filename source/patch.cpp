#include "stdafx.h"

struct Screen
{
    int Width = 800;
    int Height = 600;
    float AspectRatioX = 4.0f / 3.0f;
    float AspectRatioY = 3.0f / 4.0f;
} Screen;
struct Frustum
{
    float Left = -0.64f;
    float Right = 0.64f;
    float Bottom = -0.48f;
    float Top = 0.48f;
} Frustum;
bool AspectRatioFix;
uint8_t FrameInterval;

bool Borderless;

std::string GameSpyHost;
struct GameSpy
{
    char ServerBrowser[128] = "%s.ms%d.";  // Master - Server Browser
    char QueryReport[128] = "%s.master.";  // Master - Query Report 2
    char ConnectionManager[128] = "gpcm."; // Presence - Connection Manager
    char SearchPlayer[128] = "gpsp.";      // Presence - Search Player
    char PeerChat[128] = "peerchat.";      // Chat
    char GameStats[128] = "gamestats.";    // Game Statistics
    char SdkDev[128] = "sdkdev.";          // SDK Dev
} GS;

DWORD* Worms3dApp__c_pTheInstance = (DWORD*)0x7ADDE4;
DWORD AspectRatioCodeCaveExit = 0x629F72;
DWORD FrustumCodeCaveExit = 0x44ADBB;
DWORD SetFromSceneCameraCodeCaveExit = 0x63B469;

void __declspec(naked) AspectRatioCodeCave()
{
    __asm {
        mov     ecx, dword ptr ds : [0x7ADDE4]
        mov     ecx, [ecx + 0x20]
        mov     Screen.Width, ecx
        mov     ecx, dword ptr ds : [0x7ADDE4]
        mov     ecx, [ecx + 0x24]
        mov     Screen.Height, ecx
        fild    dword ptr ds : [Screen.Height]
        fild    dword ptr ds : [Screen.Width]
        fdivp   st(1), st
        fld     dword ptr ds : [Screen.AspectRatioY]
        fcomip  st, st(1)
        fstp    st
        jne     AspectRatioX
        jmp     AspectRatioCodeCaveExit

    AspectRatioX:
        jb      AspectRatioY
        fild    dword ptr ds : [Screen.Width]
        fild    dword ptr ds : [Screen.Height]
        fdivp   st(1), st
        fstp    dword ptr ds : [Screen.AspectRatioX]
        fld     dword ptr ds : [Screen.AspectRatioX]
        fmul    dword ptr ds : [Frustum.Bottom]
        fstp    dword ptr ds : [Frustum.Left]
        fld     dword ptr ds : [Screen.AspectRatioX]
        fmul    dword ptr ds : [Frustum.Top]
        fstp    dword ptr ds : [Frustum.Right]
        jmp     AspectRatioCodeCaveExit

    AspectRatioY:
        fild    dword ptr ds : [Screen.Height]
        fild    dword ptr ds : [Screen.Width]
        fdivp   st(1), st
        fstp    dword ptr ds : [Screen.AspectRatioY]
        fld     dword ptr ds : [Screen.AspectRatioY]
        fmul    dword ptr ds : [Frustum.Left]
        fstp    dword ptr ds : [Frustum.Bottom]
        fld     dword ptr ds : [Screen.AspectRatioY]
        fmul    dword ptr ds : [Frustum.Right]
        fstp    dword ptr ds : [Frustum.Top]
        jmp     AspectRatioCodeCaveExit
    }
}

void __declspec(naked) FrustumCodeCave()
{
    __asm {
        fld     dword ptr ds : [Frustum.Left]
        fstp    dword ptr ds : [esp + 0x30]
        fld     dword ptr ds : [Frustum.Right]
        fstp    dword ptr ds : [esp + 0x34]
        fld     dword ptr ds : [Frustum.Bottom]
        fstp    dword ptr ds : [esp + 0x38]
        fld     dword ptr ds : [Frustum.Top]
        fstp    dword ptr ds : [esp + 0x3C]
        jmp     FrustumCodeCaveExit
    }
}

void __declspec(naked) SetFromSceneCameraCodeCave()
{
    __asm {
        fld     dword ptr ds : [eax + 0x30]
        fmul    dword ptr ds : [Screen.AspectRatioX]
        push    edi
        fmul    st, st(1)
        fstp    dword ptr ds : [ebp + 0xC]
        fld     dword ptr ds : [eax + 0x2C]
        fmul    dword ptr ds : [Screen.AspectRatioY]
        jmp     SetFromSceneCameraCodeCaveExit
    }
}

void Init()
{
    CIniReader iniReader("");

    AspectRatioFix = iniReader.ReadInteger("Main", "AspectRatioFix", 0) == 1;
    FrameInterval = iniReader.ReadInteger("Main", "FrameInterval", 16);
    Borderless = iniReader.ReadInteger("Window", "Borderless", 0) == 1;
    GameSpyHost = iniReader.ReadString("GameSpy", "Host", "gamespy.com");

    if (AspectRatioFix)
    {
        injector::MakeJMP(0x629F6D, AspectRatioCodeCave, true);
        injector::MakeJMP(0x44AD9B, FrustumCodeCave, true);
        injector::WriteMemory<FLOAT*>(0x44AE0B, &Frustum.Right, true);
        injector::WriteMemory<FLOAT*>(0x44AE2B, &Frustum.Top, true);
        injector::MakeJMP(0x63B45D, SetFromSceneCameraCodeCave, true);
        injector::WriteMemory<FLOAT>(0x719F34, 900.0f, true);
    }

    if (FrameInterval != 16)
    {
        injector::WriteMemory<BYTE>(0x44B53D, FrameInterval, true);
        injector::WriteMemory<BYTE>(0x44B541, FrameInterval, true);
    }

    if (Borderless)
    {
        injector::WriteMemory<DWORD>(0x6C3F5B, 0x96030000, true);
        injector::WriteMemory<DWORD>(0x6C3F65, 0x96030000, true);
        injector::WriteMemory<BYTE>(0x69C6B2, 0, true);
        injector::WriteMemory<BYTE>(0x69C6B4, 0, true);
    }

    if (GameSpyHost != "gamespy.com")
    {
        strcat_s(GS.ServerBrowser, GameSpyHost.c_str());
        strcat_s(GS.QueryReport, GameSpyHost.c_str());
        strcat_s(GS.ConnectionManager, GameSpyHost.c_str());
        strcat_s(GS.SearchPlayer, GameSpyHost.c_str());
        strcat_s(GS.PeerChat, GameSpyHost.c_str());
        strcat_s(GS.GameStats, GameSpyHost.c_str());
        strcat_s(GS.SdkDev, GameSpyHost.c_str());
        injector::WriteMemory(0x6112B7, &GS.ServerBrowser, true);
        injector::WriteMemory(0x5F9E1A, &GS.QueryReport, true);
        injector::WriteMemory(0x602FBA, &GS.ConnectionManager, true);
        injector::WriteMemory(0x603C4D, &GS.SearchPlayer, true);
        injector::WriteMemory(0x60B6F9, &GS.PeerChat, true);
        injector::WriteMemory(0x5E8A52, &GS.GameStats, true);
        injector::WriteMemory(0x5F4B1E, &GS.GameStats, true);
        injector::WriteMemory(0x5E8A4D, &GS.SdkDev, true);
    }
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID lpReserved)
{
    if (reason == DLL_PROCESS_ATTACH)
    {
        Init();
    }
    return TRUE;
}
