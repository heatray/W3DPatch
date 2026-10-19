#include "stdafx.h"
#include "dik.h"
#include <map>
#include <string>
#include <utility>

struct InputDataEntry {
    const char* Section;
    const char* Key;
    int DefaultValue;
};

const InputDataEntry InputData[] = {
    { "InGame", "Input.Fuse", DIK_F },
    { "WormAiming", "Input.AimUp", DIK_UP },
    { "WormAiming", "Input.AimDown", DIK_DOWN },
    { "WormAiming", "Input.TurnLeft", DIK_LEFT },
    { "WormAiming", "Input.TurnRight", DIK_RIGHT },
    { "WormAiming", "Camera.RotateUp", DIK_O },
    { "WormAiming", "Camera.RotateDown", DIK_I },
    { "WormAiming", "Camera.RotateLeft", DIK_LBRACKET },
    { "WormAiming", "Camera.RotateRight", DIK_RBRACKET },
    { "WormFirstPersonAiming", "Input.AimUp", DIK_UP },
    { "WormFirstPersonAiming", "Input.AimDown", DIK_DOWN },
    { "WormFirstPersonAiming", "Input.TurnLeft", DIK_LEFT },
    { "WormFirstPersonAiming", "Input.TurnRight", DIK_RIGHT },
    { "WormMoving", "Input.Jump", DIK_RETURN },
    { "WormRoping", "NinjaRope.Shorten", DIK_UP },
    { "WormRoping", "NinjaRope.Lengthen", DIK_DOWN },
    { "WormRoping", "NinjaRope.SwingBackward", DIK_LEFT },
    { "WormRoping", "NinjaRope.SwingForward", DIK_RIGHT },
    { "WormRoping", "NinjaRope.SwingLeft", DIK_A },
    { "WormRoping", "NinjaRope.SwingRight", DIK_D },
    { "UtilityGirder", "Girder.Place", DIK_SPACE },
    { "UtilityGirder", "Girder.Cancel", DIK_BACK },
    { "UtilityGirder", "Girder.ChangeType", DIK_RETURN },
    { "UtilityGirder", "Girder.Rotate.Forward", DIK_W },
    { "UtilityGirder", "Girder.Rotate.Backward", DIK_S },
    { "UtilityGirder", "Girder.Rotate.Left", DIK_A },
    { "UtilityGirder", "Girder.Rotate.Right", DIK_D },
    { "UtilityGirder", "Girder.Move.Forward", DIK_UP },
    { "UtilityGirder", "Girder.Move.Backward", DIK_DOWN },
    { "UtilityGirder", "Girder.Move.Left", DIK_LEFT },
    { "UtilityGirder", "Girder.Move.Right", DIK_RIGHT },
    { "Flying", "Fly.Pitch.Up", DIK_UP },
    { "Flying", "Fly.Pitch.Down", DIK_DOWN },
    { "Flying", "Fly.Roll.Left", DIK_LEFT },
    { "Flying", "Fly.Roll.Right", DIK_RIGHT },
    { "Flying", "Fly.Yaw.Left", DIK_A },
    { "Flying", "Fly.Yaw.Right", DIK_D },
    { "Fire", "Input.Fire", DIK_SPACE },
    { "UtilityFire", "Input.FireUtil", DIK_SPACE },
    { "UtilityFire", "Input.Fire", DIK_BACK },
};

bool BlimpCamMouseModeSwitch;

std::map<std::pair<std::string, std::string>, int> InputMap;

int InputKey(const char* section, const char* key)
{
    return InputMap.at({ section, key });
}

