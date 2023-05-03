local g_GameSliceToLoad = null;

function GameSliceLoad_Callback()
{
    g_GameSliceToLoad.ForceLock();
    g_GameSliceToLoad.State = GameSliceState.Started;
    return false;
}

function GameSliceLoad_Command(Args)
{
    g_GameSliceToLoad = ProgressionTracker.Find(Args[0], true);
    if (g_GameSliceToLoad == null)
    {
        Console.Print("[ ERROR ] Couldn't find GameSlice with that name!", Color(255, 0, 0));
        return;
    }

    // We need to create timer since console callback is outside game thread.
    Timer.Add(GameSliceLoad_Callback, 0.0);
}

Console.AddCommand("gameslice_load", "Load's gameslice by name", "<name>", 1, GameSliceLoad_Command);
