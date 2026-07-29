#include "stdafx.h"
#include <mmsystem.h>
#pragma comment(lib, "winmm.lib")

bool AspectRatioFix, SleepFix, Borderless, NoMusic, NoVoices;
char Fullscreen, NoAutoLoop, Options[40];
uint8_t FrameInterval;
std::string GameSpyHost;

struct Worms3dApp
{
    char pad_0[0x20];
    int RenderWidth;
    int RenderHeight;
    char Fullscreen;
    char pad_29[0x9F];
    char Options[8];
};
struct FlowControlService
{
    char pad_0[0xF4];
    char AutoLoop;
};
float AspectRatioX = 4.0f / 3.0f;
float AspectRatioY = 3.0f / 4.0f;
struct Frustum
{
    float Left = -0.64f;
    float Right = 0.64f;
    float Bottom = -0.48f;
    float Top = 0.48f;
} Frustum;
tagRECT MovieRect;
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

void __declspec(naked) OptionsCodeCave()
{
    static const DWORD Exit = 0x44D957;
    static const DWORD Worms3dApp__ParsePreInitFinalCommands = 0x44C7B0;
    static Worms3dApp* App;
    // static FlowControlService* FCS;

    __asm call Worms3dApp__ParsePreInitFinalCommands
    __asm pushad

    App = *reinterpret_cast<Worms3dApp**>(0x7ADDE4);

    if      (Fullscreen == 1) App->Fullscreen |= 1;
    else if (Fullscreen == 0) App->Fullscreen &= ~1;

    if      (Options[0] == 1) App->Options[0] |= 0x01;
    else if (Options[0] == 0) App->Options[0] &= ~0x01;
    if      (Options[1] == 1) App->Options[0] |= 0x02;
    else if (Options[1] == 0) App->Options[0] &= ~0x02;
    if      (Options[2] == 1) App->Options[0] |= 0x04;
    else if (Options[2] == 0) App->Options[0] &= ~0x04;
    if      (Options[3] == 1) App->Options[0] |= 0x08;
    else if (Options[3] == 0) App->Options[0] &= ~0x08;
    if      (Options[4] == 1) App->Options[0] |= 0x10;
    else if (Options[4] == 0) App->Options[0] &= ~0x10;
    if      (Options[5] == 1) App->Options[0] |= 0x20;
    else if (Options[5] == 0) App->Options[0] &= ~0x20;
    if      (Options[6] == 1) App->Options[0] |= 0x40;
    else if (Options[6] == 0) App->Options[0] &= ~0x40;
    if      (Options[7] == 1) App->Options[0] |= 0x80;
    else if (Options[7] == 0) App->Options[0] &= ~0x80;
    if      (Options[8] == 1) App->Options[1] |= 0x01;
    else if (Options[8] == 0) App->Options[1] &= ~0x01;
    if      (Options[9] == 1) App->Options[1] |= 0x02;
    else if (Options[9] == 0) App->Options[1] &= ~0x02;
    if      (Options[10] == 1) App->Options[1] |= 0x04;
    else if (Options[10] == 0) App->Options[1] &= ~0x04;
    if      (Options[11] == 1) App->Options[1] |= 0x08;
    else if (Options[11] == 0) App->Options[1] &= ~0x08;
    if      (Options[12] == 0) App->Options[1] |= 0x10;
    else if (Options[12] == 1) App->Options[1] &= ~0x10;
    if      (Options[13] == 1) App->Options[1] |= 0x20;
    else if (Options[13] == 0) App->Options[1] &= ~0x20;
    if      (Options[14] == 1) App->Options[1] |= 0x40;
    else if (Options[14] == 0) App->Options[1] &= ~0x40;
    if      (Options[15] == 1) App->Options[1] |= 0x80;
    else if (Options[15] == 0) App->Options[1] &= ~0x80;
    if      (Options[16] == 1) App->Options[2] |= 0x01;
    else if (Options[16] == 0) App->Options[2] &= ~0x01;
    if      (Options[17] == 1) App->Options[2] |= 0x02;
    else if (Options[17] == 0) App->Options[2] &= ~0x02;
    if      (Options[18] == 1) App->Options[2] |= 0x04;
    else if (Options[18] == 0) App->Options[2] &= ~0x04;
    if      (Options[19] == 1) App->Options[2] |= 0x08;
    else if (Options[19] == 0) App->Options[2] &= ~0x08;
    if      (Options[20] == 1) App->Options[2] |= 0x10;
    else if (Options[20] == 0) App->Options[2] &= ~0x10;
    if      (Options[21] == 1) App->Options[2] |= 0x20;
    else if (Options[21] == 0) App->Options[2] &= ~0x20;
    if      (Options[22] == 1) App->Options[2] |= 0x40;
    else if (Options[22] == 0) App->Options[2] &= ~0x40;
    if      (Options[23] == 1) App->Options[2] |= 0x80;
    else if (Options[23] == 0) App->Options[2] &= ~0x80;
    if      (Options[24] == 0) App->Options[3] |= 0x01;
    else if (Options[24] == 1) App->Options[3] &= ~0x01;
    if      (Options[25] == 0) App->Options[3] |= 0x02;
    else if (Options[25] == 1) App->Options[3] &= ~0x02;
    if      (Options[26] == 1) App->Options[3] |= 0x04;
    else if (Options[26] == 0) App->Options[3] &= ~0x04;
    if      (Options[27] == 1) App->Options[3] |= 0x08;
    else if (Options[27] == 0) App->Options[3] &= ~0x08;
    if      (Options[28] == 1) App->Options[3] |= 0x10;
    else if (Options[28] == 0) App->Options[3] &= ~0x10;
    if      (Options[29] == 1) App->Options[3] |= 0x20;
    else if (Options[29] == 0) App->Options[3] &= ~0x20;
    if      (Options[30] == 1) App->Options[3] |= 0x40;
    else if (Options[30] == 0) App->Options[3] &= ~0x40;
    if      (Options[31] == 1) App->Options[3] |= 0x80;
    else if (Options[31] == 0) App->Options[3] &= ~0x80;
    if      (Options[32] == 1) App->Options[4] |= 0x01;
    else if (Options[32] == 0) App->Options[4] &= ~0x01;
    if      (Options[33] == 1) App->Options[4] |= 0x02;
    else if (Options[33] == 0) App->Options[4] &= ~0x02;
    if      (Options[34] == 1) App->Options[4] |= 0x04;
    else if (Options[34] == 0) App->Options[4] &= ~0x04;
    if      (Options[35] == 1) App->Options[4] |= 0x08;
    else if (Options[35] == 0) App->Options[4] &= ~0x08;
    if      (Options[36] == 1) App->Options[4] |= 0x10;
    else if (Options[36] == 0) App->Options[4] &= ~0x10;
    if      (Options[37] == 1) App->Options[4] |= 0x20;
    else if (Options[37] == 0) App->Options[4] &= ~0x20;
    if      (Options[38] == 1) App->Options[4] |= 0x40;
    else if (Options[38] == 0) App->Options[4] &= ~0x40;
    if      (Options[39] == 1) App->Options[4] |= 0x80;
    else if (Options[39] == 0) App->Options[4] &= ~0x80;

    // FCS = *reinterpret_cast<FlowControlService**>(0x7AE260);

    // if      (NoAutoLoop == 0) FCS->AutoLoop |= 1;
    // else if (NoAutoLoop == 1) FCS->AutoLoop &= ~1;

    __asm popad
    __asm jmp Exit
}

