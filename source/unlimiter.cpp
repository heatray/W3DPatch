#include "stdafx.h"
#include <string>
#include <vector>

struct ConfigDataEntry {
    const char* Section;
    const char* Key;
    const char* DefaultValue;
};

const ConfigDataEntry ConfigData[] = {
    {"XEventLogContext", "XOM.EventLog.Enable", "0"},
    {"XEventLogContext", "XOM.EventLog.BufferSize", "64000000"},
    {"XEventLogContext", "XOM.EventLog.UseHighMemory", "1"},
    {"XEventLogContext", "XOM.EventLog.Pipe.MaxSendInterval", ""},
    {"XEventLogContext", "XOM.EventLog.Pipe.MaxPacketSize", ""},
    {"XEventLogContext", "XOM.EventLog.Pipe.BufferSize", ""},
    {"XMemoryArena", "XOM.Arena.LogEvents", "0"},
    {"XMemoryArena", "XOM.Arena.PassThrough", "0"},
    {"XMemoryArena", "OtherStuffArena.ArenaSize", "16384"},
    {"XMemoryArena", "ObjectRegArena.ArenaSize", "8192"},
    {"XMemoryArena", "InputArena.ArenaSize", "24576"},
    {"XMemoryArena", "ParticleEmmiter.ArenaSize", "12288"},
    {"XMemoryArena", "ParticleObjects.ArenaSize", "524288"},
    {"XMemoryArena", "MessageRelayArena.ArenaSize", "8192"},
    {"XMemoryArena", "LandArena.ArenaSize", "524288"},
    {"XMemoryArena", "AiArena.ArenaSize", "270000"},
    {"XMemoryArena", "CameraArena.ArenaSize", "8192"},
    {"XMemoryArena", "ScriptArena.ArenaSize", "131072"},
    {"XMemoryArena", "XString.ArenaSize", "1500000"},
    {"XMemoryArena", "XDxFieldManager.Data.ArenaSize", ""},
    {"XMemoryArena", "XDxFieldManager.Descriptor.ArenaSize", ""},
    {"XMemoryArena", "MField.ArenaSize", "32000000"},
    {"XMemoryArena", "XContainer.ArenaSize", "4000000"},
    {"XMemoryArena", "AnimArena.ArenaSize", "3000000"},
    {"XMemoryArena", "XLua.ArenaSize", "196608"},
    {"XMemoryArena", "Xml.InstanceTags.ArenaSize", ""},
    {"XMemoryArena", "FrontendArena.ArenaSize", "8192"},
    {"XMemoryArena", "OtherStuffArena.Debug", "0"},
    {"XMemoryArena", "ObjectRegArena.Debug", "0"},
    {"XMemoryArena", "InputArena.Debug", "0"},
    {"XMemoryArena", "ParticleEmmiter.Debug", ""},
    {"XMemoryArena", "ParticleObjects.Debug", ""},
    {"XMemoryArena", "MessageRelayArena.Debug", "0"},
    {"XMemoryArena", "LandArena.Debug", "0"},
    {"XMemoryArena", "AiArena.Debug", "0"},
    {"XMemoryArena", "CameraArena.Debug", "0"},
    {"XMemoryArena", "ScriptArena.Debug", "0"},
    {"XMemoryArena", "XString.Debug", "0"},
    {"XMemoryArena", "XDxFieldManager.Data.Debug", ""},
    {"XMemoryArena", "XDxFieldManager.Descriptor.Debug", ""},
    {"XMemoryArena", "MField.Debug", "0"},
    {"XMemoryArena", "XContainer.Debug", "0"},
    {"XMemoryArena", "AnimArena.Debug", "0"},
    {"XMemoryArena", "XLua.Debug", "0"},
    {"XMemoryArena", "Xml.InstanceTags.Debug", ""},
    {"XMemoryArena", "FrontendArena.Debug", "0"},
    {"XMemoryArena", "OtherStuffArena.PassThrough", ""},
    {"XMemoryArena", "ObjectRegArena.PassThrough", ""},
    {"XMemoryArena", "InputArena.PassThrough", ""},
    {"XMemoryArena", "ParticleEmmiter.PassThrough", ""},
    {"XMemoryArena", "ParticleObjects.PassThrough", ""},
    {"XMemoryArena", "MessageRelayArena.PassThrough", ""},
    {"XMemoryArena", "LandArena.PassThrough", ""},
    {"XMemoryArena", "AiArena.PassThrough", ""},
    {"XMemoryArena", "CameraArena.PassThrough", ""},
    {"XMemoryArena", "ScriptArena.PassThrough", ""},
    {"XMemoryArena", "XString.PassThrough", ""},
    {"XMemoryArena", "XDxFieldManager.Data.PassThrough", ""},
    {"XMemoryArena", "XDxFieldManager.Descriptor.PassThrough", ""},
    {"XMemoryArena", "MField.PassThrough", ""},
    {"XMemoryArena", "XContainer.PassThrough", ""},
    {"XMemoryArena", "AnimArena.PassThrough", ""},
    {"XMemoryArena", "XLua.PassThrough", ""},
    {"XMemoryArena", "Xml.InstanceTags.PassThrough", ""},
    {"XMemoryArena", "FrontendArena.PassThrough", ""},
    {"Other", "XOM.LogFile", "0"},
    {"Other", "XXml.TaggingEnabled", ""},
    {"Other", "XOM.XomClass.InstanceIdTag", "0"},
    {"Other", "XOM.XomClass.StacktraceTag", "0"},
    {"Other", "XOM.ExportClasses", "0"},
    {"XDataResourceManager", "DRM.MaxInstances", "4330"},
    {"XDataResourceManager", "DRM.MaxHooks", "512"},
    {"MessageRegistrationService", "MRS.MaxMessages", "901"},
    {"MessageRegistrationService", "MRS.MaxInterests", "4096"},
    {"XGraphicalResourceManager", "GRM.MaxBitmaps", "700"},
    {"XGraphicalResourceManager", "GRM.MaxMeshes", "500"},
    {"XGraphicalResourceManager", "GRM.MaxCustom", "100"},
    {"XGraphicalResourceManager", "GRM.MaxSpriteSets", "200"},
    {"XGraphicalResourceManager", "GRM.MaxParticleSets", ""},
    {"XGraphicalResourceManager", "GRM.MaxText", "150"},
    {"XGraphicalResourceManager", "GRM.MaxNulls", "200"},
    {"TaskManager", "Core.MessageBufferSize", "32768"},
    {"TaskManager", "Core.MaxTasks", "512"},
    {"TaskManager", "Core.MaxLogicTasks", "128"},
    {"TaskManager", "Core.MaxServiceTasks", "64"},
};

struct ConfigEntry {
    const char* Key;
    const char* Value;
};

std::vector<ConfigEntry> Config;

void Init()
{
    CIniReader iniReader("");

    Config.reserve(std::size(ConfigData) + 1);
    for (auto& e : ConfigData) {
        std::string string = iniReader.ReadString(e.Section, e.Key, e.DefaultValue);
        if (string.empty()) continue;
        Config.emplace_back(ConfigEntry{ e.Key, _strdup(string.c_str()) });
    }
    Config.emplace_back(nullptr, nullptr);

    // l_Config
    injector::WriteMemory(0x44E151, Config.data(), true);
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
