function PDA_EndCall()
{
    // We spawn winston at our location...
    local m_Winston = SimCharacter.Create(Hash.Get("object-physical-character-winston"), SimCharacter.GetLocalPlayer().GetPosition(), 0.0);
    m_Winston.SetTarget(TargetType.AIObjective, SimCharacter.GetLocalPlayer());
    m_Winston.SetTargetLock(TargetType.AIObjective, true, false);
    m_Winston.SetAIObjective(AIObjective.FollowTarget);

    // We cancel the call
    PDA.EndPhoneCall();
    return false;
}

// This will get called when contact is called from PDA
function PDA_Callback()
{
    // We wait 2.5seconds before doing stuff...
    Timer.Add(PDA_EndCall, 2.5);
    return true;
}

PDA.AddContact("Winston Backup", "Portrait_Smartphone_Winston", PDA_Callback);