void Init()
{
    CIniReader iniReader("");

    AspectRatioFix = iniReader.ReadBoolean("Main", "AspectRatioFix", false);
    SleepFix = iniReader.ReadBoolean("Main", "SleepFix", false);
    FrameInterval = iniReader.ReadInteger("Main", "FrameInterval", 16);

    Fullscreen = iniReader.ReadInteger("Options", "Fullscreen", -1);
    Borderless = iniReader.ReadBoolean("Options", "Borderless", false);
    NoMusic = iniReader.ReadBoolean("Options", "NoMusic", false);
    NoVoices = iniReader.ReadBoolean("Options", "NoVoices", false);
    NoAutoLoop = iniReader.ReadInteger("Options", "NoAutoLoop", -1);

    Options[0] = iniReader.ReadInteger("Options", "Autorun", -1);
    Options[1] = iniReader.ReadInteger("Options", "Telnet", -1);
    Options[2] = iniReader.ReadInteger("Options", "Bundles", -1);
    Options[3] = iniReader.ReadInteger("Options", "SaveBundles", -1);
    Options[4] = iniReader.ReadInteger("Options", "Option04", -1);
    Options[5] = iniReader.ReadInteger("Options", "Option05", -1);
    Options[6] = iniReader.ReadInteger("Options", "EnemyAI", -1);
    Options[7] = iniReader.ReadInteger("Options", "ManualCamera", -1);
    Options[8] = iniReader.ReadInteger("Options", "AlternativeJumping", -1);
    Options[9] = iniReader.ReadInteger("Options", "CliffStop", -1);
    Options[10] = iniReader.ReadInteger("Options", "Overlay", -1);
    Options[11] = iniReader.ReadInteger("Options", "DebugUpdate", -1);
    Options[12] = iniReader.ReadInteger("Options", "NoHUD", -1);
    Options[13] = iniReader.ReadInteger("Options", "Screenshots", -1);
    Options[14] = iniReader.ReadInteger("Options", "Option14", -1);
    Options[15] = iniReader.ReadInteger("Options", "Option15", -1);
    Options[16] = iniReader.ReadInteger("Options", "Option16", -1);
    Options[17] = iniReader.ReadInteger("Options", "Option17", -1);
    Options[18] = iniReader.ReadInteger("Options", "OnscreenKeyboard", -1);
    Options[19] = iniReader.ReadInteger("Options", "DebugInfo", -1);
    Options[20] = iniReader.ReadInteger("Options", "CacheData", -1);
    Options[21] = iniReader.ReadInteger("Options", "AimingRings", -1);
    Options[22] = iniReader.ReadInteger("Options", "BuildPS2Sound", -1);
    Options[23] = iniReader.ReadInteger("Options", "QuitAfterBuild", -1);
    Options[24] = iniReader.ReadInteger("Options", "NoMoviesIntro", -1);
    Options[25] = iniReader.ReadInteger("Options", "NoMovies", -1);
    Options[26] = iniReader.ReadInteger("Options", "Option26", -1);
    Options[27] = iniReader.ReadInteger("Options", "UnlockAllMissions", -1);
    Options[28] = iniReader.ReadInteger("Options", "Buttons", -1);
    Options[29] = iniReader.ReadInteger("Options", "Option29", -1);
    Options[30] = iniReader.ReadInteger("Options", "Zip", -1);
    Options[31] = iniReader.ReadInteger("Options", "ShowNetBandwith", -1);
    Options[32] = iniReader.ReadInteger("Options", "Option32", -1);
    Options[33] = iniReader.ReadInteger("Options", "Leet", -1);
    Options[34] = iniReader.ReadInteger("Options", "Xray", -1);
    Options[35] = iniReader.ReadInteger("Options", "ExportAsciiSchemes", -1);
    Options[36] = iniReader.ReadInteger("Options", "InvertMouseFP", -1);
    Options[37] = iniReader.ReadInteger("Options", "InvertMouseTP", -1);
    Options[38] = iniReader.ReadInteger("Options", "SaveDataFiles", -1);
    Options[39] = iniReader.ReadInteger("Options", "Option39", -1);

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

    if (NoVoices)
    {
        injector::MakeJMP(0x4FBCFC, 0x4FBE16);
        injector::MakeJMP(0x4FDEF9, 0x4FDFC5);
    }

    injector::MakeJMP(0x44D952, OptionsCodeCave);

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
