#include "stdafx.h"

float AspectRatio43 = 4.0f / 3.0f;
float AspectRatio34 = 3.0f / 4.0f;
float F2 = 2.0f;
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
struct MovieRect
{
    int vX = 0;
    int vY = 0;
    int vW = 640;
    int vH = 480;
} MovieRect;
bool AspectRatioFix;
uint8_t FrameInterval;

bool NoMusic, NoMovies, NoMoviesIntro;

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

float FE_Textbox_Back_Scale = 900.0f;
float EFMV_Border_Width = 900.0f;

DWORD* Worms3dApp__c_pTheInstance = (DWORD*)0x7ADDE4;
DWORD AspectRatioCodeCaveExit = 0x629F72;
DWORD FrustumCodeCaveExit = 0x44ADBB;
DWORD SetFromSceneCameraCodeCaveExit = 0x63B469;
DWORD MoviePlayerPCCodeCaveExit = 0x61A06F;

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

    AspectRatioX :
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

    AspectRatioY :
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
        fmul    st, st(1)
        fstp    dword ptr ds : [ebp + 0xC]
        fld     dword ptr ds : [eax + 0x2C]
        fmul    dword ptr ds : [Screen.AspectRatioY]
        push    edi
        jmp     SetFromSceneCameraCodeCaveExit
    }
}

void __declspec(naked) MoviePlayerPCCodeCave()
{
    __asm {
        mov     edx, dword ptr ss : [esp + 0x18] // Right
        mov     dword ptr ds : [MovieRect.vW] , edx
        mov     edx, dword ptr ss : [esp + 0x1C] // Bottom
        mov     dword ptr ds : [MovieRect.vH] , edx
        fild    dword ptr ds : [MovieRect.vH]
        fidiv   dword ptr ds : [MovieRect.vW]
        fld     dword ptr ds : [AspectRatio34]
        fcomip  st(0), st(1)
        fstp    st(0)
        jne     AspectRatioX
        jmp     MoviePlayerEnd

    AspectRatioX :
        // vW = B * (4 / 3)     vH = B
        // vX = (R - vW) / 2    vY = 0
        jb      AspectRatioY
        fild    dword ptr ss : [esp + 0x18] // Width
        fild    dword ptr ss : [esp + 0x1C] // Height
        fld     dword ptr ds : [AspectRatio43]
        fmul    st(0), st(1)
        fistp   dword ptr ds : [MovieRect.vW]
        fistp   dword ptr ds : [MovieRect.vH]
        fisub   dword ptr ds : [MovieRect.vW]
        fld     dword ptr ds : [F2]
        fdivp   st(1), st(0)
        fistp   dword ptr ds : [MovieRect.vX]
        jmp     MoviePlayerEnd

    AspectRatioY :
        // vW = R    vH = R * (3 / 4)
        // vX = 0    vY = (B - vH) / 2
        fild    dword ptr ss : [esp + 0x1C] // Height
        fild    dword ptr ss : [esp + 0x18] // Width
        fld     dword ptr ds : [AspectRatio34]
        fmul    st(0), st(1)
        fistp   dword ptr ds : [MovieRect.vH]
        fistp   dword ptr ds : [MovieRect.vW]
        fisub   dword ptr ds : [MovieRect.vH]
        fld     dword ptr ds : [F2]
        fdivp   st(1), st(0)
        fistp   dword ptr ds : [MovieRect.vY]
        jmp     MoviePlayerEnd

    MoviePlayerEnd :
        mov     edx, dword ptr ds : [MovieRect.vH]
        push    edx
        mov     edx, dword ptr ds : [MovieRect.vW]
        push    edx
        mov     edx, dword ptr ds : [MovieRect.vY]
        push    edx
        mov     edx, dword ptr ds : [MovieRect.vX]
        push    edx
        jmp     MoviePlayerPCCodeCaveExit
    }
}

void Init()
{
    CIniReader iniReader("");

    AspectRatioFix = iniReader.ReadInteger("Main", "AspectRatioFix", 0) == 1;
    FrameInterval = iniReader.ReadInteger("Main", "FrameInterval", 16);
    NoMusic = iniReader.ReadInteger("Options", "NoMusic", 0) == 1;
    NoMovies = iniReader.ReadInteger("Options", "NoMovies", 0) == 1;
    NoMoviesIntro = iniReader.ReadInteger("Options", "NoMoviesIntro", 0) == 1;
    Borderless = iniReader.ReadInteger("Window", "Borderless", 0) == 1;
    GameSpyHost = iniReader.ReadString("GameSpy", "Host", "gamespy.com");

    if (AspectRatioFix)
    {
        // Worms3dApp::Initialize
        injector::MakeJMP(0x629F6D, AspectRatioCodeCave);

        // Worms3dApp::InitScene
        injector::WriteMemory<FLOAT*>(0x44AE0B, &Frustum.Right, true);
        injector::WriteMemory<FLOAT*>(0x44AE2B, &Frustum.Top, true);

        // XomHelp::Xom3dAppBase::CreateCamera
        injector::MakeJMP(0x44AD9B, FrustumCodeCave);

        // XCamera::SetFromSceneCamera
        injector::MakeJMP(0x63B45D, SetFromSceneCameraCodeCave);

        // PopUpEntity::Initialize
        injector::WriteMemory<FLOAT>(0x5D648C, FE_Textbox_Back_Scale, true);
        injector::WriteMemory<FLOAT>(0x5D6494, FE_Textbox_Back_Scale, true);

        // EfmvBorderEntity::EfmvBorderEntity
        injector::WriteMemory<FLOAT*>(0x4EC2B6, &EFMV_Border_Width, true);

        // MoviePlayerPC::Open
        injector::MakeJMP(0x61A05F, MoviePlayerPCCodeCave);
    }

    if (FrameInterval != 16)
    {
        // Worms3dApp::UpdateScene
        injector::WriteMemory<BYTE>(0x44B53D, FrameInterval, true);
        injector::WriteMemory<BYTE>(0x44B541, FrameInterval, true);
    }

    if (NoMusic)
    {
        injector::WriteMemory<BYTE>(0x76FC60, 0x0, true);
    }
    if (NoMovies || NoMoviesIntro)
    {
        BYTE OptionsByte1 = 0x93;
        BYTE OptionsByte2 = 0x13;
        if (NoMoviesIntro)
        {
            OptionsByte1 &= ~0x1;
            OptionsByte2 &= ~0x1;
        }
        if (NoMovies)
        {
            OptionsByte1 &= ~0x2;
            OptionsByte2 &= ~0x2;
        }
        injector::WriteMemory<BYTE>(0x44A321, OptionsByte1, true);
        injector::WriteMemory<BYTE>(0x44A323, OptionsByte2, true);
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
        if (strcmp((char*)0x70ADBC, "Worms 3D") == 0)
        {
            Init();
        }
    }
    return TRUE;
}
