#include "stdafx.h"
#include <mmsystem.h>
#pragma comment(lib, "winmm.lib")

float AspectRatioX = 4.0f / 3.0f;
float AspectRatioY = 3.0f / 4.0f;
struct Frustum
{
    float Left = -0.64f;
    float Right = 0.64f;
    float Bottom = -0.48f;
    float Top = 0.48f;
} Frustum;

struct Worms3dApp
{
    char pad[0x20];
    int RenderWidth;
    int RenderHeight;
};
tagRECT MovieRect;
bool AspectRatioFix, SleepFix, Borderless, NoMusic, NoMovies, NoMoviesIntro;
uint8_t FrameInterval;
std::string GameSpyHost;
struct GameSpy
{
    std::string ServerBrowser = "%s.ms%d.";  // Master - Server Browser
    std::string QueryReport = "%s.master.";  // Master - Query Report 2
    std::string ConnectionManager = "gpcm."; // Presence - Connection Manager
    std::string SearchPlayer = "gpsp.";      // Presence - Search Player
    std::string PeerChat = "peerchat.";      // Chat
    std::string GameStats = "gamestats.";    // Game Statistics
    std::string SdkDev = "sdkdev.";          // SDK Dev
};

void __declspec(naked) AspectRatioCodeCave()
{
    static const DWORD Exit = 0x629F72;
    static Worms3dApp* App;
    static int Width, Height;

    __asm pushad

    App = *reinterpret_cast<Worms3dApp**>(0x7ADDE4);
    Width = App->RenderWidth;
    Height = App->RenderHeight;
    AspectRatioX = (float)Width / (float)Height;
    AspectRatioY = (float)Height / (float)Width;
    MovieRect.left = 0;
    MovieRect.top = 0;
    MovieRect.right = Width;
    MovieRect.bottom = Height;

    if (AspectRatioY < 3.0f / 4.0f)      // Hor+
    {
        Frustum.Left = AspectRatioX * Frustum.Bottom;
        Frustum.Right = AspectRatioX * Frustum.Top;
        MovieRect.right = (int)(MovieRect.bottom * 4.0f / 3.0f);
        MovieRect.left = (int)((Width - MovieRect.right) / 2.0f);
    }
    else if (AspectRatioY > 3.0f / 4.0f) // Vert+
    {
        Frustum.Bottom = AspectRatioY * Frustum.Left;
        Frustum.Top = AspectRatioY * Frustum.Right;
        MovieRect.bottom = (int)(MovieRect.right * 3.0f / 4.0f);
        MovieRect.top = (int)((Height - MovieRect.bottom) / 2.0f);
    }

    __asm popad
    __asm jmp Exit
}

void __declspec(naked) FrustumCodeCave()
{
    static const DWORD Exit = 0x44ADBB;
    __asm {
        fld dword ptr ds : [Frustum.Left]
        fstp dword ptr ds : [esp + 0x30]
        fld dword ptr ds : [Frustum.Right]
        fstp dword ptr ds : [esp + 0x34]
        fld dword ptr ds : [Frustum.Bottom]
        fstp dword ptr ds : [esp + 0x38]
        fld dword ptr ds : [Frustum.Top]
        fstp dword ptr ds : [esp + 0x3C]
        jmp Exit
    }
}

void __declspec(naked) SetFromSceneCameraCodeCave()
{
    static const DWORD Exit = 0x63B45A;
    static float ApertureX, ApertureY;

    __asm {
        fld dword ptr ds : [eax + 0x2C]
        fstp ApertureX
        fld dword ptr ds : [eax + 0x30]
        fstp ApertureY
        pushad
    }

    if (AspectRatioY < 3.0f / 4.0f)      // Hor+
        ApertureX = ApertureY * AspectRatioX;
    else if (AspectRatioY > 3.0f / 4.0f) // Vert+
        ApertureY = ApertureX * AspectRatioY;

    __asm {
        popad
        fld ApertureX
        fstp dword ptr ds : [eax + 0x2C]
        fld ApertureY
        fstp dword ptr ds : [eax + 0x30]
        fld dword ptr ds : [0x74A48C]
        jmp Exit
    }
}

