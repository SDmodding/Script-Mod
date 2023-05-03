local g_GameSliceToLoadForce = false;
local g_GameSliceToLoad = null;

function GameSliceLoad_Callback()
{
    if (g_GameSliceToLoadForce)
        ProgressionTracker.ForceSliceChange(g_GameSliceToLoad, true);
    else
    {
        g_GameSliceToLoad.ForceLock();
        g_GameSliceToLoad.State = GameSliceState.Started;
    }
    return false;
}

function TryLoadGameSlice(name)
{
    g_GameSliceToLoad = ProgressionTracker.Find(name, true);
    if (g_GameSliceToLoad == null)
    {
        Console.Print("[ ERROR ] Couldn't find GameSlice with that name!", Color(255, 0, 0));
        return false;
    }

    // We need to create timer since console callback is outside game thread.
    Timer.Add(GameSliceLoad_Callback, 0.0);
    return true;
}

function GameSliceLoad_Command(Args)
{
    g_GameSliceToLoadForce = false;
    TryLoadGameSlice(Args[0]);
}

function GameSliceForceLoad_Command(Args)
{
    g_GameSliceToLoadForce = true;
    TryLoadGameSlice(Args[0]);
}

Console.AddCommand("gameslice_load", "Load gameslice by name", "<name>", 1, GameSliceLoad_Command);
Console.AddCommand("gameslice_fload", "Load forcefully gameslice by name", "<name>", 1, GameSliceForceLoad_Command);
