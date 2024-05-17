#include "stdafx.h"

std::string XOM_EventLog_Enable, \
    XOM_EventLog_BufferSize, \
    XOM_EventLog_UseHighMemory;
std::string OtherStuffArena_ArenaSize, \
    ObjectRegArena_ArenaSize, \
    InputArena_ArenaSize, \
    ParticleEmmiter_ArenaSize, \
    ParticleObjects_ArenaSize, \
    MessageRelayArena_ArenaSize, \
    LandArena_ArenaSize, \
    AiArena_ArenaSize, \
    CameraArena_ArenaSize, \
    ScriptArena_ArenaSize, \
    XString_ArenaSize, \
    XDxFieldManager_Data_ArenaSize, \
    XDxFieldManager_Descriptor_ArenaSize, \
    MField_ArenaSize, \
    XContainer_ArenaSize, \
    AnimArena_ArenaSize, \
    XLua_ArenaSize, \
    Xml_InstanceTags_ArenaSize;
std::string OtherStuffArena_Debug, \
    ObjectRegArena_Debug, \
    InputArena_Debug, \
    ParticleEmmiter_Debug, \
    ParticleObjects_Debug, \
    MessageRelayArena_Debug, \
    LandArena_Debug, \
    AiArena_Debug, \
    CameraArena_Debug, \
    ScriptArena_Debug, \
    XString_Debug, \
    XDxFieldManager_Data_Debug, \
    XDxFieldManager_Descriptor_Debug, \
    MField_Debug, \
    XContainer_Debug, \
    AnimArena_Debug, \
    XLua_Debug, \
    Xml_InstanceTags_Debug;
std::string OtherStuffArena_PassThrough, \
    ObjectRegArena_PassThrough, \
    InputArena_PassThrough, \
    ParticleEmmiter_PassThrough, \
    ParticleObjects_PassThrough, \
    MessageRelayArena_PassThrough, \
    LandArena_PassThrough, \
    AiArena_PassThrough, \
    CameraArena_PassThrough, \
    ScriptArena_PassThrough, \
    XString_PassThrough, \
    XDxFieldManager_Data_PassThrough, \
    XDxFieldManager_Descriptor_PassThrough, \
    MField_PassThrough, \
    XContainer_PassThrough, \
    AnimArena_PassThrough, \
    XLua_PassThrough, \
    Xml_InstanceTags_PassThrough, \
    XOM_Arena_PassThrough;
std::string XOM_LogFile, \
    XXml_TaggingEnabled;
std::string DRM_MaxInstances, \
    DRM_MaxHooks;
std::string MRS_MaxMessages, \
    MRS_MaxInterests;
std::string GRM_MaxBitmaps, \
    GRM_MaxMeshes, \
    GRM_MaxCustom, \
    GRM_MaxSpriteSets, \
    GRM_MaxParticleSets, \
    GRM_MaxText, \
    GRM_MaxNulls;
std::string Core_MessageBufferSize, \
    Core_MaxTasks, \
    Core_MaxLogicTasks, \
    Core_MaxServiceTasks;
std::string XOM_EventLog_Pipe_MaxSendInterval, \
    XOM_EventLog_Pipe_MaxPacketSize, \
    XOM_EventLog_Pipe_BufferSize, \
    XOM_Arena_LogEvents, \
    FrontendArena_ArenaSize, \
    FrontendArena_Debug, \
    FrontendArena_PassThrough, \
    XOM_XomClass_InstanceIdTag, \
    XOM_XomClass_StacktraceTag, \
    XOM_ExportClasses;

struct ConfigEntry {
    char* Key;
    char* Value;
};
ConfigEntry l_Config[86];
uint8_t i_Config = 0;

void PushConfig(const char* key, std::string strvalue)
{
    if (strvalue == "none") { return; }
    char* value = new char[strvalue.length() + 1];
    strcpy_s(value, strvalue.length() + 1, strvalue.c_str());
    l_Config[i_Config].Key = (char*)key;
    l_Config[i_Config].Value = (char*)value;
    ++i_Config;
};