void __declspec(naked) MoviePlayerPCCodeCave()
{
    static const DWORD Exit = 0x61A06F;
    __asm {
        mov edx, dword ptr ds : [MovieRect.bottom]
        push edx
        mov edx, dword ptr ds : [MovieRect.right]
        push edx
        mov edx, dword ptr ds : [MovieRect.top]
        push edx
        mov edx, dword ptr ds : [MovieRect.left]
        push edx
        jmp Exit
    }
}

void Init()
{
    CIniReader iniReader("");

    AspectRatioFix = iniReader.ReadInteger("Main", "AspectRatioFix", 0) == 1;
    SleepFix = iniReader.ReadInteger("Main", "SleepFix", 0) == 1;
    FrameInterval = iniReader.ReadInteger("Main", "FrameInterval", 16);

    Borderless = iniReader.ReadInteger("Options", "Borderless", 0) == 1;
    NoMusic = iniReader.ReadInteger("Options", "NoMusic", 0) == 1;
    NoMovies = iniReader.ReadInteger("Options", "NoMovies", 0) == 1;
    NoMoviesIntro = iniReader.ReadInteger("Options", "NoMoviesIntro", 0) == 1;

    GameSpyHost = iniReader.ReadString("GameSpy", "Host", "gamespy.com");

    // Main

    if (AspectRatioFix)
    {
        // Worms3dApp::Initialize
        injector::MakeJMP(0x629F6D, AspectRatioCodeCave);

        // Worms3dApp::InitScene
        injector::MakeJMP(0x44AD9B, FrustumCodeCave);
        injector::WriteMemory<float*>(0x44AE0B, &Frustum.Right, true);
        injector::WriteMemory<float*>(0x44AE2B, &Frustum.Top, true);

        // XCamera::SetFromSceneCamera
        injector::MakeJMP(0x63B454, SetFromSceneCameraCodeCave);

        // PopUpEntity::Initialize
        static float FE_Textbox_Back_Scale = 900.0f;
        injector::WriteMemory<float>(0x5D648C, FE_Textbox_Back_Scale, true);
        injector::WriteMemory<float>(0x5D6494, FE_Textbox_Back_Scale, true);

        // EfmvBorderEntity::EfmvBorderEntity
        static float EFMV_Border_Width = 900.0f;
        injector::WriteMemory<float*>(0x4EC2B6, &EFMV_Border_Width, true);

        // MoviePlayerPC::Open
        injector::MakeJMP(0x61A05F, MoviePlayerPCCodeCave);
    }

    if (SleepFix)
    {
        timeBeginPeriod(1);
    }

    if (FrameInterval != 16)
    {
        // Worms3dApp::UpdateScene
        injector::WriteMemory<BYTE>(0x44B53D, FrameInterval, true);
        injector::WriteMemory<BYTE>(0x44B541, FrameInterval, true);
    }

    // Options

    if (Borderless)
    {
        injector::WriteMemory<DWORD>(0x6C3F5B, 0x96030000, true);
        injector::WriteMemory<DWORD>(0x6C3F65, 0x96030000, true);
        injector::WriteMemory<BYTE>(0x69C6B2, 0, true);
        injector::WriteMemory<BYTE>(0x69C6B4, 0, true);
    }

    if (NoMusic)
    {
        injector::WriteMemory<BYTE>(0x76FC60, 0, true);
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

    // GameSpy

    if (GameSpyHost != "gamespy.com")
    {
        static GameSpy GS;
        GS.ServerBrowser += GameSpyHost;
        GS.QueryReport += GameSpyHost;
        GS.ConnectionManager += GameSpyHost;
        GS.SearchPlayer += GameSpyHost;
        GS.PeerChat += GameSpyHost;
        GS.GameStats += GameSpyHost;
        GS.SdkDev += GameSpyHost;
        injector::WriteMemory(0x6112B7, GS.ServerBrowser.c_str(), true);
        injector::WriteMemory(0x5F9E1A, GS.QueryReport.c_str(), true);
        injector::WriteMemory(0x602FBA, GS.ConnectionManager.c_str(), true);
        injector::WriteMemory(0x603C4D, GS.SearchPlayer.c_str(), true);
        injector::WriteMemory(0x60B6F9, GS.PeerChat.c_str(), true);
        injector::WriteMemory(0x5E8A52, GS.GameStats.c_str(), true);
        injector::WriteMemory(0x5F4B1E, GS.GameStats.c_str(), true);
        injector::WriteMemory(0x5E8A4D, GS.SdkDev.c_str(), true);
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
