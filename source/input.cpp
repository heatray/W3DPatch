#include "stdafx.h"
#include "dik.h"

bool InGame_BlimpCamMouseModeSwitch;
int InGame_Fuse;
int WormAiming_AimUp, \
    WormAiming_AimDown, \
    WormAiming_TurnLeft, \
    WormAiming_TurnRight, \
    WormAiming_RotateUp, \
    WormAiming_RotateDown, \
    WormAiming_RotateLeft, \
    WormAiming_RotateRight;
int WormFPAiming_AimUp, \
    WormFPAiming_AimDown, \
    WormFPAiming_TurnLeft, \
    WormFPAiming_TurnRight;
int WormMoving_Jump;
int WormRoping_Shorten, \
    WormRoping_Lengthen, \
    WormRoping_SwingBackward, \
    WormRoping_SwingForward, \
    WormRoping_SwingLeft, \
    WormRoping_SwingRight;
int UtilityGirder_Place, \
    UtilityGirder_Cancel, \
    UtilityGirder_ChangeType, \
    UtilityGirder_Move_Forward, \
    UtilityGirder_Move_Backward, \
    UtilityGirder_Move_Left, \
    UtilityGirder_Move_Right, \
    UtilityGirder_Rotate_Forward, \
    UtilityGirder_Rotate_Backward, \
    UtilityGirder_Rotate_Left, \
    UtilityGirder_Rotate_Right;
int Flying_Pitch_Up, \
    Flying_Pitch_Down, \
    Flying_Roll_Left, \
    Flying_Roll_Right, \
    Flying_Yaw_Left, \
    Flying_Yaw_Right;
int Fire_Fire;
int UtilityFire_FireUtil, \
    UtilityFire_Fire;