void ReadSettings()
{
    CIniReader iniReader("");

    // XEventLogContext
    XOM_EventLog_Enable               = iniReader.ReadString("XEventLogContext", "XOM.EventLog.Enable",               "0");
    XOM_EventLog_BufferSize           = iniReader.ReadString("XEventLogContext", "XOM.EventLog.BufferSize",           "64000000");
    XOM_EventLog_UseHighMemory        = iniReader.ReadString("XEventLogContext", "XOM.EventLog.UseHighMemory",        "1");
    XOM_EventLog_Pipe_MaxSendInterval = iniReader.ReadString("XEventLogContext", "XOM.EventLog.Pipe.MaxSendInterval", "none");
    XOM_EventLog_Pipe_MaxPacketSize   = iniReader.ReadString("XEventLogContext", "XOM.EventLog.Pipe.MaxPacketSize",   "none");
    XOM_EventLog_Pipe_BufferSize      = iniReader.ReadString("XEventLogContext", "XOM.EventLog.Pipe.BufferSize",      "none");

    // XMemoryArena
    XOM_Arena_LogEvents   = iniReader.ReadString("XMemoryArena", "XOM.Arena.LogEvents",   "0");
    XOM_Arena_PassThrough = iniReader.ReadString("XMemoryArena", "XOM.Arena.PassThrough", "0");

    // XMemoryArena ArenaSize
    OtherStuffArena_ArenaSize            = iniReader.ReadString("XMemoryArena", "OtherStuffArena.ArenaSize",            "16384");
    ObjectRegArena_ArenaSize             = iniReader.ReadString("XMemoryArena", "ObjectRegArena.ArenaSize",             "8192");
    InputArena_ArenaSize                 = iniReader.ReadString("XMemoryArena", "InputArena.ArenaSize",                 "24576");
    ParticleEmmiter_ArenaSize            = iniReader.ReadString("XMemoryArena", "ParticleEmmiter.ArenaSize",            "12288");
    ParticleObjects_ArenaSize            = iniReader.ReadString("XMemoryArena", "ParticleObjects.ArenaSize",            "524288");
    MessageRelayArena_ArenaSize          = iniReader.ReadString("XMemoryArena", "MessageRelayArena.ArenaSize",          "8192");
    LandArena_ArenaSize                  = iniReader.ReadString("XMemoryArena", "LandArena.ArenaSize",                  "524288");
    AiArena_ArenaSize                    = iniReader.ReadString("XMemoryArena", "AiArena.ArenaSize",                    "270000");
    CameraArena_ArenaSize                = iniReader.ReadString("XMemoryArena", "CameraArena.ArenaSize",                "8192");
    ScriptArena_ArenaSize                = iniReader.ReadString("XMemoryArena", "ScriptArena.ArenaSize",                "131072");
    XString_ArenaSize                    = iniReader.ReadString("XMemoryArena", "XString.ArenaSize",                    "1500000");
    XDxFieldManager_Data_ArenaSize       = iniReader.ReadString("XMemoryArena", "XDxFieldManager.Data.ArenaSize",       "none");
    XDxFieldManager_Descriptor_ArenaSize = iniReader.ReadString("XMemoryArena", "XDxFieldManager.Descriptor.ArenaSize", "none");
    MField_ArenaSize                     = iniReader.ReadString("XMemoryArena", "MField.ArenaSize",                     "32000000");
    XContainer_ArenaSize                 = iniReader.ReadString("XMemoryArena", "XContainer.ArenaSize",                 "4000000");
    AnimArena_ArenaSize                  = iniReader.ReadString("XMemoryArena", "AnimArena.ArenaSize",                  "3000000");
    XLua_ArenaSize                       = iniReader.ReadString("XMemoryArena", "XLua.ArenaSize",                       "196608");
    Xml_InstanceTags_ArenaSize           = iniReader.ReadString("XMemoryArena", "Xml.InstanceTags.ArenaSize",           "none");
    FrontendArena_ArenaSize              = iniReader.ReadString("XMemoryArena", "FrontendArena.ArenaSize",              "8192");

    // XMemoryArena Debug
    OtherStuffArena_Debug            = iniReader.ReadString("XMemoryArena", "OtherStuffArena.Debug",            "0");
    ObjectRegArena_Debug             = iniReader.ReadString("XMemoryArena", "ObjectRegArena.Debug",             "0");
    InputArena_Debug                 = iniReader.ReadString("XMemoryArena", "InputArena.Debug",                 "0");
    ParticleEmmiter_Debug            = iniReader.ReadString("XMemoryArena", "ParticleEmmiter.Debug",            "none");
    ParticleObjects_Debug            = iniReader.ReadString("XMemoryArena", "ParticleObjects.Debug",            "none");
    MessageRelayArena_Debug          = iniReader.ReadString("XMemoryArena", "MessageRelayArena.Debug",          "0");
    LandArena_Debug                  = iniReader.ReadString("XMemoryArena", "LandArena.Debug",                  "0");
    AiArena_Debug                    = iniReader.ReadString("XMemoryArena", "AiArena.Debug",                    "0");
    CameraArena_Debug                = iniReader.ReadString("XMemoryArena", "CameraArena.Debug",                "0");
    ScriptArena_Debug                = iniReader.ReadString("XMemoryArena", "ScriptArena.Debug",                "0");
    XString_Debug                    = iniReader.ReadString("XMemoryArena", "XString.Debug",                    "0");
    XDxFieldManager_Data_Debug       = iniReader.ReadString("XMemoryArena", "XDxFieldManager.Data.Debug",       "none");
    XDxFieldManager_Descriptor_Debug = iniReader.ReadString("XMemoryArena", "XDxFieldManager.Descriptor.Debug", "none");
    MField_Debug                     = iniReader.ReadString("XMemoryArena", "MField.Debug",                     "0");
    XContainer_Debug                 = iniReader.ReadString("XMemoryArena", "XContainer.Debug",                 "0");
    AnimArena_Debug                  = iniReader.ReadString("XMemoryArena", "AnimArena.Debug",                  "0");
    XLua_Debug                       = iniReader.ReadString("XMemoryArena", "XLua.Debug",                       "0");
    Xml_InstanceTags_Debug           = iniReader.ReadString("XMemoryArena", "Xml.InstanceTags.Debug",           "none");
    FrontendArena_Debug              = iniReader.ReadString("XMemoryArena", "FrontendArena.Debug",              "0");

    // XMemoryArena PassThrough
    OtherStuffArena_PassThrough            = iniReader.ReadString("XMemoryArena", "OtherStuffArena.PassThrough",            "none");
    ObjectRegArena_PassThrough             = iniReader.ReadString("XMemoryArena", "ObjectRegArena.PassThrough",             "none");
    InputArena_PassThrough                 = iniReader.ReadString("XMemoryArena", "InputArena.PassThrough",                 "none");
    ParticleEmmiter_PassThrough            = iniReader.ReadString("XMemoryArena", "ParticleEmmiter.PassThrough",            "none");
    ParticleObjects_PassThrough            = iniReader.ReadString("XMemoryArena", "ParticleObjects.PassThrough",            "none");
    MessageRelayArena_PassThrough          = iniReader.ReadString("XMemoryArena", "MessageRelayArena.PassThrough",          "none");
    LandArena_PassThrough                  = iniReader.ReadString("XMemoryArena", "LandArena.PassThrough",                  "none");
    AiArena_PassThrough                    = iniReader.ReadString("XMemoryArena", "AiArena.PassThrough",                    "none");
    CameraArena_PassThrough                = iniReader.ReadString("XMemoryArena", "CameraArena.PassThrough",                "none");
    ScriptArena_PassThrough                = iniReader.ReadString("XMemoryArena", "ScriptArena.PassThrough",                "none");
    XString_PassThrough                    = iniReader.ReadString("XMemoryArena", "XString.PassThrough",                    "none");
    XDxFieldManager_Data_PassThrough       = iniReader.ReadString("XMemoryArena", "XDxFieldManager.Data.PassThrough",       "none");
    XDxFieldManager_Descriptor_PassThrough = iniReader.ReadString("XMemoryArena", "XDxFieldManager.Descriptor.PassThrough", "none");
    MField_PassThrough                     = iniReader.ReadString("XMemoryArena", "MField.PassThrough",                     "none");
    XContainer_PassThrough                 = iniReader.ReadString("XMemoryArena", "XContainer.PassThrough",                 "none");
    AnimArena_PassThrough                  = iniReader.ReadString("XMemoryArena", "AnimArena.PassThrough",                  "none");
    XLua_PassThrough                       = iniReader.ReadString("XMemoryArena", "XLua.PassThrough",                       "none");
    Xml_InstanceTags_PassThrough           = iniReader.ReadString("XMemoryArena", "Xml.InstanceTags.PassThrough",           "none");
    FrontendArena_PassThrough              = iniReader.ReadString("XMemoryArena", "FrontendArena.PassThrough",              "none");

    // Other
    XOM_LogFile                = iniReader.ReadString("Other", "XOM.LogFile",                "0");
    XXml_TaggingEnabled        = iniReader.ReadString("Other", "XXml.TaggingEnabled",        "none");
    XOM_XomClass_InstanceIdTag = iniReader.ReadString("Other", "XOM.XomClass.InstanceIdTag", "0");
    XOM_XomClass_StacktraceTag = iniReader.ReadString("Other", "XOM.XomClass.StacktraceTag", "0");
    XOM_ExportClasses          = iniReader.ReadString("Other", "XOM.ExportClasses",          "0");

    // XDataResourceManager
    DRM_MaxInstances = iniReader.ReadString("XDataResourceManager", "DRM.MaxInstances", "4330");
    DRM_MaxHooks     = iniReader.ReadString("XDataResourceManager", "DRM.MaxHooks",     "512");

    // MessageRegistrationService
    MRS_MaxMessages  = iniReader.ReadString("MessageRegistrationService", "MRS.MaxMessages",  "901");
    MRS_MaxInterests = iniReader.ReadString("MessageRegistrationService", "MRS.MaxInterests", "4096");

    // XGraphicalResourceManager
    GRM_MaxBitmaps      = iniReader.ReadString("XGraphicalResourceManager", "GRM.MaxBitmaps",      "700");
    GRM_MaxMeshes       = iniReader.ReadString("XGraphicalResourceManager", "GRM.MaxMeshes",       "500");
    GRM_MaxCustom       = iniReader.ReadString("XGraphicalResourceManager", "GRM.MaxCustom",       "100");
    GRM_MaxSpriteSets   = iniReader.ReadString("XGraphicalResourceManager", "GRM.MaxSpriteSets",   "200");
    GRM_MaxParticleSets = iniReader.ReadString("XGraphicalResourceManager", "GRM.MaxParticleSets", "none");
    GRM_MaxText         = iniReader.ReadString("XGraphicalResourceManager", "GRM.MaxText",         "150");
    GRM_MaxNulls        = iniReader.ReadString("XGraphicalResourceManager", "GRM.MaxNulls",        "200");

    // TaskManager
    Core_MessageBufferSize = iniReader.ReadString("TaskManager", "Core.MessageBufferSize", "32768");
    Core_MaxTasks          = iniReader.ReadString("TaskManager", "Core.MaxTasks",          "512");
    Core_MaxLogicTasks     = iniReader.ReadString("TaskManager", "Core.MaxLogicTasks",     "128");
    Core_MaxServiceTasks   = iniReader.ReadString("TaskManager", "Core.MaxServiceTasks",   "64");
};

