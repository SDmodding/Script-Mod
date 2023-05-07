local m_Character = SimCharacter.Create(Hash.Get("object-physical-character-Tiffany"), SimCharacter.GetLocalPlayer().GetPosition(), 0.0);
m_Character.SetTarget(TargetType.AIObjective, SimCharacter.GetLocalPlayer());
m_Character.SetTargetLock(TargetType.AIObjective, true, false);
m_Character.SetAIObjective(AIObjective.FollowTarget);