void ReadSettings()
{
    CIniReader iniReader("");

    InGame_BlimpCamMouseModeSwitch = iniReader.ReadInteger("InGame", "BlimpCamMouseModeSwitch", 0) == 1;
    InGame_Fuse = iniReader.ReadInteger("InGame", "Input.Fuse", DIK_F);

    WormAiming_AimUp       = iniReader.ReadInteger("WormAiming", "Input.AimUp",        DIK_UP);
    WormAiming_AimDown     = iniReader.ReadInteger("WormAiming", "Input.AimDown",      DIK_DOWN);
    WormAiming_TurnLeft    = iniReader.ReadInteger("WormAiming", "Input.TurnLeft",     DIK_LEFT);
    WormAiming_TurnRight   = iniReader.ReadInteger("WormAiming", "Input.TurnRight",    DIK_RIGHT);
    WormAiming_RotateUp    = iniReader.ReadInteger("WormAiming", "Camera.RotateUp",    DIK_O);
    WormAiming_RotateDown  = iniReader.ReadInteger("WormAiming", "Camera.RotateDown",  DIK_I);
    WormAiming_RotateLeft  = iniReader.ReadInteger("WormAiming", "Camera.RotateLeft",  DIK_LBRACKET);
    WormAiming_RotateRight = iniReader.ReadInteger("WormAiming", "Camera.RotateRight", DIK_RBRACKET);

    WormFPAiming_AimUp     = iniReader.ReadInteger("WormFirstPersonAiming", "Input.AimUp",     DIK_UP);
    WormFPAiming_AimDown   = iniReader.ReadInteger("WormFirstPersonAiming", "Input.AimDown",   DIK_DOWN);
    WormFPAiming_TurnLeft  = iniReader.ReadInteger("WormFirstPersonAiming", "Input.TurnLeft",  DIK_LEFT);
    WormFPAiming_TurnRight = iniReader.ReadInteger("WormFirstPersonAiming", "Input.TurnRight", DIK_RIGHT);

    WormMoving_Jump = iniReader.ReadInteger("WormMoving", "Input.Jump", DIK_RETURN);

    WormRoping_Shorten       = iniReader.ReadInteger("WormRoping", "NinjaRope.Shorten",       DIK_UP);
    WormRoping_Lengthen      = iniReader.ReadInteger("WormRoping", "NinjaRope.Lengthen",      DIK_DOWN);
    WormRoping_SwingBackward = iniReader.ReadInteger("WormRoping", "NinjaRope.SwingBackward", DIK_LEFT);
    WormRoping_SwingForward  = iniReader.ReadInteger("WormRoping", "NinjaRope.SwingForward",  DIK_RIGHT);
    WormRoping_SwingLeft     = iniReader.ReadInteger("WormRoping", "NinjaRope.SwingLeft",     DIK_A);
    WormRoping_SwingRight    = iniReader.ReadInteger("WormRoping", "NinjaRope.SwingRight",    DIK_D);

    UtilityGirder_Place           = iniReader.ReadInteger("UtilityGirder", "Girder.Place",           DIK_SPACE);
    UtilityGirder_Cancel          = iniReader.ReadInteger("UtilityGirder", "Girder.Cancel",          DIK_BACK);
    UtilityGirder_ChangeType      = iniReader.ReadInteger("UtilityGirder", "Girder.ChangeType",      DIK_RETURN);
    UtilityGirder_Rotate_Forward  = iniReader.ReadInteger("UtilityGirder", "Girder.Rotate.Forward",  DIK_W);
    UtilityGirder_Rotate_Backward = iniReader.ReadInteger("UtilityGirder", "Girder.Rotate.Backward", DIK_S);
    UtilityGirder_Rotate_Left     = iniReader.ReadInteger("UtilityGirder", "Girder.Rotate.Left",     DIK_A);
    UtilityGirder_Rotate_Right    = iniReader.ReadInteger("UtilityGirder", "Girder.Rotate.Right",    DIK_D);
    UtilityGirder_Move_Forward    = iniReader.ReadInteger("UtilityGirder", "Girder.Move.Forward",    DIK_UP);
    UtilityGirder_Move_Backward   = iniReader.ReadInteger("UtilityGirder", "Girder.Move.Backward",   DIK_DOWN);
    UtilityGirder_Move_Left       = iniReader.ReadInteger("UtilityGirder", "Girder.Move.Left",       DIK_LEFT);
    UtilityGirder_Move_Right      = iniReader.ReadInteger("UtilityGirder", "Girder.Move.Right",      DIK_RIGHT);

    Flying_Pitch_Up   = iniReader.ReadInteger("Flying", "Fly.Pitch.Up",   DIK_UP);
    Flying_Pitch_Down = iniReader.ReadInteger("Flying", "Fly.Pitch.Down", DIK_DOWN);
    Flying_Roll_Left  = iniReader.ReadInteger("Flying", "Fly.Roll.Left",  DIK_LEFT);
    Flying_Roll_Right = iniReader.ReadInteger("Flying", "Fly.Roll.Right", DIK_RIGHT);
    Flying_Yaw_Left   = iniReader.ReadInteger("Flying", "Fly.Yaw.Left",   DIK_A);
    Flying_Yaw_Right  = iniReader.ReadInteger("Flying", "Fly.Yaw.Right",  DIK_D);

    Fire_Fire = iniReader.ReadInteger("Fire", "Input.Fire", DIK_SPACE);

    UtilityFire_FireUtil = iniReader.ReadInteger("UtilityFire", "Input.FireUtil", DIK_SPACE);
    UtilityFire_Fire     = iniReader.ReadInteger("UtilityFire", "Input.Fire",     DIK_BACK);
}