void Init()
{
    ReadSettings();

    // XEventLogContext
    PushConfig("XOM.EventLog.Enable", XOM_EventLog_Enable);
    PushConfig("XOM.EventLog.BufferSize", XOM_EventLog_BufferSize);
    PushConfig("XOM.EventLog.UseHighMemory", XOM_EventLog_UseHighMemory);
    PushConfig("XOM.EventLog.Pipe.MaxSendInterval", XOM_EventLog_Pipe_MaxSendInterval); // not used
    PushConfig("XOM.EventLog.Pipe.MaxPacketSize", XOM_EventLog_Pipe_MaxPacketSize); // not used
    PushConfig("XOM.EventLog.Pipe.BufferSize", XOM_EventLog_Pipe_BufferSize); // not used

    // XMemoryArena
    PushConfig("XOM.Arena.LogEvents", XOM_Arena_LogEvents); // not used
    PushConfig("XOM.Arena.PassThrough", XOM_Arena_PassThrough);

    // XMemoryArena ArenaSize
    PushConfig("OtherStuffArena.ArenaSize", OtherStuffArena_ArenaSize);
    PushConfig("ObjectRegArena.ArenaSize", ObjectRegArena_ArenaSize);
    PushConfig("InputArena.ArenaSize", InputArena_ArenaSize);
    PushConfig("ParticleEmmiter.ArenaSize", ParticleEmmiter_ArenaSize);
    PushConfig("ParticleObjects.ArenaSize", ParticleObjects_ArenaSize);
    PushConfig("MessageRelayArena.ArenaSize", MessageRelayArena_ArenaSize);
    PushConfig("LandArena.ArenaSize", LandArena_ArenaSize);
    PushConfig("AiArena.ArenaSize", AiArena_ArenaSize);
    PushConfig("CameraArena.ArenaSize", CameraArena_ArenaSize);
    PushConfig("ScriptArena.ArenaSize", ScriptArena_ArenaSize);
    PushConfig("XString.ArenaSize", XString_ArenaSize);
    PushConfig("XDxFieldManager.Data.ArenaSize", XDxFieldManager_Data_ArenaSize);
    PushConfig("XDxFieldManager.Descriptor.ArenaSize", XDxFieldManager_Descriptor_ArenaSize);
    PushConfig("MField.ArenaSize", MField_ArenaSize);
    PushConfig("XContainer.ArenaSize", XContainer_ArenaSize);
    PushConfig("AnimArena.ArenaSize", AnimArena_ArenaSize);
    PushConfig("XLua.ArenaSize", XLua_ArenaSize);
    PushConfig("Xml.InstanceTags.ArenaSize", Xml_InstanceTags_ArenaSize);
    PushConfig("FrontendArena.ArenaSize", FrontendArena_ArenaSize); // not used

    // XMemoryArena Debug
    PushConfig("OtherStuffArena.Debug", OtherStuffArena_Debug);
    PushConfig("ObjectRegArena.Debug", ObjectRegArena_Debug);
    PushConfig("InputArena.Debug", InputArena_Debug);
    PushConfig("ParticleEmmiter.Debug", ParticleEmmiter_Debug);
    PushConfig("ParticleObjects.Debug", ParticleObjects_Debug);
    PushConfig("MessageRelayArena.Debug", MessageRelayArena_Debug);
    PushConfig("LandArena.Debug", LandArena_Debug);
    PushConfig("AiArena.Debug", AiArena_Debug);
    PushConfig("CameraArena.Debug", CameraArena_Debug);
    PushConfig("ScriptArena.Debug", ScriptArena_Debug);
    PushConfig("XString.Debug", XString_Debug);
    PushConfig("XDxFieldManager.Data.Debug", XDxFieldManager_Data_Debug);
    PushConfig("XDxFieldManager.Descriptor.Debug", XDxFieldManager_Descriptor_Debug);
    PushConfig("MField.Debug", MField_Debug);
    PushConfig("XContainer.Debug", XContainer_Debug);
    PushConfig("AnimArena.Debug", AnimArena_Debug);
    PushConfig("XLua.Debug", XLua_Debug);
    PushConfig("Xml.InstanceTags.Debug", Xml_InstanceTags_Debug);
    PushConfig("FrontendArena.Debug", FrontendArena_Debug); // not used

    // XMemoryArena PassThrough
    PushConfig("OtherStuffArena.PassThrough", OtherStuffArena_PassThrough);
    PushConfig("ObjectRegArena.PassThrough", ObjectRegArena_PassThrough);
    PushConfig("InputArena.PassThrough", InputArena_PassThrough);
    PushConfig("ParticleEmmiter.PassThrough", ParticleEmmiter_PassThrough);
    PushConfig("ParticleObjects.PassThrough", ParticleObjects_PassThrough);
    PushConfig("MessageRelayArena.PassThrough", MessageRelayArena_PassThrough);
    PushConfig("LandArena.PassThrough", LandArena_PassThrough);
    PushConfig("AiArena.PassThrough", AiArena_PassThrough);
    PushConfig("CameraArena.PassThrough", CameraArena_PassThrough);
    PushConfig("ScriptArena.PassThrough", ScriptArena_PassThrough);
    PushConfig("XString.PassThrough", XString_PassThrough);
    PushConfig("XDxFieldManager.Data.PassThrough", XDxFieldManager_Data_PassThrough);
    PushConfig("XDxFieldManager.Descriptor.PassThrough", XDxFieldManager_Descriptor_PassThrough);
    PushConfig("MField.PassThrough", MField_PassThrough);
    PushConfig("XContainer.PassThrough", XContainer_PassThrough);
    PushConfig("AnimArena.PassThrough", AnimArena_PassThrough);
    PushConfig("XLua.PassThrough", XLua_PassThrough);
    PushConfig("Xml.InstanceTags.PassThrough", Xml_InstanceTags_PassThrough);
    PushConfig("FrontendArena.PassThrough", FrontendArena_PassThrough); // not used

    // Other
    PushConfig("XOM.LogFile", XOM_LogFile);
    PushConfig("XXml.TaggingEnabled", XXml_TaggingEnabled);
    PushConfig("XOM.XomClass.InstanceIdTag", XOM_XomClass_InstanceIdTag); // not used
    PushConfig("XOM.XomClass.StacktraceTag", XOM_XomClass_StacktraceTag); // not used
    PushConfig("XOM.ExportClasses", XOM_ExportClasses); // not used
    // PushConfig("PS2.RunFromCdRom", PS2_RunFromCdRom);

    // XDataResourceManager
    PushConfig("DRM.MaxInstances", DRM_MaxInstances);
    PushConfig("DRM.MaxHooks", DRM_MaxHooks);

    // MessageRegistrationService
    PushConfig("MRS.MaxMessages", MRS_MaxMessages);
    PushConfig("MRS.MaxInterests", MRS_MaxInterests);

    // XGraphicalResourceManager
    PushConfig("GRM.MaxBitmaps", GRM_MaxBitmaps);
    PushConfig("GRM.MaxMeshes", GRM_MaxMeshes);
    PushConfig("GRM.MaxCustom", GRM_MaxCustom);
    PushConfig("GRM.MaxSpriteSets", GRM_MaxSpriteSets);
    PushConfig("GRM.MaxParticleSets", GRM_MaxParticleSets);
    PushConfig("GRM.MaxText", GRM_MaxText);
    PushConfig("GRM.MaxNulls", GRM_MaxNulls);

    // TaskManager
    PushConfig("Core.MessageBufferSize", Core_MessageBufferSize);
    PushConfig("Core.MaxTasks", Core_MaxTasks);
    PushConfig("Core.MaxLogicTasks", Core_MaxLogicTasks);
    PushConfig("Core.MaxServiceTasks", Core_MaxServiceTasks);

    // new l_Config
    injector::WriteMemory(0x44E151, &l_Config, true);
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