void Init()
{
    CIniReader iniReader("");

    for (const InputDataEntry& e : InputData)
        InputMap[{ e.Section, e.Key }] = iniReader.ReadInteger(e.Section, e.Key, e.DefaultValue);

    BlimpCamMouseModeSwitch = iniReader.ReadBoolean("InGame", "BlimpCamMouseModeSwitch", false);

    using namespace injector;

    // WormAiming
    WriteMemory(0x456C96, InputKey("WormAiming", "Input.AimUp"), true);
    WriteMemory(0x456CF8, InputKey("WormAiming", "Input.AimUp"), true);
    WriteMemory(0x456D48, InputKey("WormAiming", "Input.AimDown"), true);
    WriteMemory(0x456D99, InputKey("WormAiming", "Input.AimDown"), true);
    WriteMemory(0x456DE9, InputKey("WormAiming", "Input.TurnLeft"), true);
    WriteMemory(0x456E3A, InputKey("WormAiming", "Input.TurnLeft"), true);
    WriteMemory(0x456E7A, InputKey("WormAiming", "Input.TurnRight"), true);

    // WormFirstPersonAiming
    WriteMemory(0x4571E6, InputKey("WormFirstPersonAiming", "Input.AimUp"), true);
    WriteMemory(0x457248, InputKey("WormFirstPersonAiming", "Input.AimUp"), true);
    WriteMemory(0x457298, InputKey("WormFirstPersonAiming", "Input.AimDown"), true);
    WriteMemory(0x4572E9, InputKey("WormFirstPersonAiming", "Input.AimDown"), true);
    WriteMemory(0x457339, InputKey("WormFirstPersonAiming", "Input.TurnLeft"), true);
    WriteMemory(0x45738A, InputKey("WormFirstPersonAiming", "Input.TurnLeft"), true);
    WriteMemory(0x4573DA, InputKey("WormFirstPersonAiming", "Input.TurnRight"), true);
    WriteMemory(0x45742B, InputKey("WormFirstPersonAiming", "Input.TurnRight"), true);

    // DefaultInGame
    if (BlimpCamMouseModeSwitch)
    {
        WriteMemory<BYTE>(0x53E256, 0x74, true);
        WriteMemory<BYTE>(0x53E2A6, 0x74, true);
        WriteMemory<BYTE>(0x53E445, 0x75, true);
        WriteMemory<BYTE>(0x53E54A, 0x75, true);
    }
    // WriteMemory(0x458B22, InputKey("InGame", "Camera.RotateLeft"), true);
    // WriteMemory(0x458BC2, InputKey("InGame", "Camera.RotateRight"), true);
    // WriteMemory(0x458C62, InputKey("InGame", "Camera.RotateDown"), true);
    // WriteMemory(0x458D16, InputKey("InGame", "Camera.RotateUp"), true);
    // WriteMemory(0x458D67, InputKey("InGame", "Camera.RotateUp"), true);
    WriteMemory(0x458E49, InputKey("InGame", "Input.Fuse"), true);

    // Fire
    WriteMemory(0x459C77, InputKey("Fire", "Input.Fire"), true);
    WriteMemory(0x459CD8, InputKey("Fire", "Input.Fire"), true);

    // WormMoving
    WriteMemory(0x459E86, InputKey("WormMoving", "Input.Jump"), true);
    WriteMemory(0x459EE8, InputKey("WormMoving", "Input.Jump"), true);

    // WormRoping
    WriteMemory(0x45A3E7, InputKey("WormRoping", "NinjaRope.Shorten"), true);
    WriteMemory(0x45A448, InputKey("WormRoping", "NinjaRope.Shorten"), true);
    WriteMemory(0x45A488, InputKey("WormRoping", "NinjaRope.Lengthen"), true);
    WriteMemory(0x45A53C, InputKey("WormRoping", "NinjaRope.SwingForward"), true);
    WriteMemory(0x45A58D, InputKey("WormRoping", "NinjaRope.SwingForward"), true);
    WriteMemory(0x45A5DD, InputKey("WormRoping", "NinjaRope.SwingBackward"), true);
    WriteMemory(0x45A62E, InputKey("WormRoping", "NinjaRope.SwingBackward"), true);
    WriteMemory(0x45A67E, InputKey("WormRoping", "NinjaRope.SwingLeft"), true);
    WriteMemory(0x45A6CF, InputKey("WormRoping", "NinjaRope.SwingLeft"), true);
    WriteMemory(0x45A70F, InputKey("WormRoping", "NinjaRope.SwingRight"), true);

    // UtilityGirder
    WriteMemory(0x45B35F, InputKey("UtilityGirder", "Girder.Place"), true);
    WriteMemory(0x45B3B0, InputKey("UtilityGirder", "Girder.Cancel"), true);
    WriteMemory(0x45B3F2, InputKey("UtilityGirder", "Girder.ChangeType"), true);
    WriteMemory(0x45B5D8, InputKey("UtilityGirder", "Girder.Rotate.Forward"), true);
    WriteMemory(0x45B678, InputKey("UtilityGirder", "Girder.Rotate.Backward"), true);
    WriteMemory(0x45B718, InputKey("UtilityGirder", "Girder.Rotate.Left"), true);
    WriteMemory(0x45B7B8, InputKey("UtilityGirder", "Girder.Rotate.Right"), true);
    WriteMemory(0x45B86C, InputKey("UtilityGirder", "Girder.Move.Forward"), true);
    WriteMemory(0x45B8BD, InputKey("UtilityGirder", "Girder.Move.Forward"), true);
    WriteMemory(0x45B8FE, InputKey("UtilityGirder", "Girder.Move.Backward"), true);
    WriteMemory(0x45B99E, InputKey("UtilityGirder", "Girder.Move.Left"), true);
    WriteMemory(0x45BA3E, InputKey("UtilityGirder", "Girder.Move.Right"), true);

    // Flying
    WriteMemory(0x45C5A6, InputKey("Flying", "Fly.Pitch.Up"), true);
    WriteMemory(0x45C608, InputKey("Flying", "Fly.Pitch.Up"), true);
    WriteMemory(0x45C658, InputKey("Flying", "Fly.Pitch.Down"), true);
    WriteMemory(0x45C6A9, InputKey("Flying", "Fly.Pitch.Down"), true);
    WriteMemory(0x45C6F9, InputKey("Flying", "Fly.Roll.Left"), true);
    WriteMemory(0x45C74A, InputKey("Flying", "Fly.Roll.Left"), true);
    WriteMemory(0x45C79A, InputKey("Flying", "Fly.Roll.Right"), true);
    WriteMemory(0x45C7EB, InputKey("Flying", "Fly.Roll.Right"), true);
    WriteMemory(0x45C82C, InputKey("Flying", "Fly.Yaw.Left"), true);
    WriteMemory(0x45C8CC, InputKey("Flying", "Fly.Yaw.Right"), true);

    // UtilityFire
    WriteMemory(0x45D337, InputKey("UtilityFire", "Input.FireUtil"), true);
    WriteMemory(0x45D398, InputKey("UtilityFire", "Input.FireUtil"), true);
    WriteMemory(0x45D537, InputKey("UtilityFire", "Input.Fire"), true);
    WriteMemory(0x45D588, InputKey("UtilityFire", "Input.Fire"), true);
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