void Init()
{
    ReadSettings();

    // WormAiming
    injector::WriteMemory(0x456C96, WormAiming_AimUp, true);
    injector::WriteMemory(0x456CF8, WormAiming_AimUp, true);
    injector::WriteMemory(0x456D48, WormAiming_AimDown, true);
    injector::WriteMemory(0x456D99, WormAiming_AimDown, true);
    injector::WriteMemory(0x456DE9, WormAiming_TurnLeft, true);
    injector::WriteMemory(0x456E3A, WormAiming_TurnLeft, true);
    injector::WriteMemory(0x456E7A, WormAiming_TurnRight, true);

    // WormFirstPersonAiming
    injector::WriteMemory(0x4571E6, WormFPAiming_AimUp, true);
    injector::WriteMemory(0x457248, WormFPAiming_AimUp, true);
    injector::WriteMemory(0x457298, WormFPAiming_AimDown, true);
    injector::WriteMemory(0x4572E9, WormFPAiming_AimDown, true);
    injector::WriteMemory(0x457339, WormFPAiming_TurnLeft, true);
    injector::WriteMemory(0x45738A, WormFPAiming_TurnLeft, true);
    injector::WriteMemory(0x4573DA, WormFPAiming_TurnRight, true);
    injector::WriteMemory(0x45742B, WormFPAiming_TurnRight, true);

    // DefaultInGame
    if (InGame_BlimpCamMouseModeSwitch)
    {
        injector::WriteMemory<BYTE>(0x53E256, 0x74, true);
        injector::WriteMemory<BYTE>(0x53E2A6, 0x74, true);
        injector::WriteMemory<BYTE>(0x53E445, 0x75, true);
        injector::WriteMemory<BYTE>(0x53E54A, 0x75, true);
    }
    // injector::WriteMemory(0x458B22, InGame_RotateLeft, true);
    // injector::WriteMemory(0x458BC2, InGame_RotateRight, true);
    // injector::WriteMemory(0x458C62, InGame_RotateDown, true);
    // injector::WriteMemory(0x458D16, InGame_RotateUp, true);
    // injector::WriteMemory(0x458D67, InGame_RotateUp, true);
    injector::WriteMemory(0x458E49, InGame_Fuse, true);

    // Fire
    injector::WriteMemory(0x459C77, Fire_Fire, true);
    injector::WriteMemory(0x459CD8, Fire_Fire, true);

    // WormMoving
    injector::WriteMemory(0x459E86, WormMoving_Jump, true);
    injector::WriteMemory(0x459EE8, WormMoving_Jump, true);

    // WormRoping
    injector::WriteMemory(0x45A3E7, WormRoping_Shorten, true);
    injector::WriteMemory(0x45A448, WormRoping_Shorten, true);
    injector::WriteMemory(0x45A488, WormRoping_Lengthen, true);
    injector::WriteMemory(0x45A53C, WormRoping_SwingForward, true);
    injector::WriteMemory(0x45A58D, WormRoping_SwingForward, true);
    injector::WriteMemory(0x45A5DD, WormRoping_SwingBackward, true);
    injector::WriteMemory(0x45A62E, WormRoping_SwingBackward, true);
    injector::WriteMemory(0x45A67E, WormRoping_SwingLeft, true);
    injector::WriteMemory(0x45A6CF, WormRoping_SwingLeft, true);
    injector::WriteMemory(0x45A70F, WormRoping_SwingRight, true);

    // UtilityGirder
    injector::WriteMemory(0x45B35F, UtilityGirder_Place, true);
    injector::WriteMemory(0x45B3B0, UtilityGirder_Cancel, true);
    injector::WriteMemory(0x45B3F2, UtilityGirder_ChangeType, true);
    injector::WriteMemory(0x45B5D8, UtilityGirder_Rotate_Forward, true);
    injector::WriteMemory(0x45B678, UtilityGirder_Rotate_Backward, true);
    injector::WriteMemory(0x45B718, UtilityGirder_Rotate_Left, true);
    injector::WriteMemory(0x45B7B8, UtilityGirder_Rotate_Right, true);
    injector::WriteMemory(0x45B86C, UtilityGirder_Move_Forward, true);
    injector::WriteMemory(0x45B8BD, UtilityGirder_Move_Forward, true);
    injector::WriteMemory(0x45B8FE, UtilityGirder_Move_Backward, true);
    injector::WriteMemory(0x45B99E, UtilityGirder_Move_Left, true);
    injector::WriteMemory(0x45BA3E, UtilityGirder_Move_Right, true);

    // Flying
    injector::WriteMemory(0x45C5A6, Flying_Pitch_Up, true);
    injector::WriteMemory(0x45C608, Flying_Pitch_Up, true);
    injector::WriteMemory(0x45C658, Flying_Pitch_Down, true);
    injector::WriteMemory(0x45C6A9, Flying_Pitch_Down, true);
    injector::WriteMemory(0x45C6F9, Flying_Roll_Left, true);
    injector::WriteMemory(0x45C74A, Flying_Roll_Left, true);
    injector::WriteMemory(0x45C79A, Flying_Roll_Right, true);
    injector::WriteMemory(0x45C7EB, Flying_Roll_Right, true);
    injector::WriteMemory(0x45C82C, Flying_Yaw_Left, true);
    injector::WriteMemory(0x45C8CC, Flying_Yaw_Right, true);

    // UtilityFire
    injector::WriteMemory(0x45D337, UtilityFire_FireUtil, true);
    injector::WriteMemory(0x45D398, UtilityFire_FireUtil, true);
    injector::WriteMemory(0x45D537, UtilityFire_Fire, true);
    injector::WriteMemory(0x45D588, UtilityFire_Fire, true);
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
