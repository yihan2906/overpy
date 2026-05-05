## IMPORTANT: keep this header. Never delete or strip it.
# Game code: 5G53R

#!suppressWarnings w_player_closest_to_reticle

#Global variables

globalvar _objectVariable_0 0
globalvar _objectVariable_1 1
globalvar _objectVariable_2 2
globalvar _objectVariable_3 3
globalvar _objectVariable_4 4
globalvar _objectVariable_5 5
globalvar _objectVariable_6 6
globalvar _objectVariable_7 7
globalvar _objectVariable_8 8
globalvar RockPaperScissors 10
globalvar ElectricShock 11
globalvar UltOperator 12
globalvar IJustWantToDie 13
globalvar SurpriseAttack 14
globalvar CantMove 15
globalvar NoClip 16
globalvar UniqueExisance 17
globalvar Repay 18
globalvar IAmSpeed 20
globalvar Stop 21
globalvar WaterGhost 22
globalvar UnclePopHummer 23
globalvar SpinFloatUp 24
globalvar Barrier 25
globalvar OneShotName 26
globalvar SleepWell 27
globalvar ItsTimeToSleep 28
globalvar LayingEgg 29
globalvar UFO 30
globalvar BehindYou 31
globalvar WhyHitMe 32
globalvar ChangePosition 33
globalvar ComeOn 34
globalvar GoodNight 35
globalvar JumpingTrap 36
globalvar SleepyNinja 37
globalvar ReallyBehindYou 38
globalvar Slap 39
globalvar TalonIsBad 40
globalvar Invisible 41
globalvar OneShot 42
globalvar RotatingTornado 43
globalvar SponsoredReaction 44
globalvar HealerEthernalFriend 45
globalvar LackOfConcentration 46
globalvar FlushBang 47
globalvar Telekinesis 48
globalvar nukeBlastRadius 50
globalvar Earthquake 51
globalvar ImAnAttentionSeeker 52
globalvar RandomScale 53
globalvar Reloading 54
globalvar LifeSaver 55
globalvar HighSensitivity 56
globalvar megaMauga 57
globalvar GoAway 58
globalvar RandomAbility 59
globalvar ElectricShockName 61
globalvar YouGotSpeed 62
globalvar Taxi 63
globalvar StrongGravity 64
globalvar EyeContact 65
globalvar MindControl 66
globalvar Lag 67
globalvar StolenSoul 69
globalvar MisClick 70
globalvar targetHeros 71
globalvar targetHeros_0 72
globalvar katrina 73
globalvar hud_created 74
globalvar cooldown_multiplier 75
globalvar unlimited_game_time 76
globalvar reroll_when_internal_death 77
globalvar show_ability_on_the_name 78
globalvar abilities 79
globalvar _classIndexes 81
globalvar _extendedGlobalCollection 82
globalvar hudIndex 83
globalvar returnValue_onEnd 84
globalvar hero 85
globalvar returnValue_onStart 86
globalvar Helicopter 87
globalvar MadWidow 88
globalvar Hole 89
globalvar PortalGun 90
globalvar NUKE 91
globalvar probabilityNuke 92


#Player variables

playervar next_ability 0
playervar title 1
playervar desc 2
playervar should_reroll 3
playervar targetIndex 4
playervar cooldown_player 5
playervar ability 8
playervar target 9
playervar targets 10
playervar allies 11
playervar target_pos 12
playervar cooldown_count 13
playervar icon_ids 14
playervar text_ids 15
playervar effect_ids 16
playervar damage_dealt 17
playervar damage_received 18
playervar max_health 19
playervar movement_speed 20
playervar rock_scissors_paper_players 21
playervar rock_siccors_paper_status 22
playervar rock_scissors_paper_opponent_han 23
playervar rock_scissors_paper_hand 24
playervar is_no_clip 25
playervar is_floating 26
playervar is_spin_floating 27
playervar is_showing_barieer 28
playervar barieer_position 29
playervar is_in_barieer 30
playervar previous_pos 31
playervar egg_position 32
playervar show_text 33
playervar trap_size 34
playervar trap_pos 35
playervar is_rotating 36
playervar power 37
playervar max_power_prev 38
playervar max_power 39
playervar earthquake_power 41
playervar is_jumping 42
playervar show_icons 43
playervar pulling_target 44
playervar high_sens_remains 45
playervar reversed_movement 46
playervar decoy 47
playervar control_decoy 48
playervar is_decoy 49
playervar decoy_ready 50
playervar high_sens_speed 51
playervar high_speed_remains 52
playervar rider 53
playervar strong_gravity_remains 54
playervar controlling 55
playervar mindcontrol_time 56
playervar progressbar_id 57
playervar targets_0 58
playervar targets_1 59
playervar targets_2 60
playervar original_position 61
playervar original_direction 62
playervar targets_3 63
playervar targets_4 64
playervar targets_5 65
playervar targets_6 66
playervar targets_7 67
playervar target_0 68
playervar targets_8 69
playervar targets_9 70
playervar tmp 71
playervar targets_10 72
playervar targets_11 73
playervar targets_12 74
playervar targets_13 75
playervar target_1 76
playervar targets_14 77
playervar targets_15 78
playervar targets_16 79
playervar target_2 80
playervar targets_17 81
playervar targets_18 82
playervar random_size 83
playervar targets_19 84
playervar targets_20 85
playervar target_3 86
playervar pos 87
playervar control_beam 88
playervar targets_22 89
playervar targets_23 90
playervar targets_24 91
playervar targets_25 92
playervar buttons 93
playervar button 94
playervar targets_prev 95
playervar targets_new 96
playervar respawn_position 97
playervar horse_target 99
playervar ishobbihorsing 100
playervar Is_Flying 101
playervar flyspeed 102
playervar widow_charge 103
playervar hole 104
playervar tp1 105
playervar hole_placing 106
playervar hole_placed 107
playervar tp2 108
playervar tp_placing 109
playervar teleported 110
playervar tp1_targets 111
playervar tp1_target 112
playervar isMegaMauga 121
playervar interact_press_count 122
playervar interact_is_held 123

macro Player.acquireViewedTarget(team, radius=80, losCheck=LosCheck.SURFACES):
    self.target = self.getPlayerClosestToReticle(team)
    if self.target == self or not self.target.isAlive() or not self.target.hasSpawned():
        return
    if self.target not in self.getPlayersInViewAngle(team, 45):
        return
    if self.target not in getPlayersInRadius(self.getEyePosition(), radius, team, losCheck):
        return

macro formatKeyPrompts(text):
    text.replace("[INTERACT]", inputBindingString(Button.INTERACT)).replace("[Interact]", inputBindingString(Button.INTERACT)).replace("[interact]", inputBindingString(Button.INTERACT)).replace("[RELOAD]", inputBindingString(Button.RELOAD)).replace("[Reload]", inputBindingString(Button.RELOAD)).replace("[reload]", inputBindingString(Button.RELOAD))

macro getSpawnedTeammatesExcludingSelf(player):
    [p for p in getLivingPlayers(player.getTeam()) if p.hasSpawned() and p != player]

macro getClosestSpawnedTeammate(player):
    sorted(getSpawnedTeammatesExcludingSelf(player), key=lambda x: distance(x, player))[0]


#Subroutine names

subroutine register_abilities1 0
subroutine register_abilities2 1
subroutine register_abilities3 2
subroutine roll_ability 3
subroutine clear_huds 4
subroutine clear_ability 5


#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


rule "Initial Global":
    RockPaperScissors = "Rock Paper Scissors"
    ElectricShockName = "Electric shock"
    UltOperator = "Ultimate operation"
    IJustWantToDie = "I just won't die"
    SurpriseAttack = "surprise attack"
    CantMove = "can't move"
    NoClip = "no-clip"
    UniqueExisance = "A unique existence"
    Repay = "Repay"
    IAmSpeed = "i am speed!"
    Stop = "Stop! yap!"
    WaterGhost = "Water ghost"
    UnclePopHummer = "Uncle Poop Hammer"
    SpinFloatUp = "Let's run in new shoes"
    Barrier = "Barrier of bondage"
    OneShotName = "One shot one **** "
    SleepWell = "sleep well"
    ItsTimeToSleep = "It's time to sleep"
    LayingEgg = "Laying eggs"
    UFO = "uh? UFO"
    BehindYou = "uh? Behind you"
    WhyHitMe = "Why hit me"
    ChangePosition = "Change position"
    ComeOn = "Come on"
    GoodNight = "good night"
    JumpingTrap = "jumping trap"
    SleepyNinja = "Sleepy ninja"
    ReallyBehindYou = "Really behind you!!"
    Slap = "slap"
    TalonIsBad = "Talon is bad"
    Invisible = "The Invisible Man"
    OneShot = "Everything in one shot"
    RotatingTornado = "Rotating tornado"
    SponsoredReaction = "Sponsored reaction"
    HealerEthernalFriend = "Healers' eternal friend"
    LackOfConcentration = "Lack of concentration"
    FlushBang = "Flush bang"
    Telekinesis = "Telekinesis"
    Earthquake = "Earthquake"
    ImAnAttentionSeeker = "I'm an attention seeker"
    RandomScale = "scale randomizer"
    Reloading = "Reloading?"
    LifeSaver = "LifeSaver"
    HighSensitivity = "High sensitivity"
    GoAway = "go away"
    RandomAbility = "Random ability"
    ElectricShock = "Electric shock"
    YouGotSpeed = "You got speed"
    Taxi = "Taxi"
    StrongGravity = "Can't jump"
    EyeContact = "Eye Contact"
    MindControl = "Mind Control"
    Lag = "lag"
    MisClick = "MisClick"
    Helicopter = "Helicopter"
    targetHeros = getTankHeroes()
    targetHeros_0 = getDamageHeroes()
    _classIndexes[0] = -1
    MadWidow = "Mad Widow"
    Hole = "Hole"
    PortalGun = "Portal Gun"
    NUKE = "Nuclear Obliteration"
    megaMauga = "Mega Mauga"
    StolenSoul = "Stolen Soul"
    katrina = "KATRINA"


rule "Initial Player":
    @Event eachPlayer
    
    eventPlayer.damage_dealt = 100
    eventPlayer.damage_received = 100
    eventPlayer.max_health = 100
    eventPlayer.movement_speed = 100
    eventPlayer.is_no_clip = false
    eventPlayer.is_floating = false
    eventPlayer.is_in_barieer = false
    eventPlayer.power = 0
    eventPlayer.max_power_prev = 0
    eventPlayer.max_power = 0
    eventPlayer.earthquake_power = 0
    eventPlayer.show_icons = []
    eventPlayer.high_sens_remains = 0
    eventPlayer.high_sens_speed = 100
    eventPlayer.reversed_movement = false
    eventPlayer.high_speed_remains = 0
    eventPlayer.strong_gravity_remains = 0
    eventPlayer.interact_press_count = 0
    eventPlayer.interact_is_held = false


rule "track interact press count":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.interact_is_held == false
    
    eventPlayer.interact_is_held = true
    eventPlayer.interact_press_count++


rule "track interact release":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == false
    @Condition eventPlayer.interact_is_held == true
    
    eventPlayer.interact_is_held = false


rule "end death match":
    @Condition isAssemblingHeroes() == true
    @Condition getCurrentGamemode() in [Gamemode.FFA, Gamemode.TDM] == true
    
    setMatchTime(0)


def register_abilities1():
    @Name "register abilities1"
    
    _extendedGlobalCollection[1] = _classIndexes.index(0)
    _extendedGlobalCollection[1] = len(_classIndexes) if _extendedGlobalCollection[1] == -1 else _extendedGlobalCollection[1]
    _classIndexes[_extendedGlobalCollection[1]] = 3
    _objectVariable_0[_extendedGlobalCollection[1]] = RockPaperScissors
    _objectVariable_1[_extendedGlobalCollection[1]] = "press [INTERACT] to play rock, paper, scissors with the enemy who you are looking at, the loser will die."
    _objectVariable_2[_extendedGlobalCollection[1]] = 10
    _objectVariable_3[_extendedGlobalCollection[1]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[1])
    _extendedGlobalCollection[2] = _classIndexes.index(0)
    _extendedGlobalCollection[2] = len(_classIndexes) if _extendedGlobalCollection[2] == -1 else _extendedGlobalCollection[2]
    _classIndexes[_extendedGlobalCollection[2]] = 4
    _objectVariable_0[_extendedGlobalCollection[2]] = ElectricShock
    _objectVariable_1[_extendedGlobalCollection[2]] = "press [interact] to stun the enemy you are looking at"
    _objectVariable_2[_extendedGlobalCollection[2]] = 10
    _objectVariable_3[_extendedGlobalCollection[2]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[2])
    _extendedGlobalCollection[3] = _classIndexes.index(0)
    _extendedGlobalCollection[3] = len(_classIndexes) if _extendedGlobalCollection[3] == -1 else _extendedGlobalCollection[3]
    _classIndexes[_extendedGlobalCollection[3]] = 5
    _objectVariable_0[_extendedGlobalCollection[3]] = UltOperator
    _objectVariable_1[_extendedGlobalCollection[3]] = "press [interact] to make the ally you are looking at instantly use their ultimate"
    _objectVariable_2[_extendedGlobalCollection[3]] = 10
    _objectVariable_3[_extendedGlobalCollection[3]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[3])
    _extendedGlobalCollection[4] = _classIndexes.index(0)
    _extendedGlobalCollection[4] = len(_classIndexes) if _extendedGlobalCollection[4] == -1 else _extendedGlobalCollection[4]
    _classIndexes[_extendedGlobalCollection[4]] = 6
    _objectVariable_0[_extendedGlobalCollection[4]] = IJustWantToDie
    _objectVariable_1[_extendedGlobalCollection[4]] = "Summons a random enemy to you upon death."
    _objectVariable_8[_extendedGlobalCollection[4]] = getAllPlayers()
    _objectVariable_3[_extendedGlobalCollection[4]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[4])
    _extendedGlobalCollection[5] = _classIndexes.index(0)
    _extendedGlobalCollection[5] = len(_classIndexes) if _extendedGlobalCollection[5] == -1 else _extendedGlobalCollection[5]
    _classIndexes[_extendedGlobalCollection[5]] = 7
    _objectVariable_0[_extendedGlobalCollection[5]] = SurpriseAttack
    _objectVariable_1[_extendedGlobalCollection[5]] = "press [interact] to teleport behind, stun and attack the enemy that you are looking at and return to where you were"
    _objectVariable_2[_extendedGlobalCollection[5]] = 5
    _objectVariable_8[_extendedGlobalCollection[5]] = [Hero.REAPER]
    _objectVariable_3[_extendedGlobalCollection[5]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[5])
    _extendedGlobalCollection[6] = _classIndexes.index(0)
    _extendedGlobalCollection[6] = len(_classIndexes) if _extendedGlobalCollection[6] == -1 else _extendedGlobalCollection[6]
    _classIndexes[_extendedGlobalCollection[6]] = 8
    _objectVariable_0[_extendedGlobalCollection[6]] = CantMove
    _objectVariable_1[_extendedGlobalCollection[6]] = "The enemy stumbles for a moment when hitting."
    _objectVariable_8[_extendedGlobalCollection[6]] = [Hero.REINHARDT]
    _objectVariable_3[_extendedGlobalCollection[6]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[6])
    _extendedGlobalCollection[7] = _classIndexes.index(0)
    _extendedGlobalCollection[7] = len(_classIndexes) if _extendedGlobalCollection[7] == -1 else _extendedGlobalCollection[7]
    _classIndexes[_extendedGlobalCollection[7]] = 9
    _objectVariable_0[_extendedGlobalCollection[7]] = NoClip
    _objectVariable_1[_extendedGlobalCollection[7]] = "press [interact] to enable/disable walk through walls mode"
    _objectVariable_3[_extendedGlobalCollection[7]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[7])
    _extendedGlobalCollection[8] = _classIndexes.index(0)
    _extendedGlobalCollection[8] = len(_classIndexes) if _extendedGlobalCollection[8] == -1 else _extendedGlobalCollection[8]
    _classIndexes[_extendedGlobalCollection[8]] = 10
    _objectVariable_0[_extendedGlobalCollection[8]] = UniqueExisance
    _objectVariable_1[_extendedGlobalCollection[8]] = "press [interact] to **** everyone that is the same hero as you"
    _objectVariable_2[_extendedGlobalCollection[8]] = 30
    _objectVariable_3[_extendedGlobalCollection[8]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[8])
    _extendedGlobalCollection[9] = _classIndexes.index(0)
    _extendedGlobalCollection[9] = len(_classIndexes) if _extendedGlobalCollection[9] == -1 else _extendedGlobalCollection[9]
    _classIndexes[_extendedGlobalCollection[9]] = 11
    _objectVariable_0[_extendedGlobalCollection[9]] = Repay
    _objectVariable_1[_extendedGlobalCollection[9]] = "Reflects 70% of the damage taken to enemies."
    _objectVariable_3[_extendedGlobalCollection[9]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[9])
    _extendedGlobalCollection[11] = _classIndexes.index(0)
    _extendedGlobalCollection[11] = len(_classIndexes) if _extendedGlobalCollection[11] == -1 else _extendedGlobalCollection[11]
    _classIndexes[_extendedGlobalCollection[11]] = 13
    _objectVariable_0[_extendedGlobalCollection[11]] = IAmSpeed
    _objectVariable_1[_extendedGlobalCollection[11]] = "increase charge speed by a lot"
    _objectVariable_8[_extendedGlobalCollection[11]] = [Hero.REINHARDT]
    _objectVariable_3[_extendedGlobalCollection[11]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[11])
    _extendedGlobalCollection[12] = _classIndexes.index(0)
    _extendedGlobalCollection[12] = len(_classIndexes) if _extendedGlobalCollection[12] == -1 else _extendedGlobalCollection[12]
    _classIndexes[_extendedGlobalCollection[12]] = 14
    _objectVariable_0[_extendedGlobalCollection[12]] = Stop
    _objectVariable_1[_extendedGlobalCollection[12]] = "press [interact] to stop the enemy that you are looking at from moving"
    _objectVariable_2[_extendedGlobalCollection[12]] = 10
    _objectVariable_3[_extendedGlobalCollection[12]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[12])
    _extendedGlobalCollection[13] = _classIndexes.index(0)
    _extendedGlobalCollection[13] = len(_classIndexes) if _extendedGlobalCollection[13] == -1 else _extendedGlobalCollection[13]
    _classIndexes[_extendedGlobalCollection[13]] = 15
    _objectVariable_0[_extendedGlobalCollection[13]] = WaterGhost
    _objectVariable_1[_extendedGlobalCollection[13]] = "the enemy who ****ed you will die as well"
    _objectVariable_3[_extendedGlobalCollection[13]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[13])
    _extendedGlobalCollection[14] = _classIndexes.index(0)
    _extendedGlobalCollection[14] = len(_classIndexes) if _extendedGlobalCollection[14] == -1 else _extendedGlobalCollection[14]
    _classIndexes[_extendedGlobalCollection[14]] = 16
    _objectVariable_0[_extendedGlobalCollection[14]] = UnclePopHummer
    _objectVariable_1[_extendedGlobalCollection[14]] = "hitting enemies with hammer will stun them"
    _objectVariable_8[_extendedGlobalCollection[14]] = [Hero.TORBJORN]
    _objectVariable_3[_extendedGlobalCollection[14]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[14])
    _extendedGlobalCollection[15] = _classIndexes.index(0)
    _extendedGlobalCollection[15] = len(_classIndexes) if _extendedGlobalCollection[15] == -1 else _extendedGlobalCollection[15]
    _classIndexes[_extendedGlobalCollection[15]] = 17
    _objectVariable_0[_extendedGlobalCollection[15]] = SpinFloatUp
    _objectVariable_1[_extendedGlobalCollection[15]] = "press [interact] to make the enemy you are looking at spin and float up"
    _objectVariable_2[_extendedGlobalCollection[15]] = 10
    _objectVariable_3[_extendedGlobalCollection[15]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[15])
    _extendedGlobalCollection[17] = _classIndexes.index(0)
    _extendedGlobalCollection[17] = len(_classIndexes) if _extendedGlobalCollection[17] == -1 else _extendedGlobalCollection[17]
    _classIndexes[_extendedGlobalCollection[17]] = 19
    _objectVariable_0[_extendedGlobalCollection[17]] = OneShotName
    _objectVariable_1[_extendedGlobalCollection[17]] = "increase damage dealt by a lot but reduce HP by a lot as well"
    _objectVariable_8[_extendedGlobalCollection[17]] = getSupportHeroes()
    _objectVariable_6[_extendedGlobalCollection[17]] = 1
    _objectVariable_4[_extendedGlobalCollection[17]] = 50000
    _objectVariable_3[_extendedGlobalCollection[17]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[17])
    _extendedGlobalCollection[18] = _classIndexes.index(0)
    _extendedGlobalCollection[18] = len(_classIndexes) if _extendedGlobalCollection[18] == -1 else _extendedGlobalCollection[18]
    _classIndexes[_extendedGlobalCollection[18]] = 20
    _objectVariable_0[_extendedGlobalCollection[18]] = SleepWell
    _objectVariable_1[_extendedGlobalCollection[18]] = "press [interact] to summon random enemy TANK and sleep them"
    _objectVariable_2[_extendedGlobalCollection[18]] = 30
    _objectVariable_8[_extendedGlobalCollection[18]] = getAllPlayers()
    _objectVariable_3[_extendedGlobalCollection[18]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[18])
    _extendedGlobalCollection[19] = _classIndexes.index(0)
    _extendedGlobalCollection[19] = len(_classIndexes) if _extendedGlobalCollection[19] == -1 else _extendedGlobalCollection[19]
    _classIndexes[_extendedGlobalCollection[19]] = 21
    _objectVariable_0[_extendedGlobalCollection[19]] = ItsTimeToSleep
    _objectVariable_1[_extendedGlobalCollection[19]] = "****ing an enemy directly puts everyone to sleep."
    _objectVariable_3[_extendedGlobalCollection[19]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[19])
    _extendedGlobalCollection[20] = _classIndexes.index(0)
    _extendedGlobalCollection[20] = len(_classIndexes) if _extendedGlobalCollection[20] == -1 else _extendedGlobalCollection[20]
    _classIndexes[_extendedGlobalCollection[20]] = 22
    _objectVariable_0[_extendedGlobalCollection[20]] = LayingEgg
    _objectVariable_1[_extendedGlobalCollection[20]] = "Press [interact] to lay eggs. return to egg when received fatal damage."
    _objectVariable_2[_extendedGlobalCollection[20]] = 5
    _objectVariable_6[_extendedGlobalCollection[20]] = 50
    _objectVariable_3[_extendedGlobalCollection[20]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[20])
    _extendedGlobalCollection[21] = _classIndexes.index(0)
    _extendedGlobalCollection[21] = len(_classIndexes) if _extendedGlobalCollection[21] == -1 else _extendedGlobalCollection[21]
    _classIndexes[_extendedGlobalCollection[21]] = 23
    _objectVariable_0[_extendedGlobalCollection[21]] = BehindYou
    _objectVariable_1[_extendedGlobalCollection[21]] = "press [interact] to make the enemy that you are looking at look back"
    _objectVariable_2[_extendedGlobalCollection[21]] = 3
    _objectVariable_3[_extendedGlobalCollection[21]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[21])
    _extendedGlobalCollection[22] = _classIndexes.index(0)
    _extendedGlobalCollection[22] = len(_classIndexes) if _extendedGlobalCollection[22] == -1 else _extendedGlobalCollection[22]
    _classIndexes[_extendedGlobalCollection[22]] = 24
    _objectVariable_0[_extendedGlobalCollection[22]] = WhyHitMe
    _objectVariable_1[_extendedGlobalCollection[22]] = "Enemies that attack you will change their camera angle."
    _objectVariable_3[_extendedGlobalCollection[22]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[22])
    _extendedGlobalCollection[23] = _classIndexes.index(0)
    _extendedGlobalCollection[23] = len(_classIndexes) if _extendedGlobalCollection[23] == -1 else _extendedGlobalCollection[23]
    _classIndexes[_extendedGlobalCollection[23]] = 25
    _objectVariable_0[_extendedGlobalCollection[23]] = ChangePosition
    _objectVariable_1[_extendedGlobalCollection[23]] = "press [interact] to switch position with the enemy you are looking at"
    _objectVariable_2[_extendedGlobalCollection[23]] = 10
    _objectVariable_3[_extendedGlobalCollection[23]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[23])
    _extendedGlobalCollection[24] = _classIndexes.index(0)
    _extendedGlobalCollection[24] = len(_classIndexes) if _extendedGlobalCollection[24] == -1 else _extendedGlobalCollection[24]
    _classIndexes[_extendedGlobalCollection[24]] = 26
    _objectVariable_0[_extendedGlobalCollection[24]] = ComeOn
    _objectVariable_1[_extendedGlobalCollection[24]] = "Press [Interact] to summons the enemy you are looking at in front of you."
    _objectVariable_2[_extendedGlobalCollection[24]] = 5
    _objectVariable_3[_extendedGlobalCollection[24]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[24])
    _extendedGlobalCollection[25] = _classIndexes.index(0)
    _extendedGlobalCollection[25] = len(_classIndexes) if _extendedGlobalCollection[25] == -1 else _extendedGlobalCollection[25]
    _classIndexes[_extendedGlobalCollection[25]] = 27
    _objectVariable_0[_extendedGlobalCollection[25]] = GoodNight
    _objectVariable_1[_extendedGlobalCollection[25]] = "press [interact] to put the enemy that you are looking at to sleep"
    _objectVariable_2[_extendedGlobalCollection[25]] = 8
    _objectVariable_3[_extendedGlobalCollection[25]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[25])
    _extendedGlobalCollection[26] = _classIndexes.index(0)
    _extendedGlobalCollection[26] = len(_classIndexes) if _extendedGlobalCollection[26] == -1 else _extendedGlobalCollection[26]
    _classIndexes[_extendedGlobalCollection[26]] = 28
    _objectVariable_0[_extendedGlobalCollection[26]] = JumpingTrap
    _objectVariable_1[_extendedGlobalCollection[26]] = "press [interact] to create a jumping trap"
    _objectVariable_2[_extendedGlobalCollection[26]] = 2
    _objectVariable_3[_extendedGlobalCollection[26]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[26])
    _extendedGlobalCollection[27] = _classIndexes.index(0)
    _extendedGlobalCollection[27] = len(_classIndexes) if _extendedGlobalCollection[27] == -1 else _extendedGlobalCollection[27]
    _classIndexes[_extendedGlobalCollection[27]] = 29
    _objectVariable_0[_extendedGlobalCollection[27]] = SleepyNinja
    _objectVariable_1[_extendedGlobalCollection[27]] = "attack will stun enemy but damage dealt is reduced by a lot"
    _objectVariable_8[_extendedGlobalCollection[27]] = [Hero.GENJI]
    _objectVariable_4[_extendedGlobalCollection[27]] = 0.05
    _objectVariable_3[_extendedGlobalCollection[27]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[27])
    _extendedGlobalCollection[28] = _classIndexes.index(0)
    _extendedGlobalCollection[28] = len(_classIndexes) if _extendedGlobalCollection[28] == -1 else _extendedGlobalCollection[28]
    _classIndexes[_extendedGlobalCollection[28]] = 30
    _objectVariable_0[_extendedGlobalCollection[28]] = ReallyBehindYou
    _objectVariable_1[_extendedGlobalCollection[28]] = "press [interact] to teleport behind and stun the enemy that you are looking at"
    _objectVariable_2[_extendedGlobalCollection[28]] = 10
    _objectVariable_3[_extendedGlobalCollection[28]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[28])
    _extendedGlobalCollection[29] = _classIndexes.index(0)
    _extendedGlobalCollection[29] = len(_classIndexes) if _extendedGlobalCollection[29] == -1 else _extendedGlobalCollection[29]
    _classIndexes[_extendedGlobalCollection[29]] = 31
    _objectVariable_0[_extendedGlobalCollection[29]] = Slap
    _objectVariable_1[_extendedGlobalCollection[29]] = "increase chain hook damage"
    _objectVariable_8[_extendedGlobalCollection[29]] = [Hero.ROADHOG]
    _objectVariable_3[_extendedGlobalCollection[29]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[29])
    _extendedGlobalCollection[30] = _classIndexes.index(0)
    _extendedGlobalCollection[30] = len(_classIndexes) if _extendedGlobalCollection[30] == -1 else _extendedGlobalCollection[30]
    _classIndexes[_extendedGlobalCollection[30]] = 32
    _objectVariable_0[_extendedGlobalCollection[30]] = TalonIsBad
    _objectVariable_1[_extendedGlobalCollection[30]] = "press [Interact] to summom random enemy DPS and stun"
    _objectVariable_2[_extendedGlobalCollection[30]] = 30
    _objectVariable_8[_extendedGlobalCollection[30]] = getAllPlayers()
    _objectVariable_3[_extendedGlobalCollection[30]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[30])
    _extendedGlobalCollection[31] = _classIndexes.index(0)
    _extendedGlobalCollection[31] = len(_classIndexes) if _extendedGlobalCollection[31] == -1 else _extendedGlobalCollection[31]
    _classIndexes[_extendedGlobalCollection[31]] = 33
    _objectVariable_0[_extendedGlobalCollection[31]] = Invisible
    _objectVariable_1[_extendedGlobalCollection[31]] = "you are invisible but HP is reduced"
    _objectVariable_6[_extendedGlobalCollection[31]] = 25
    _objectVariable_3[_extendedGlobalCollection[31]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[31])
    _extendedGlobalCollection[32] = _classIndexes.index(0)
    _extendedGlobalCollection[32] = len(_classIndexes) if _extendedGlobalCollection[32] == -1 else _extendedGlobalCollection[32]
    _classIndexes[_extendedGlobalCollection[32]] = 34
    _objectVariable_0[_extendedGlobalCollection[32]] = OneShot
    _objectVariable_1[_extendedGlobalCollection[32]] = "When attacking, there is a 50% chance to instantly **** an enemy, and you are stunned for 6 seconds."
    _objectVariable_2[_extendedGlobalCollection[32]] = 12
    _objectVariable_3[_extendedGlobalCollection[32]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[32])
    _extendedGlobalCollection[33] = _classIndexes.index(0)
    _extendedGlobalCollection[33] = len(_classIndexes) if _extendedGlobalCollection[33] == -1 else _extendedGlobalCollection[33]
    _classIndexes[_extendedGlobalCollection[33]] = 35
    _objectVariable_0[_extendedGlobalCollection[33]] = RotatingTornado
    _objectVariable_1[_extendedGlobalCollection[33]] = "press [interact] to spin the enemy that you are looking at"
    _objectVariable_2[_extendedGlobalCollection[33]] = 10
    _objectVariable_3[_extendedGlobalCollection[33]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[33])
    _extendedGlobalCollection[34] = _classIndexes.index(0)
    _extendedGlobalCollection[34] = len(_classIndexes) if _extendedGlobalCollection[34] == -1 else _extendedGlobalCollection[34]
    _classIndexes[_extendedGlobalCollection[34]] = 36
    _objectVariable_0[_extendedGlobalCollection[34]] = SponsoredReaction
    _objectVariable_1[_extendedGlobalCollection[34]] = "press [Interact] to the enemy you are looking at will have a chance to make them emote"
    _objectVariable_2[_extendedGlobalCollection[34]] = 9
    _objectVariable_3[_extendedGlobalCollection[34]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[34])
    _extendedGlobalCollection[35] = _classIndexes.index(0)
    _extendedGlobalCollection[35] = len(_classIndexes) if _extendedGlobalCollection[35] == -1 else _extendedGlobalCollection[35]
    _classIndexes[_extendedGlobalCollection[35]] = 37
    _objectVariable_0[_extendedGlobalCollection[35]] = HealerEthernalFriend
    _objectVariable_1[_extendedGlobalCollection[35]] = "press [interact] to summon enemy support and stun"
    _objectVariable_2[_extendedGlobalCollection[35]] = 30
    _objectVariable_8[_extendedGlobalCollection[35]] = getAllPlayers()
    _objectVariable_3[_extendedGlobalCollection[35]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[35])


def register_abilities2():
    @Name "register abilities2"
    
    _extendedGlobalCollection[36] = _classIndexes.index(0)
    _extendedGlobalCollection[36] = len(_classIndexes) if _extendedGlobalCollection[36] == -1 else _extendedGlobalCollection[36]
    _classIndexes[_extendedGlobalCollection[36]] = 38
    _objectVariable_0[_extendedGlobalCollection[36]] = LackOfConcentration
    _objectVariable_1[_extendedGlobalCollection[36]] = "Deal 500% damage, but your perspective gets blown away"
    _objectVariable_8[_extendedGlobalCollection[36]] = [Hero.CASSIDY]
    _objectVariable_4[_extendedGlobalCollection[36]] = 500
    _objectVariable_3[_extendedGlobalCollection[36]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[36])
    _extendedGlobalCollection[37] = _classIndexes.index(0)
    _extendedGlobalCollection[37] = len(_classIndexes) if _extendedGlobalCollection[37] == -1 else _extendedGlobalCollection[37]
    _classIndexes[_extendedGlobalCollection[37]] = 39
    _objectVariable_0[_extendedGlobalCollection[37]] = FlushBang
    _objectVariable_1[_extendedGlobalCollection[37]] = "the bullet creates a flashbang at the point of impact, stunning the enemy it hits"
    _objectVariable_8[_extendedGlobalCollection[37]] = [Hero.CASSIDY]
    _objectVariable_3[_extendedGlobalCollection[37]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[37])
    _extendedGlobalCollection[38] = _classIndexes.index(0)
    _extendedGlobalCollection[38] = len(_classIndexes) if _extendedGlobalCollection[38] == -1 else _extendedGlobalCollection[38]
    _classIndexes[_extendedGlobalCollection[38]] = 40
    _objectVariable_0[_extendedGlobalCollection[38]] = Telekinesis
    _objectVariable_1[_extendedGlobalCollection[38]] = "press [interact] to move the enemy that you are looking at in various directions"
    _objectVariable_2[_extendedGlobalCollection[38]] = 14
    _objectVariable_3[_extendedGlobalCollection[38]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[38])
    _extendedGlobalCollection[41] = _classIndexes.index(0)
    _extendedGlobalCollection[41] = len(_classIndexes) if _extendedGlobalCollection[41] == -1 else _extendedGlobalCollection[41]
    _classIndexes[_extendedGlobalCollection[41]] = 43
    _objectVariable_0[_extendedGlobalCollection[41]] = Earthquake
    _objectVariable_1[_extendedGlobalCollection[41]] = "Hold [crouch] to increase power, press [interact] to jump. Shakes the ground upon landing."
    _objectVariable_3[_extendedGlobalCollection[41]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[41])
    _extendedGlobalCollection[42] = _classIndexes.index(0)
    _extendedGlobalCollection[42] = len(_classIndexes) if _extendedGlobalCollection[42] == -1 else _extendedGlobalCollection[42]
    _classIndexes[_extendedGlobalCollection[42]] = 44
    _objectVariable_0[_extendedGlobalCollection[42]] = ImAnAttentionSeeker
    _objectVariable_1[_extendedGlobalCollection[42]] = "Damage, heal, and health are doubled, but your location is exposed"
    _objectVariable_6[_extendedGlobalCollection[42]] = 200
    _objectVariable_4[_extendedGlobalCollection[42]] = 200
    _objectVariable_3[_extendedGlobalCollection[42]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[42])


def register_abilities3():
    @Name "register abilities3"
    
    _extendedGlobalCollection[43] = _classIndexes.index(0)
    _extendedGlobalCollection[43] = len(_classIndexes) if _extendedGlobalCollection[43] == -1 else _extendedGlobalCollection[43]
    _classIndexes[_extendedGlobalCollection[43]] = 45
    _objectVariable_0[_extendedGlobalCollection[43]] = RandomScale
    _objectVariable_1[_extendedGlobalCollection[43]] = "press [interact] to change the size of the player you are looking at"
    _objectVariable_2[_extendedGlobalCollection[43]] = 15
    _objectVariable_3[_extendedGlobalCollection[43]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[43])
    _extendedGlobalCollection[44] = _classIndexes.index(0)
    _extendedGlobalCollection[44] = len(_classIndexes) if _extendedGlobalCollection[44] == -1 else _extendedGlobalCollection[44]
    _classIndexes[_extendedGlobalCollection[44]] = 46
    _objectVariable_0[_extendedGlobalCollection[44]] = Reloading
    _objectVariable_1[_extendedGlobalCollection[44]] = "press [interact] to let the enemy you are looking at reload"
    _objectVariable_2[_extendedGlobalCollection[44]] = 8
    _objectVariable_3[_extendedGlobalCollection[44]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[44])
    _extendedGlobalCollection[45] = _classIndexes.index(0)
    _extendedGlobalCollection[45] = len(_classIndexes) if _extendedGlobalCollection[45] == -1 else _extendedGlobalCollection[45]
    _classIndexes[_extendedGlobalCollection[45]] = 47
    _objectVariable_0[_extendedGlobalCollection[45]] = LifeSaver
    _objectVariable_1[_extendedGlobalCollection[45]] = "press [interact] to pull the ally you are looking at through the wall"
    _objectVariable_2[_extendedGlobalCollection[45]] = 30
    _objectVariable_8[_extendedGlobalCollection[45]] = [Hero.LIFEWEAVER]
    _objectVariable_3[_extendedGlobalCollection[45]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[45])
    _extendedGlobalCollection[46] = _classIndexes.index(0)
    _extendedGlobalCollection[46] = len(_classIndexes) if _extendedGlobalCollection[46] == -1 else _extendedGlobalCollection[46]
    _classIndexes[_extendedGlobalCollection[46]] = 48
    _objectVariable_0[_extendedGlobalCollection[46]] = HighSensitivity
    _objectVariable_1[_extendedGlobalCollection[46]] = "press [interact] to temporarily alternate the aim speed of the enemy you are looking at between very low and very high"
    _objectVariable_2[_extendedGlobalCollection[46]] = 15
    _objectVariable_3[_extendedGlobalCollection[46]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[46])
    _objectVariable_8[_extendedGlobalCollection[48]] = [Hero.ZENYATTA]
    _extendedGlobalCollection[50] = _classIndexes.index(0)
    _extendedGlobalCollection[50] = len(_classIndexes) if _extendedGlobalCollection[50] == -1 else _extendedGlobalCollection[50]
    _classIndexes[_extendedGlobalCollection[50]] = 52
    _objectVariable_0[_extendedGlobalCollection[50]] = YouGotSpeed
    _objectVariable_1[_extendedGlobalCollection[50]] = "press [interact] to temporarily make the movement speed of the enemy you are looking at very fast"
    _objectVariable_2[_extendedGlobalCollection[50]] = 15
    _objectVariable_3[_extendedGlobalCollection[50]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[50])
    _extendedGlobalCollection[51] = _classIndexes.index(0)
    _extendedGlobalCollection[51] = len(_classIndexes) if _extendedGlobalCollection[51] == -1 else _extendedGlobalCollection[51]
    _classIndexes[_extendedGlobalCollection[51]] = 53
    _objectVariable_0[_extendedGlobalCollection[51]] = Taxi
    _objectVariable_1[_extendedGlobalCollection[51]] = "press [INTERACT] to start/stop riding the player you are looking at"
    _objectVariable_2[_extendedGlobalCollection[51]] = 0
    _objectVariable_3[_extendedGlobalCollection[51]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[51])
    _extendedGlobalCollection[52] = _classIndexes.index(0)
    _extendedGlobalCollection[52] = len(_classIndexes) if _extendedGlobalCollection[52] == -1 else _extendedGlobalCollection[52]
    _classIndexes[_extendedGlobalCollection[52]] = 54
    _objectVariable_0[_extendedGlobalCollection[52]] = StrongGravity
    _objectVariable_1[_extendedGlobalCollection[52]] = "press [interact] to temporarily make the gravity of the enemy you are looking at strong"
    _objectVariable_2[_extendedGlobalCollection[52]] = 15
    _objectVariable_3[_extendedGlobalCollection[52]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[52])
    _extendedGlobalCollection[53] = _classIndexes.index(0)
    _extendedGlobalCollection[53] = len(_classIndexes) if _extendedGlobalCollection[53] == -1 else _extendedGlobalCollection[53]
    _classIndexes[_extendedGlobalCollection[53]] = 55
    _objectVariable_0[_extendedGlobalCollection[53]] = EyeContact
    _objectVariable_1[_extendedGlobalCollection[53]] = "Press [Interact] to force the enemy you are looking at to look at a random ally"
    _objectVariable_2[_extendedGlobalCollection[53]] = 5
    _objectVariable_3[_extendedGlobalCollection[53]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[53])
    _extendedGlobalCollection[54] = _classIndexes.index(0)
    _extendedGlobalCollection[54] = len(_classIndexes) if _extendedGlobalCollection[54] == -1 else _extendedGlobalCollection[54]
    _classIndexes[_extendedGlobalCollection[54]] = 56
    _objectVariable_0[_extendedGlobalCollection[54]] = MindControl
    _objectVariable_1[_extendedGlobalCollection[54]] = "Press [Interact] to control the enemy you are looking at but you can't move"
    _objectVariable_2[_extendedGlobalCollection[54]] = 0
    _objectVariable_3[_extendedGlobalCollection[54]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[54])
    _extendedGlobalCollection[55] = _classIndexes.index(0)
    _extendedGlobalCollection[55] = len(_classIndexes) if _extendedGlobalCollection[55] == -1 else _extendedGlobalCollection[55]
    _classIndexes[_extendedGlobalCollection[55]] = 57
    _objectVariable_0[_extendedGlobalCollection[55]] = Lag
    _objectVariable_1[_extendedGlobalCollection[55]] = "press [interact] to teleport the enemy you are looking at to random position"
    _objectVariable_2[_extendedGlobalCollection[55]] = 10
    _objectVariable_3[_extendedGlobalCollection[55]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[55])
    _extendedGlobalCollection[58] = _classIndexes.index(0)
    _extendedGlobalCollection[58] = len(_classIndexes) if _extendedGlobalCollection[58] == -1 else _extendedGlobalCollection[58]
    _classIndexes[_extendedGlobalCollection[58]] = 60
    _objectVariable_0[_extendedGlobalCollection[58]] = MisClick
    _objectVariable_1[_extendedGlobalCollection[58]] = "press [interact] to let the enemy that you are looking at press a random button"
    _objectVariable_2[_extendedGlobalCollection[58]] = 10
    _objectVariable_3[_extendedGlobalCollection[58]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[58])
    _extendedGlobalCollection[59] = _classIndexes.index(0)
    _extendedGlobalCollection[59] = len(_classIndexes) if _extendedGlobalCollection[59] == -1 else _extendedGlobalCollection[59]
    _classIndexes[_extendedGlobalCollection[59]] = 61
    _objectVariable_0[_extendedGlobalCollection[59]] = Helicopter
    _objectVariable_1[_extendedGlobalCollection[59]] = "press [Interact] to start/stop flying"
    _objectVariable_2[_extendedGlobalCollection[58]] = 0
    _objectVariable_3[_extendedGlobalCollection[59]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[59])
    _extendedGlobalCollection[60] = _classIndexes.index(0)
    _extendedGlobalCollection[60] = len(_classIndexes) if _extendedGlobalCollection[60] == -1 else _extendedGlobalCollection[60]
    _classIndexes[_extendedGlobalCollection[60]] = 62
    _objectVariable_0[_extendedGlobalCollection[60]] = MadWidow
    _objectVariable_1[_extendedGlobalCollection[60]] = "you can snipe your teammates, but they can kill you with melee"
    _objectVariable_2[_extendedGlobalCollection[60]] = 0
    _objectVariable_8[_extendedGlobalCollection[60]] = [Hero.WIDOWMAKER]
    _objectVariable_3[_extendedGlobalCollection[60]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[60])
    _extendedGlobalCollection[61] = _classIndexes.index(0)
    _extendedGlobalCollection[61] = len(_classIndexes) if _extendedGlobalCollection[61] == -1 else _extendedGlobalCollection[61]
    _classIndexes[_extendedGlobalCollection[61]] = 63
    _objectVariable_0[_extendedGlobalCollection[61]] = Hole
    _objectVariable_1[_extendedGlobalCollection[61]] = "press [interact] to start/stop placing a HOLE that will force players to fall through the ground"
    _objectVariable_2[_extendedGlobalCollection[61]] = 0
    _objectVariable_3[_extendedGlobalCollection[61]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[61])
    _extendedGlobalCollection[62] = _classIndexes.index(0)
    _extendedGlobalCollection[62] = len(_classIndexes) if _extendedGlobalCollection[62] == -1 else _extendedGlobalCollection[62]
    _classIndexes[_extendedGlobalCollection[62]] = 64
    _objectVariable_0[_extendedGlobalCollection[62]] = PortalGun
    _objectVariable_1[_extendedGlobalCollection[62]] = "Press [interact] start/stop placing portals. Hold [interact] to reset portals"
    _objectVariable_2[_extendedGlobalCollection[62]] = 0
    _objectVariable_3[_extendedGlobalCollection[62]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[62])
    _extendedGlobalCollection[100] = _classIndexes.index(0)
    _extendedGlobalCollection[100] = len(_classIndexes) if _extendedGlobalCollection[100] == -1 else _extendedGlobalCollection[100]
    _classIndexes[_extendedGlobalCollection[100]] = 102
    _objectVariable_0[_extendedGlobalCollection[100]] = NUKE
    _objectVariable_1[_extendedGlobalCollection[100]] = "Press Q: Nuke the worldâ€¦ or yourself. Itâ€™s a gamble!"
    _objectVariable_8[_extendedGlobalCollection[100]] = [Hero.DVA]
    _objectVariable_3[_extendedGlobalCollection[100]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[100])
    _extendedGlobalCollection[101] = _classIndexes.index(0)
    _extendedGlobalCollection[101] = len(_classIndexes) if _extendedGlobalCollection[101] == -1 else _extendedGlobalCollection[101]
    _classIndexes[_extendedGlobalCollection[101]] = 103
    _objectVariable_0[_extendedGlobalCollection[101]] = megaMauga
    _objectVariable_1[_extendedGlobalCollection[101]] = "Press [INTERACT] to become 10x bigger!"
    _objectVariable_8[_extendedGlobalCollection[101]] = [Hero.MAUGA]
    _objectVariable_3[_extendedGlobalCollection[101]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[101])
    _extendedGlobalCollection[103] = _classIndexes.index(0)
    _extendedGlobalCollection[103] = len(_classIndexes) if _extendedGlobalCollection[103] == -1 else _extendedGlobalCollection[103]
    _classIndexes[_extendedGlobalCollection[103]] = 105
    _objectVariable_0[_extendedGlobalCollection[103]] = StolenSoul
    _objectVariable_1[_extendedGlobalCollection[103]] = "Press [INTERACT] to steal the ability of the ally or enemy you're looking at."
    _objectVariable_8[_extendedGlobalCollection[103]] = getAllPlayers()
    _objectVariable_3[_extendedGlobalCollection[103]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[103])
    _extendedGlobalCollection[102] = _classIndexes.index(0)
    _extendedGlobalCollection[102] = len(_classIndexes) if _extendedGlobalCollection[102] == -1 else _extendedGlobalCollection[102]
    _classIndexes[_extendedGlobalCollection[102]] = 104
    _objectVariable_0[_extendedGlobalCollection[102]] = katrina
    _objectVariable_1[_extendedGlobalCollection[102]] = "Press [INTERACT] to defy fateâ€”steal a soul, or lose your own"
    _objectVariable_8[_extendedGlobalCollection[102]] = [Hero.MERCY]
    _objectVariable_3[_extendedGlobalCollection[102]] = len(abilities) + 1
    abilities.append(_extendedGlobalCollection[102])


rule "init global variables":
    hud_created = []
    cooldown_multiplier = 2.0
    reroll_when_internal_death = createWorkshopSettingBool("Ability setting", "Ability change in case of intentional death", false)
    show_ability_on_the_name = createWorkshopSettingBool("Ability setting", "Show ability name on the player name", false)
    unlimited_game_time = createWorkshopSettingBool("Game settings", "Unlimited game time", false)
    if unlimited_game_time:
        disableGamemodeCompletion()
    abilities = []
    register_abilities1()
    register_abilities2()
    register_abilities3()


rule "create hud texts":
    @Event eachPlayer
    @Condition eventPlayer in hud_created == false
    @Condition eventPlayer.isDummy() == false
    
    hud_created.append(eventPlayer)
    hudSubheader(eventPlayer, "hold {0} to reset".format(inputBindingString(Button.RELOAD)), HudPosition.LEFT, -1, Color.BLACK, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(eventPlayer, eventPlayer.title, HudPosition.LEFT, 5, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(eventPlayer, formatKeyPrompts(eventPlayer.desc), HudPosition.LEFT, 10, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(eventPlayer, "interact presses  {0}".format(eventPlayer.interact_press_count), HudPosition.LEFT, 15, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(eventPlayer.cooldown_player, "cooldown  {0}".format(eventPlayer.cooldown_count), HudPosition.LEFT, 20, Color.RED, HudReeval.VISIBILITY_AND_STRING)
    if show_ability_on_the_name:
        createInWorldText(getAllPlayers(), eventPlayer.title, eventPlayer, 0.6, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.GRAY, SpecVisibility.ALWAYS)


rule "update cooldown":
    @Event eachPlayer
    
    wait(0.5)
    eventPlayer.cooldown_count--
    if ruleCondition:
        loop()


rule "show cooldown text":
    @Event eachPlayer
    @Condition eventPlayer.cooldown_count > 0
    
    eventPlayer.cooldown_player = eventPlayer


rule "hide cooldown text":
    @Event eachPlayer
    @Condition eventPlayer.cooldown_count <= 0
    
    eventPlayer.cooldown_player = null


def clear_huds():
    @Name "clear huds"
    
    hudIndex = 0
    #HUD
    for hudIndex in range(len(eventPlayer.text_ids)):
        destroyHudText(eventPlayer.text_ids[hudIndex])
    eventPlayer.text_ids = []
    #Effect
    for hudIndex in range(len(eventPlayer.effect_ids)):
        destroyEffect(eventPlayer.effect_ids[hudIndex])
    eventPlayer.effect_ids = []
    #Icon
    for hudIndex in range(len(eventPlayer.icon_ids)):
        destroyIcon(eventPlayer.icon_ids[hudIndex])
    eventPlayer.icon_ids = []


def clear_ability():
    @Name "clear ability"
    
    eventPlayer.setMaxHealth(100)
    eventPlayer.stopCamera()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setGravity(100)
    destroyProgressBarHud(eventPlayer.progressbar_id)
    eventPlayer.enableEnvironmentCollision()
    eventPlayer.detach()
    eventPlayer.startForcingHero(random.choice(getAllHeroes()))
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.allowButton(Button.ULTIMATE)
    eventPlayer.allowButton(Button.MELEE)
    eventPlayer.allowButton(Button.JUMP)
    eventPlayer.allowButton(Button.CROUCH)
    eventPlayer.tp1 = null
    eventPlayer.tp2 = null
    eventPlayer.tp_placing = false
    eventPlayer.hole_placed = false
    eventPlayer.hole_placing = false
    eventPlayer.ishobbihorsing = false
    eventPlayer.horse_target = null
    eventPlayer.Is_Flying = false
    if eventPlayer.ability != null:
        if len(_objectVariable_8[eventPlayer.ability]) > 0:
            eventPlayer.stopForcingCurrentHero()
        if _objectVariable_4[eventPlayer.ability] != null:
            eventPlayer.setDamageDealt(100)
        if _objectVariable_4[eventPlayer.ability] != null:
            eventPlayer.setDamageDealt(100)
        if _objectVariable_7[eventPlayer.ability] != null:
            eventPlayer.setMoveSpeed(100)
        if _objectVariable_6[eventPlayer.ability] != null:
            eventPlayer.setMaxHealth(100)
        eventPlayer.removeAllHealthPools()
        eventPlayer.stopTransformingThrottle()
        eventPlayer.stopScalingSize()
        eventPlayer.stopModifyingVoicelinePitch()
        goto loc+[230, 0, 3, 6, 9, 12, 15, 19, 22, 25, 29, 32, 35, 38, 43, 46, 49, 52, 55, 60, 64, 67, 70, 74, 77, 80, 83, 86, 89, 94, 97, 100, 104, 107, 111, 114, 117, 120, 123, 128, 131, 134, 144, 154, 160, 166, 169, 172, 175, 179, 182, 188, 194, 198, 204, 208, 211, 219, 222, 226, 229][[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63].index(_classIndexes[eventPlayer.ability]) + 1]
        returnValue_onEnd = false
        goto lbl_0
        goto lbl_1
        returnValue_onEnd = false
        goto lbl_2
        goto lbl_3
        returnValue_onEnd = false
        goto lbl_4
        goto lbl_5
        returnValue_onEnd = false
        goto lbl_6
        goto lbl_7
        returnValue_onEnd = false
        goto lbl_8
        goto lbl_9
        eventPlayer.should_reroll = false
        returnValue_onEnd = true
        goto lbl_10
        goto lbl_11
        returnValue_onEnd = false
        goto lbl_12
        goto lbl_13
        returnValue_onEnd = false
        goto lbl_14
        goto lbl_15
        eventPlayer.enableEnvironmentCollision()
        returnValue_onEnd = true
        goto lbl_16
        goto lbl_17
        returnValue_onEnd = false
        goto lbl_18
        goto lbl_19
        returnValue_onEnd = false
        goto lbl_20
        goto lbl_21
        returnValue_onEnd = false
        goto lbl_22
        goto lbl_23
        eventPlayer.setDamageDealt(100)
        eventPlayer.setMoveSpeed(100)
        returnValue_onEnd = true
        goto lbl_24
        goto lbl_25
        returnValue_onEnd = false
        goto lbl_26
        goto lbl_27
        returnValue_onEnd = false
        goto lbl_28
        goto lbl_29
        returnValue_onEnd = false
        goto lbl_30
        goto lbl_31
        returnValue_onEnd = false
        goto lbl_32
        goto lbl_33
        eventPlayer.is_showing_barieer = false
        eventPlayer.barieer_position = null
        returnValue_onEnd = false
        goto lbl_34
        goto lbl_35
        eventPlayer.setAbility2Enabled(true)
        returnValue_onEnd = true
        goto lbl_36
        goto lbl_37
        returnValue_onEnd = false
        goto lbl_38
        goto lbl_39
        returnValue_onEnd = false
        goto lbl_40
        goto lbl_41
        eventPlayer.clearStatusEffect(Status.UNKILLABLE)
        returnValue_onEnd = true
        goto lbl_42
        goto lbl_43
        returnValue_onEnd = false
        goto lbl_44
        goto lbl_45
        returnValue_onEnd = true
        goto lbl_46
        goto lbl_47
        returnValue_onEnd = false
        goto lbl_48
        goto lbl_49
        returnValue_onEnd = false
        goto lbl_50
        goto lbl_51
        returnValue_onEnd = false
        goto lbl_52
        goto lbl_53
        eventPlayer.trap_size = 0
        eventPlayer.trap_pos = null
        returnValue_onEnd = true
        goto lbl_54
        goto lbl_55
        returnValue_onEnd = false
        goto lbl_56
        goto lbl_57
        returnValue_onEnd = false
        goto lbl_58
        goto lbl_59
        eventPlayer.setDamageDealt(100)
        returnValue_onEnd = true
        goto lbl_60
        goto lbl_61
        returnValue_onEnd = false
        goto lbl_62
        goto lbl_63
        eventPlayer.setInvisibility(Invis.NONE)
        returnValue_onEnd = true
        goto lbl_64
        goto lbl_65
        returnValue_onEnd = false
        goto lbl_66
        goto lbl_67
        returnValue_onEnd = false
        goto lbl_68
        goto lbl_69
        returnValue_onEnd = false
        goto lbl_70
        goto lbl_71
        returnValue_onEnd = false
        goto lbl_72
        goto lbl_73
        eventPlayer.setSecondaryFireEnabled(true)
        eventPlayer.setAbility2Enabled(true)
        returnValue_onEnd = true
        goto lbl_74
        goto lbl_75
        returnValue_onEnd = false
        goto lbl_76
        goto lbl_77
        returnValue_onEnd = false
        goto lbl_78
        goto lbl_79
        returnValue_onEnd = false
        goto lbl_80
        goto lbl_81
        eventPlayer.max_health = 100
        eventPlayer.damage_dealt = 100
        eventPlayer.movement_speed = 100
        eventPlayer.setMaxHealth(100)
        eventPlayer.setDamageDealt(100)
        eventPlayer.setHealingDealt(100)
        eventPlayer.setMoveSpeed(100)
        returnValue_onEnd = true
        goto lbl_82
        goto lbl_83
        eventPlayer.earthquake_power = 0
        eventPlayer.is_jumping = false
        eventPlayer.clearStatusEffect(Status.HACKED)
        returnValue_onEnd = true
        goto lbl_84
        goto lbl_85
        eventPlayer.show_icons = []
        eventPlayer.setHealingDealt(100)
        eventPlayer.stopForcingOutlineFor(getPlayers(getOppositeTeam(eventPlayer.getTeam())))
        returnValue_onEnd = true
        goto lbl_86
        goto lbl_87
        returnValue_onEnd = false
        goto lbl_88
        goto lbl_89
        returnValue_onEnd = false
        goto lbl_90
        goto lbl_91
        returnValue_onEnd = false
        goto lbl_92
        goto lbl_93
        eventPlayer.targets.high_sens_remains = 0
        returnValue_onEnd = true
        goto lbl_94
        goto lbl_95
        returnValue_onEnd = false
        goto lbl_96
        goto lbl_97
        eventPlayer.setPrimaryFireEnabled(true)
        eventPlayer.setSecondaryFireEnabled(true)
        eventPlayer.setKnockbackDealt(100)
        returnValue_onEnd = true
        goto lbl_98
        goto lbl_99
        destroyDummy(eventPlayer.decoy.getTeam(), eventPlayer.decoy.getSlot())
        eventPlayer.decoy = null
        eventPlayer.control_decoy = false
        returnValue_onEnd = true
        goto lbl_100
        goto lbl_101
        eventPlayer.targets.high_speed_remains = 0
        returnValue_onEnd = true
        goto lbl_102
        goto lbl_103
        eventPlayer.target = false
        eventPlayer.target.rider = null
        eventPlayer.detach()
        returnValue_onEnd = true
        goto lbl_104
        goto lbl_105
        eventPlayer.targets.strong_gravity_remains = 0
        returnValue_onEnd = true
        goto lbl_106
        goto lbl_107
        returnValue_onEnd = false
        goto lbl_108
        goto lbl_109
        destroyProgressBarHud(eventPlayer.progressbar_id)
        eventPlayer.target.stopThrottleInDirection()
        eventPlayer.setMoveSpeed(eventPlayer.movement_speed)
        eventPlayer.controlling = null
        eventPlayer.progressbar_id = null
        returnValue_onEnd = true
        goto lbl_110
        goto lbl_111
        returnValue_onEnd = false
        goto lbl_112
        goto lbl_113
        eventPlayer.setInvisibility(Invis.NONE)
        returnValue_onEnd = true
        goto lbl_114
        goto lbl_115
        returnValue_onEnd = false
        goto lbl_116
        goto lbl_117
        returnValue_onEnd = false
        lbl_0:
        lbl_1:
        lbl_2:
        lbl_3:
        lbl_4:
        lbl_5:
        lbl_6:
        lbl_7:
        lbl_8:
        lbl_9:
        lbl_10:
        lbl_11:
        lbl_12:
        lbl_13:
        lbl_14:
        lbl_15:
        lbl_16:
        lbl_17:
        lbl_18:
        lbl_19:
        lbl_20:
        lbl_21:
        lbl_22:
        lbl_23:
        lbl_24:
        lbl_25:
        lbl_26:
        lbl_27:
        lbl_28:
        lbl_29:
        lbl_30:
        lbl_31:
        lbl_32:
        lbl_33:
        lbl_34:
        lbl_35:
        lbl_36:
        lbl_37:
        lbl_38:
        lbl_39:
        lbl_40:
        lbl_41:
        lbl_42:
        lbl_43:
        lbl_44:
        lbl_45:
        lbl_46:
        lbl_47:
        lbl_48:
        lbl_49:
        lbl_50:
        lbl_51:
        lbl_52:
        lbl_53:
        lbl_54:
        lbl_55:
        lbl_56:
        lbl_57:
        lbl_58:
        lbl_59:
        lbl_60:
        lbl_61:
        lbl_62:
        lbl_63:
        lbl_64:
        lbl_65:
        lbl_66:
        lbl_67:
        lbl_68:
        lbl_69:
        lbl_70:
        lbl_71:
        lbl_72:
        lbl_73:
        lbl_74:
        lbl_75:
        lbl_76:
        lbl_77:
        lbl_78:
        lbl_79:
        lbl_80:
        lbl_81:
        lbl_82:
        lbl_83:
        lbl_84:
        lbl_85:
        lbl_86:
        lbl_87:
        lbl_88:
        lbl_89:
        lbl_90:
        lbl_91:
        lbl_92:
        lbl_93:
        lbl_94:
        lbl_95:
        lbl_96:
        lbl_97:
        lbl_98:
        lbl_99:
        lbl_100:
        lbl_101:
        lbl_102:
        lbl_103:
        lbl_104:
        lbl_105:
        lbl_106:
        lbl_107:
        lbl_108:
        lbl_109:
        lbl_110:
        lbl_111:
        lbl_112:
        lbl_113:
        lbl_114:
        lbl_115:
        lbl_116:
        lbl_117:
        eventPlayer.target = null
        eventPlayer.targets = null
        eventPlayer.target_pos = null
        eventPlayer.damage_dealt = 100
        eventPlayer.damage_received = 100
        eventPlayer.movement_speed = 100
        eventPlayer.max_health = 100
        eventPlayer.cooldown_count = 0


def roll_ability():
    @Name "roll ability"
    
    if eventPlayer.next_ability == null:
        eventPlayer.next_ability = random.choice(abilities)
    #eventPlayer.next_ability = _objectVariable_0.index(katrina)
    clear_huds()
    clear_ability()
    eventPlayer.ability = eventPlayer.next_ability
    eventPlayer.next_ability = null
    eventPlayer.title = _objectVariable_0[eventPlayer.ability]
    eventPlayer.desc = _objectVariable_1[eventPlayer.ability]
    if len(_objectVariable_8[eventPlayer.ability]) > 0:
        hero = random.choice(_objectVariable_8[eventPlayer.ability])
        eventPlayer.startForcingHero(hero)
    if _objectVariable_4[eventPlayer.ability] != null:
        eventPlayer.damage_dealt = _objectVariable_4[eventPlayer.ability]
        eventPlayer.setDamageDealt(_objectVariable_4[eventPlayer.ability])
    if _objectVariable_5[eventPlayer.ability] != null:
        eventPlayer.damage_received = _objectVariable_5[eventPlayer.ability]
        eventPlayer.setDamageDealt(_objectVariable_5[eventPlayer.ability])
    if _objectVariable_7[eventPlayer.ability] != null:
        eventPlayer.movement_speed = _objectVariable_7[eventPlayer.ability]
        eventPlayer.setMoveSpeed(_objectVariable_7[eventPlayer.ability])
    if _objectVariable_6[eventPlayer.ability] != null:
        eventPlayer.max_health = _objectVariable_6[eventPlayer.ability]
        eventPlayer.setMaxHealth(_objectVariable_6[eventPlayer.ability])
    eventPlayer.target = null
    eventPlayer.targets = null
    eventPlayer.allies = null
    eventPlayer.target_pos = null
    goto loc+[252, 0, 3, 6, 14, 17, 20, 24, 27, 30, 34, 37, 40, 43, 46, 49, 52, 55, 58, 67, 71, 74, 77, 89, 92, 95, 98, 101, 104, 111, 114, 117, 120, 123, 127, 130, 133, 136, 139, 144, 147, 150, 161, 177, 184, 192, 195, 198, 202, 205, 212, 218, 225, 228, 231, 234, 237, 242, 245, 248, 251][[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63].index(_classIndexes[eventPlayer.ability]) + 1]
    returnValue_onStart = false
    goto lbl_0
    goto lbl_1
    returnValue_onStart = false
    goto lbl_2
    goto lbl_3
    hudHeader(eventPlayer.rock_scissors_paper_players, "Q : Scissors / E : Rock / JUMP : Paper", HudPosition.TOP, 100, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.text_ids.append(getLastCreatedText())
    eventPlayer.targets = 0
    eventPlayer.rock_scissors_paper_players = null
    eventPlayer.rock_siccors_paper_status = 0
    returnValue_onStart = true
    goto lbl_4
    goto lbl_5
    returnValue_onStart = false
    goto lbl_6
    goto lbl_7
    returnValue_onStart = false
    goto lbl_8
    goto lbl_9
    eventPlayer.should_reroll = true
    returnValue_onStart = true
    goto lbl_10
    goto lbl_11
    returnValue_onStart = false
    goto lbl_12
    goto lbl_13
    returnValue_onStart = false
    goto lbl_14
    goto lbl_15
    eventPlayer.is_no_clip = false
    returnValue_onStart = true
    goto lbl_16
    goto lbl_17
    returnValue_onStart = false
    goto lbl_18
    goto lbl_19
    returnValue_onStart = false
    goto lbl_20
    goto lbl_21
    returnValue_onStart = false
    goto lbl_22
    goto lbl_23
    returnValue_onStart = false
    goto lbl_24
    goto lbl_25
    returnValue_onStart = false
    goto lbl_26
    goto lbl_27
    returnValue_onStart = false
    goto lbl_28
    goto lbl_29
    returnValue_onStart = false
    goto lbl_30
    goto lbl_31
    returnValue_onStart = false
    goto lbl_32
    goto lbl_33
    eventPlayer.is_showing_barieer = false
    eventPlayer.barieer_position = null
    createEffect(eventPlayer.targets, Effect.LIGHT_SHAFT, Color.PURPLE, eventPlayer.barieer_position, 7.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.effect_ids.append(getLastCreatedEntity())
    createEffect(eventPlayer.targets, Effect.ENERGY_SOUND, Color.PURPLE, eventPlayer.barieer_position, 40, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.effect_ids.append(getLastCreatedEntity())
    returnValue_onStart = false
    goto lbl_34
    goto lbl_35
    eventPlayer.setAbility2Enabled(false)
    returnValue_onStart = true
    goto lbl_36
    goto lbl_37
    returnValue_onStart = false
    goto lbl_38
    goto lbl_39
    returnValue_onStart = false
    goto lbl_40
    goto lbl_41
    eventPlayer.egg_position = null
    eventPlayer.show_text = null
    eventPlayer.allies = null
    hudHeader(eventPlayer.show_text, "{0} {1}".format(l"None", l"Die"), HudPosition.LEFT, 100, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.text_ids.append(getLastCreatedText())
    createEffect(eventPlayer.allies, Effect.SPHERE, Color.BLUE, eventPlayer.egg_position, 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.effect_ids.append(getLastCreatedEntity())
    createEffect(eventPlayer.targets, Effect.SPHERE, Color.RED, eventPlayer.egg_position, 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.effect_ids.append(getLastCreatedEntity())
    returnValue_onStart = true
    goto lbl_42
    goto lbl_43
    returnValue_onStart = false
    goto lbl_44
    goto lbl_45
    returnValue_onStart = true
    goto lbl_46
    goto lbl_47
    returnValue_onStart = false
    goto lbl_48
    goto lbl_49
    returnValue_onStart = false
    goto lbl_50
    goto lbl_51
    returnValue_onStart = false
    goto lbl_52
    goto lbl_53
    eventPlayer.trap_size = 0
    eventPlayer.trap_pos = null
    createEffect(getAllPlayers(), Effect.SPHERE, rgb(170, 255, 28), eventPlayer.trap_pos, eventPlayer.trap_size, EffectReeval.POSITION_AND_RADIUS)
    eventPlayer.effect_ids.append(getLastCreatedEntity())
    returnValue_onStart = true
    goto lbl_54
    goto lbl_55
    returnValue_onStart = false
    goto lbl_56
    goto lbl_57
    returnValue_onStart = false
    goto lbl_58
    goto lbl_59
    returnValue_onStart = false
    goto lbl_60
    goto lbl_61
    returnValue_onStart = false
    goto lbl_62
    goto lbl_63
    eventPlayer.setInvisibility(Invis.ENEMIES)
    returnValue_onStart = true
    goto lbl_64
    goto lbl_65
    returnValue_onStart = false
    goto lbl_66
    goto lbl_67
    returnValue_onStart = false
    goto lbl_68
    goto lbl_69
    returnValue_onStart = false
    goto lbl_70
    goto lbl_71
    returnValue_onStart = false
    goto lbl_72
    goto lbl_73
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setAbility2Enabled(false)
    returnValue_onStart = true
    goto lbl_74
    goto lbl_75
    returnValue_onStart = false
    goto lbl_76
    goto lbl_77
    returnValue_onStart = false
    goto lbl_78
    goto lbl_79
    returnValue_onStart = false
    goto lbl_80
    goto lbl_81
    hudHeader(eventPlayer, "{0}{1}".format("{0}{1}{2}".format("{0}{1}{2}".format("Health:", eventPlayer.max_health, "- Damage/Heal:"), eventPlayer.damage_dealt, "- Move speed:"), eventPlayer.movement_speed), HudPosition.LEFT, 10, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.text_ids.append(getLastCreatedText())
    wait(0.1)
    eventPlayer.max_health = random.randint(10, 200)
    eventPlayer.damage_dealt = random.randint(10, 200)
    eventPlayer.movement_speed = random.randint(20, 175)
    wait(0.1)
    eventPlayer.setMaxHealth(eventPlayer.max_health)
    eventPlayer.setDamageDealt(eventPlayer.damage_dealt)
    eventPlayer.setHealingDealt(eventPlayer.damage_dealt)
    eventPlayer.setMoveSpeed(eventPlayer.movement_speed)
    wait(0.1)
    heal(eventPlayer, null, 10000)
    returnValue_onStart = true
    goto lbl_82
    goto lbl_83
    eventPlayer.earthquake_power = 0
    eventPlayer.is_jumping = false
    hudSubheader(eventPlayer, "power {0}".format(eventPlayer.earthquake_power), HudPosition.LEFT, 10, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.text_ids.append(getLastCreatedText())
    returnValue_onStart = true
    goto lbl_84
    goto lbl_85
    eventPlayer.show_icons = getAllPlayers()
    createIcon(eventPlayer.show_icons, eventPlayer, Icon.EYE, IconReeval.VISIBILITY_AND_POSITION, Color.RED)
    eventPlayer.icon_ids.append(getLastCreatedEntity())
    eventPlayer.setHealingDealt(200)
    eventPlayer.startForcingOutlineFor(getPlayers(getOppositeTeam(eventPlayer.getTeam())), true, Color.RED, OutlineVisibility.ALWAYS)
    returnValue_onStart = true
    goto lbl_86
    goto lbl_87
    returnValue_onStart = false
    goto lbl_88
    goto lbl_89
    returnValue_onStart = false
    goto lbl_90
    goto lbl_91
    eventPlayer.pulling_target = null
    returnValue_onStart = false
    goto lbl_92
    goto lbl_93
    returnValue_onStart = false
    goto lbl_94
    goto lbl_95
    createEffect(eventPlayer.allies, Effect.SPHERE, Color.BLUE, eventPlayer.target_pos, 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.effect_ids.append(getLastCreatedEntity())
    createEffect(eventPlayer.targets, Effect.SPHERE, Color.PURPLE, eventPlayer.target_pos, 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.effect_ids.append(getLastCreatedEntity())
    returnValue_onStart = true
    goto lbl_96
    goto lbl_97
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setKnockbackDealt(800)
    returnValue_onStart = true
    goto lbl_98
    goto lbl_99
    eventPlayer.decoy = null
    eventPlayer.control_decoy = false
    hudHeader(eventPlayer, "Control: {0}".format(eventPlayer.control_decoy), HudPosition.LEFT, 10, Color.SKY_BLUE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.text_ids.append(getLastCreatedText())
    returnValue_onStart = false
    goto lbl_100
    goto lbl_101
    returnValue_onStart = false
    goto lbl_102
    goto lbl_103
    returnValue_onStart = false
    goto lbl_104
    goto lbl_105
    returnValue_onStart = false
    goto lbl_106
    goto lbl_107
    returnValue_onStart = false
    goto lbl_108
    goto lbl_109
    progressBarHud(eventPlayer.controlling, eventPlayer.mindcontrol_time / 7 * 100, "Mind Control", HudPosition.LEFT, 30, Color.PURPLE, Color.PURPLE, ProgressHudReeval.VISIBILITY_AND_VALUES, SpecVisibility.ALWAYS)
    eventPlayer.progressbar_id = getLastCreatedText()
    returnValue_onStart = true
    goto lbl_110
    goto lbl_111
    returnValue_onStart = false
    goto lbl_112
    goto lbl_113
    returnValue_onStart = false
    goto lbl_114
    goto lbl_115
    returnValue_onStart = false
    goto lbl_116
    goto lbl_117
    returnValue_onStart = false
    lbl_0:
    lbl_1:
    lbl_2:
    lbl_3:
    lbl_4:
    lbl_5:
    lbl_6:
    lbl_7:
    lbl_8:
    lbl_9:
    lbl_10:
    lbl_11:
    lbl_12:
    lbl_13:
    lbl_14:
    lbl_15:
    lbl_16:
    lbl_17:
    lbl_18:
    lbl_19:
    lbl_20:
    lbl_21:
    lbl_22:
    lbl_23:
    lbl_24:
    lbl_25:
    lbl_26:
    lbl_27:
    lbl_28:
    lbl_29:
    lbl_30:
    lbl_31:
    lbl_32:
    lbl_33:
    lbl_34:
    lbl_35:
    lbl_36:
    lbl_37:
    lbl_38:
    lbl_39:
    lbl_40:
    lbl_41:
    lbl_42:
    lbl_43:
    lbl_44:
    lbl_45:
    lbl_46:
    lbl_47:
    lbl_48:
    lbl_49:
    lbl_50:
    lbl_51:
    lbl_52:
    lbl_53:
    lbl_54:
    lbl_55:
    lbl_56:
    lbl_57:
    lbl_58:
    lbl_59:
    lbl_60:
    lbl_61:
    lbl_62:
    lbl_63:
    lbl_64:
    lbl_65:
    lbl_66:
    lbl_67:
    lbl_68:
    lbl_69:
    lbl_70:
    lbl_71:
    lbl_72:
    lbl_73:
    lbl_74:
    lbl_75:
    lbl_76:
    lbl_77:
    lbl_78:
    lbl_79:
    lbl_80:
    lbl_81:
    lbl_82:
    lbl_83:
    lbl_84:
    lbl_85:
    lbl_86:
    lbl_87:
    lbl_88:
    lbl_89:
    lbl_90:
    lbl_91:
    lbl_92:
    lbl_93:
    lbl_94:
    lbl_95:
    lbl_96:
    lbl_97:
    lbl_98:
    lbl_99:
    lbl_100:
    lbl_101:
    lbl_102:
    lbl_103:
    lbl_104:
    lbl_105:
    lbl_106:
    lbl_107:
    lbl_108:
    lbl_109:
    lbl_110:
    lbl_111:
    lbl_112:
    lbl_113:
    lbl_114:
    lbl_115:
    lbl_116:
    lbl_117:


rule "roll ability1":
    @Event eachPlayer
    @Condition eventPlayer.isDummy() == false
    @Condition isMatchBetweenRounds() == true
    
    roll_ability()


rule "roll ability2":
    @Event eachPlayer
    @Condition eventPlayer.isDummy() == false
    @Condition isMatchBetweenRounds() == false
    
    roll_ability()


rule "roll ability3":
    @Event eachPlayer
    @Condition eventPlayer.isDummy() == false
    
    roll_ability()


rule "roll ability when player died":
    @Event playerDied
    @Condition (reroll_when_internal_death or eventPlayer.should_reroll or attacker != eventPlayer) == true
    @Condition eventPlayer.isDummy() == false
    
    while eventPlayer.isDead():
        wait(0.5)
    roll_ability()


rule "on use":
    @Event eachPlayer
    @Condition eventPlayer.ability != null
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.cooldown_count <= 0
    @Condition eventPlayer.isAlive() == true
    
    goto loc+[305, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 10, 16, 24, 39, 49, 54, 61, 67, 74, 80, 89, 98, 103, 112, 117, 123, 127, 134, 142, 149, 162, 170, 177, 188, 195, 200, 222, 227, 232, 247, 252, 272, 277, 282, 291, 295, 299][[1, 2, 6, 8, 11, 13, 15, 16, 19, 21, 24, 29, 31, 33, 34, 38, 39, 41, 43, 44, 50, 58, 3, 4, 5, 7, 9, 10, 12, 14, 17, 18, 20, 22, 23, 25, 26, 27, 28, 30, 32, 35, 36, 37, 40, 42, 45, 46, 47, 48, 49, 51, 52, 53, 54, 55, 56, 57, 59, 60].index(_classIndexes[eventPlayer.ability]) + 1]
    return
    goto lbl_0
    __abortIf__(eventPlayer.rock_scissors_paper_players != null)
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    if eventPlayer.target.rock_scissors_paper_players != null:
        return
    eventPlayer.rock_siccors_paper_status = 0
    eventPlayer.rock_scissors_paper_players = [eventPlayer, eventPlayer.target]
    goto lbl_1
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    playEffect(getLivingPlayers(Team.ALL), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer.target, 3)
    bigMessage(eventPlayer.target, "{0} : are you tickling?".format(eventPlayer))
    goto lbl_2
    eventPlayer.acquireViewedTarget(eventPlayer.getTeam())
    if eventPlayer.target.getUltCharge() <= 1 or eventPlayer.target.isUsingUltimate():
        return
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.BUFF_EXPLOSION_SOUND, Color.BLUE, eventPlayer, 100)
    eventPlayer.target.setUltCharge(100)
    eventPlayer.target.forceButtonPress(Button.ULTIMATE)
    goto lbl_3
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.original_position = eventPlayer.getPosition()
    eventPlayer.original_direction = eventPlayer.getFacingDirection()
    eventPlayer.teleport(worldVector(vect([], [], -1.5), eventPlayer.target, Transform.ROTATION_AND_TRANSLATION))
    eventPlayer.setFacing(localVector(eventPlayer.target.getPosition(), eventPlayer, Transform.ROTATION_AND_TRANSLATION) + vect([], -0.5, []), Relativity.TO_PLAYER)
    eventPlayer.target.setStatusEffect(eventPlayer, Status.STUNNED, 0.5)
    wait(0.1)
    eventPlayer.setFacing(localVector(eventPlayer.target.getPosition(), eventPlayer, Transform.ROTATION_AND_TRANSLATION) + vect([], -0.5, []), Relativity.TO_PLAYER)
    wait(0.05)
    eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    wait(0.2)
    eventPlayer.teleport(eventPlayer.original_position)
    eventPlayer.setFacing(eventPlayer.original_direction, Relativity.TO_WORLD)
    goto lbl_4
    if not eventPlayer.is_no_clip:
        eventPlayer.disableEnvironmentCollision(false)
        eventPlayer.is_no_clip = true
        smallMessage(eventPlayer, "Enabled no-clip")
    else:
        eventPlayer.enableEnvironmentCollision()
        eventPlayer.is_no_clip = false
        smallMessage(eventPlayer, "Disabled no-clip")
    goto lbl_5
    eventPlayer.targets_3 = getPlayersOnHero(eventPlayer.getHero(), Team.ALL).exclude(eventPlayer)
    __abortIf__(len(eventPlayer.targets_3) == 0)
    kill(eventPlayer.targets_3, eventPlayer)
    bigMessage(eventPlayer.targets_3, "{0}{1}".format(eventPlayer, ": Only me is enough!"))
    goto lbl_6
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    playEffect(getLivingPlayers(Team.ALL), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer.target, 3)
    bigMessage(eventPlayer.target, "{0}{1}".format(eventPlayer, ": Fluffy fluff"))
    eventPlayer.target.is_floating = true
    goto lbl_7
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.target.setStatusEffect(eventPlayer, Status.ROOTED, 5)
    playEffect(getLivingPlayers(Team.ALL), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer.target, 3)
    bigMessage(eventPlayer.target, "{0}{1}".format(eventPlayer, ": Stop Yay!"))
    goto lbl_8
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    playEffect(getLivingPlayers(Team.ALL), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer.target, 3)
    bigMessage(eventPlayer.target, "{0}{1}".format(eventPlayer, "has presented you with a new god."))
    eventPlayer.target.is_spin_floating = eventPlayer
    goto lbl_9
    __abortIf__(eventPlayer.is_showing_barieer)
    eventPlayer.barieer_position = raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 1000, getAllPlayers(), eventPlayer, true).getHitPosition()
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.SKY_BLUE, eventPlayer.barieer_position, 15)
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.SKY_BLUE, eventPlayer.barieer_position, 50)
    eventPlayer.targets = getAllPlayers()
    goto lbl_10
    __abortIf__(eventPlayer.isInSpawnRoom())
    eventPlayer.targets_7 = getLivingPlayers(getOppositeTeam(eventPlayer.getTeam())).filter(lambda player: player.getHero() in targetHeros)
    __abortIf__(len(eventPlayer.targets_7) == 0)
    eventPlayer.target_0 = random.choice(eventPlayer.targets_7)
    eventPlayer.target_0.teleport(worldVector(Vector.FORWARD, eventPlayer, Transform.ROTATION_AND_TRANSLATION))
    eventPlayer.target_0.setStatusEffect(eventPlayer, Status.ASLEEP, 5)
    eventPlayer.target_0.setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 5)
    bigMessage(eventPlayer.target_0, "{0}{1}".format(eventPlayer, ": Oh, good night"))
    goto lbl_11
    __abortIf__(not eventPlayer.isOnGround() or eventPlayer.isInSpawnRoom())
    eventPlayer.egg_position = eventPlayer.getPosition()
    eventPlayer.targets = getPlayers(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.allies = getPlayers(eventPlayer.getTeam())
    eventPlayer.show_text = eventPlayer
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.GREEN, eventPlayer, 0.5)
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.GREEN, eventPlayer, 100)
    eventPlayer.setStatusEffect(null, Status.UNKILLABLE, 9999)
    goto lbl_12
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.target.setFacing(Vector.BACKWARD, Relativity.TO_PLAYER)
    bigMessage(eventPlayer.target, "{0} : Huh? behind you! haha".format(eventPlayer))
    goto lbl_13
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.tmp = eventPlayer.getEyePosition()
    eventPlayer.target.teleport(eventPlayer.tmp)
    eventPlayer.teleport(eventPlayer.target)
    playEffect(getLivingPlayers(Team.ALL), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer.target, 3)
    playEffect(getLivingPlayers(Team.ALL), DynamicEffect.GOOD_PICKUP_EFFECT, Color.YELLOW, eventPlayer, 3)
    smallMessage(eventPlayer.target, "Change location!")
    goto lbl_14
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.target.teleport(worldVector(Vector.FORWARD, eventPlayer, Transform.ROTATION_AND_TRANSLATION))
    bigMessage(eventPlayer.target, "{0} : come here".format(eventPlayer))
    goto lbl_15
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.target.setStatusEffect(eventPlayer, Status.ASLEEP, 4)
    playEffect(getLivingPlayers(Team.ALL), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer.target, 3)
    bigMessage(eventPlayer.target, "{0} : Good night hehe".format(eventPlayer))
    goto lbl_16
    __abortIf__(not eventPlayer.isOnGround())
    eventPlayer.trap_pos = worldVector(vect([], -0.2, 1.5), eventPlayer, Transform.ROTATION_AND_TRANSLATION)
    eventPlayer.trap_size = 1
    goto lbl_17
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.teleport(worldVector(Vector.BACKWARD, eventPlayer.target, Transform.ROTATION_AND_TRANSLATION))
    eventPlayer.setFacing(localVector(eventPlayer.target.getPosition(), eventPlayer, Transform.ROTATION_AND_TRANSLATION), Relativity.TO_PLAYER)
    eventPlayer.target.setStatusEffect(eventPlayer, Status.STUNNED, 1.5)
    bigMessage(eventPlayer.target, "{0} : really behind you".format(eventPlayer))
    goto lbl_18
    __abortIf__(eventPlayer.isInSpawnRoom())
    eventPlayer.targets_13 = getLivingPlayers(getOppositeTeam(eventPlayer.getTeam())).filter(lambda player: player.getHero() in targetHeros_0)
    __abortIf__(len(eventPlayer.targets_13) == 0)
    eventPlayer.target_1 = random.choice(eventPlayer.targets_13)
    eventPlayer.target_1.teleport(worldVector(Vector.FORWARD, eventPlayer, Transform.ROTATION_AND_TRANSLATION))
    eventPlayer.target_1.setStatusEffect(eventPlayer, Status.STUNNED, 4)
    bigMessage(eventPlayer.target_1, "{0} : Talon is bad".format(eventPlayer))
    goto lbl_19
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    playEffect(getLivingPlayers(Team.ALL), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer.target, 3)
    bigMessage(eventPlayer.target, "{0} : Rotating tornado!".format(eventPlayer))
    eventPlayer.target.is_rotating = true
    goto lbl_20
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    __abortIf__(eventPlayer.target.isInAir())
    eventPlayer.target.setUltCharge(eventPlayer.target.getUltCharge() + 10)
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.target.setStatusEffect(eventPlayer, Status.STUNNED, 0.001)
    wait(0.05)
    eventPlayer.target.communicate(Comms.EMOTE_UP)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    bigMessage(eventPlayer.target, "$45 sponsorship by {0}!".format(eventPlayer))
    playEffect(getLivingPlayers(Team.ALL), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer.target, 3)
    goto lbl_21
    __abortIf__(eventPlayer.isInSpawnRoom())
    eventPlayer.targets_16 = getLivingPlayers(getOppositeTeam(eventPlayer.getTeam())).filter(lambda player: player.getHero() in getSupportHeroes())
    __abortIf__(len(eventPlayer.targets_16) == 0)
    eventPlayer.target_2 = random.choice(eventPlayer.targets_16)
    eventPlayer.target_2.teleport(worldVector(Vector.FORWARD, eventPlayer, Transform.ROTATION_AND_TRANSLATION))
    eventPlayer.target_2.setStatusEffect(eventPlayer, Status.STUNNED, 4)
    bigMessage(eventPlayer.target_2, "Have fun!")
    goto lbl_22
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.target.setStatusEffect(eventPlayer, Status.ASLEEP, 5)
    eventPlayer.target.setStatusEffect(null, Status.PHASED_OUT, 5)
    bigMessage(eventPlayer.target, "{0} : Telekinesis".format(eventPlayer))
    goto lbl_23
    eventPlayer.max_health = random.randint(20, 225)
    eventPlayer.damage_dealt = random.randint(20, 225)
    eventPlayer.movement_speed = random.randint(20, 225)
    wait(0.1)
    eventPlayer.setMaxHealth(eventPlayer.max_health)
    eventPlayer.setDamageDealt(eventPlayer.damage_dealt)
    eventPlayer.setHealingDealt(eventPlayer.damage_dealt)
    eventPlayer.setMoveSpeed(eventPlayer.movement_speed)
    wait(0.1)
    heal(eventPlayer, null, 10000)
    goto lbl_24
    eventPlayer.acquireViewedTarget(Team.ALL)
    eventPlayer.random_size = random.randint(10, 260) / 100
    eventPlayer.target.startScalingSize(eventPlayer.random_size, false)
    eventPlayer.target.startModifyingVoicelinePitch(1 / eventPlayer.random_size, false)
    smallMessage(eventPlayer, eventPlayer.random_size)
    goto lbl_25
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.target.setAmmo(0, 0)
    eventPlayer.target.forceButtonPress(Button.RELOAD)
    goto lbl_26
    eventPlayer.acquireViewedTarget(eventPlayer.getTeam(), 100, LosCheck.OFF)
    eventPlayer.target_3 = eventPlayer.target
    eventPlayer.pos = eventPlayer.target_3.getPosition()
    eventPlayer.target_3.disableEnvironmentCollision(false)
    eventPlayer.target_3.setInvisibility(Invis.ALL)
    eventPlayer.target_3.setStatusEffect(eventPlayer, Status.ROOTED, 0)
    eventPlayer.target_3.teleport(worldVector(vect([], [], 0.5), eventPlayer, Transform.ROTATION_AND_TRANSLATION))
    wait(0.1)
    eventPlayer.target_3.setInvisibility(Invis.NONE)
    eventPlayer.target_3.clearStatusEffect(Status.ROOTED)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 9)
    eventPlayer.target_3.teleport(eventPlayer.pos)
    wait(0.1)
    if not eventPlayer.target_3.hasStatus(Status.ROOTED):
        eventPlayer.target_3.enableEnvironmentCollision()
    else:
        eventPlayer.pulling_target = eventPlayer.target_3
    goto lbl_27
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.target.high_sens_remains = 6
    eventPlayer.target.high_sens_speed = random.choice([10, 2000])
    eventPlayer.target.setAimSpeed(eventPlayer.target.high_sens_speed)
    goto lbl_28
    __abortIf__(not eventPlayer.isOnGround() or eventPlayer.isInSpawnRoom())
    eventPlayer.target_pos = eventPlayer.getPosition()
    eventPlayer.targets = getPlayers(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.allies = getPlayers(eventPlayer.getTeam())
    goto lbl_29
    __abortIf__(eventPlayer.decoy != null)
    if getNumberOfPlayers(eventPlayer.getTeam()) == 6:
        smallMessage(eventPlayer, "player slot full")
        return
    eventPlayer.target_pos = raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 300, getAllPlayers(), eventPlayer, true).getHitPosition()
    createDummy(eventPlayer.getHero(), eventPlayer.getTeam(), -1, eventPlayer, directionTowards(eventPlayer, eventPlayer.target_pos))
    eventPlayer.decoy = getLastCreatedEntity()
    eventPlayer.control_decoy = false
    eventPlayer.decoy_ready = false
    eventPlayer.decoy.is_decoy = eventPlayer
    eventPlayer.decoy.startForcingName("{0}".format(eventPlayer))
    eventPlayer.decoy.startForcingOutlineFor(eventPlayer, true, Color.LIME_GREEN, OutlineVisibility.ALWAYS)
    eventPlayer.decoy.startThrottleInDirection(eventPlayer.decoy.getFacingDirection(), 1, Relativity.TO_WORLD, Throttle.REPLACE_EXISTING, ThrottleReeval.NONE)
    goto lbl_30
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.target.high_speed_remains = 4
    eventPlayer.target.setMoveSpeed(1000)
    goto lbl_31
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    #pass
    pass #return
    goto lbl_32
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.target.strong_gravity_remains = 6
    eventPlayer.target.setGravity(500)
    goto lbl_33
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.targets_22 = eventPlayer.target
    eventPlayer.allies = getPlayers(eventPlayer.getTeam()).filter(lambda player: player != eventPlayer and player.isAlive())
    __abortIf__(len(eventPlayer.allies) == 0)
    eventPlayer.target = random.choice(eventPlayer.allies)
    eventPlayer.targets_22.setFacing(directionTowards(eventPlayer.targets_22, eventPlayer.target), Relativity.TO_WORLD)
    bigMessage(eventPlayer.targets_22, "{0} : look at {1}".format(eventPlayer, eventPlayer.target))
    goto lbl_34
    __abortIf__(eventPlayer.target != null)
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.controlling = eventPlayer
    eventPlayer.mindcontrol_time = 7
    #pass
    pass #return
    eventPlayer.setMoveSpeed(0)
    goto lbl_35
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.target.teleport(nearestWalkablePosition(eventPlayer.target.getPosition() + vect(random.randint(-10, 10), random.randint(-10, 10), random.randint(-10, 10))))
    goto lbl_36
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    goto lbl_37
    eventPlayer.acquireViewedTarget(getOppositeTeam(eventPlayer.getTeam()))
    eventPlayer.buttons = [Button.ABILITY_1, Button.ABILITY_2, Button.CROUCH, Button.INTERACT, Button.JUMP, Button.MELEE, Button.PRIMARY_FIRE, Button.RELOAD, Button.SECONDARY_FIRE, Button.ULTIMATE]
    eventPlayer.button = random.choice(eventPlayer.buttons)
    eventPlayer.target.forceButtonPress(eventPlayer.button)
    smallMessage(eventPlayer, eventPlayer.button)
    lbl_0:
    lbl_1:
    lbl_2:
    lbl_3:
    lbl_4:
    lbl_5:
    lbl_6:
    lbl_7:
    lbl_8:
    lbl_9:
    lbl_10:
    lbl_11:
    lbl_12:
    lbl_13:
    lbl_14:
    lbl_15:
    lbl_16:
    lbl_17:
    lbl_18:
    lbl_19:
    lbl_20:
    lbl_21:
    lbl_22:
    lbl_23:
    lbl_24:
    lbl_25:
    lbl_26:
    lbl_27:
    lbl_28:
    lbl_29:
    lbl_30:
    lbl_31:
    lbl_32:
    lbl_33:
    lbl_34:
    lbl_35:
    lbl_36:
    lbl_37:
    eventPlayer.cooldown_count = _objectVariable_2[eventPlayer.ability] * cooldown_multiplier


rule "[rock paper scissors] hack":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_scissors_paper_players != null
    
    eventPlayer.rock_scissors_paper_players.setStatusEffect(eventPlayer, Status.HACKED, 5)
    eventPlayer.rock_scissors_paper_players.setStatusEffect(eventPlayer, Status.ROOTED, 5)
    eventPlayer.rock_scissors_paper_players.setStatusEffect(eventPlayer, Status.PHASED_OUT, 8)
    wait(5)
    eventPlayer.rock_siccors_paper_status = 1


rule "[rock paper scissors] hand: scissors":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_scissors_paper_players != null
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true
    
    eventPlayer.rock_scissors_paper_hand = 1


rule "[rock paper scissors] hand: rock":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_scissors_paper_players != null
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2) == true
    
    eventPlayer.rock_scissors_paper_hand = 2


rule "[rock paper scissors] hand: paper":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_scissors_paper_players != null
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true
    
    eventPlayer.rock_scissors_paper_hand = 3


rule "[rock paper scissors] opponent hand: scissors":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_scissors_paper_players != null
    @Condition eventPlayer.target.isHoldingButton(Button.ULTIMATE) == true
    
    eventPlayer.rock_scissors_paper_opponent_han = 1


rule "[rock paper scissors] opponent hand: rock":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_scissors_paper_players != null
    @Condition eventPlayer.target.isHoldingButton(Button.ABILITY_2) == true
    
    eventPlayer.rock_scissors_paper_opponent_han = 2


rule "[rock paper scissors] opponent hand: paper":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_scissors_paper_players != null
    @Condition eventPlayer.target.isHoldingButton(Button.JUMP) == true
    
    eventPlayer.rock_scissors_paper_opponent_han = 3


rule "[rock paper scissors] result: opponent did not play":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_scissors_paper_players != null
    @Condition eventPlayer.rock_siccors_paper_status == 1
    @Condition eventPlayer.rock_scissors_paper_opponent_han == 0
    
    kill(eventPlayer.target, eventPlayer)
    smallMessage(eventPlayer.rock_scissors_paper_players, "[{0}] did not play.".format(eventPlayer.target))
    eventPlayer.rock_siccors_paper_status = 2


rule "[rock paper scissors] result: did not play":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_scissors_paper_players != null
    @Condition eventPlayer.rock_siccors_paper_status == 1
    @Condition eventPlayer.rock_scissors_paper_hand == 0
    
    kill(eventPlayer, eventPlayer.target)
    smallMessage(eventPlayer.rock_scissors_paper_players, "[{0}] did not play.".format(eventPlayer))
    eventPlayer.rock_siccors_paper_status = 2


rule "[rock paper scissors] result: paper vs ?":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_scissors_paper_players != null
    @Condition eventPlayer.rock_siccors_paper_status == 1
    @Condition eventPlayer.rock_scissors_paper_hand == 3
    
    if eventPlayer.rock_scissors_paper_opponent_han != 3:
        goto lbl_0
    smallMessage(eventPlayer.rock_scissors_paper_players, "[{0}] : Paper vs [{1}] Paper : Draw".format(eventPlayer, eventPlayer.target))
    eventPlayer.rock_siccors_paper_status = 2
    return
    lbl_0:
    if eventPlayer.rock_scissors_paper_opponent_han != 1:
        goto lbl_1
    kill(eventPlayer, eventPlayer.target)
    smallMessage(eventPlayer.rock_scissors_paper_players, "[{0}] : Paper vs [{1}] Scissors : [{1}] Wins".format(eventPlayer, eventPlayer.target))
    eventPlayer.rock_siccors_paper_status = 2
    return
    lbl_1:
    if eventPlayer.rock_scissors_paper_opponent_han != 2:
        goto lbl_2
    kill(eventPlayer.target, eventPlayer)
    smallMessage(eventPlayer.rock_scissors_paper_players, "[{0}] : Paper vs [{1}] Rock : [{0}] Wins".format(eventPlayer, eventPlayer.target))
    eventPlayer.rock_siccors_paper_status = 2
    return
    lbl_2:


rule "[rock paper scissors] result: scissors vs ?":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_scissors_paper_players != null
    @Condition eventPlayer.rock_siccors_paper_status == 1
    @Condition eventPlayer.rock_scissors_paper_hand == 1
    
    if eventPlayer.rock_scissors_paper_opponent_han != 1:
        goto lbl_0
    smallMessage(eventPlayer.rock_scissors_paper_players, "[{0}] : Scissors vs [{1}] Scissors : Draw".format(eventPlayer, eventPlayer.target))
    eventPlayer.rock_siccors_paper_status = 2
    return
    lbl_0:
    if eventPlayer.rock_scissors_paper_opponent_han != 2:
        goto lbl_1
    kill(eventPlayer, eventPlayer.target)
    smallMessage(eventPlayer.rock_scissors_paper_players, "[{0}] : Scissors vs [{1}] Rock : [{1}] Wins".format(eventPlayer, eventPlayer.target))
    eventPlayer.rock_siccors_paper_status = 2
    return
    lbl_1:
    if eventPlayer.rock_scissors_paper_opponent_han != 3:
        goto lbl_2
    kill(eventPlayer.target, eventPlayer)
    smallMessage(eventPlayer.rock_scissors_paper_players, "[{0}] : Scissors vs [{1}] Paper : [{0}] Wins".format(eventPlayer, eventPlayer.target))
    eventPlayer.rock_siccors_paper_status = 2
    return
    lbl_2:


rule "[rock paper scissors] result: rock vs ?":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_scissors_paper_players != null
    @Condition eventPlayer.rock_siccors_paper_status == 1
    @Condition eventPlayer.rock_scissors_paper_hand == 2
    
    if eventPlayer.rock_scissors_paper_opponent_han != 2:
        goto lbl_0
    smallMessage(eventPlayer.rock_scissors_paper_players, "[{0}] : rocks vs [{1}] rocks: draw".format(eventPlayer, eventPlayer.target))
    eventPlayer.rock_siccors_paper_status = 2
    return
    lbl_0:
    if eventPlayer.rock_scissors_paper_opponent_han != 3:
        goto lbl_1
    kill(eventPlayer, eventPlayer.target)
    smallMessage(eventPlayer.rock_scissors_paper_players, "[{0}]: rock vs [{1}] paper: [{1}] win".format(eventPlayer, eventPlayer.target))
    eventPlayer.rock_siccors_paper_status = 2
    return
    lbl_1:
    if eventPlayer.rock_scissors_paper_opponent_han != 1:
        goto lbl_2
    kill(eventPlayer.target, eventPlayer)
    smallMessage(eventPlayer.rock_scissors_paper_players, "[{0}]: Rock vs [{1}] Scissors: [{0}] win".format(eventPlayer, eventPlayer.target))
    eventPlayer.rock_siccors_paper_status = 2
    return
    lbl_2:


rule "[rock paper scissors] end":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == RockPaperScissors
    @Condition eventPlayer.rock_siccors_paper_status == 2
    
    eventPlayer.targets = 0
    eventPlayer.rock_scissors_paper_players = null
    eventPlayer.rock_siccors_paper_status = 0
    eventPlayer.rock_scissors_paper_hand = 0
    eventPlayer.rock_scissors_paper_opponent_han = 0


rule "[electric shock] stun":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == ElectricShock
    @Condition eventPlayer.target != null
    
    eventPlayer.target.setStatusEffect(eventPlayer, Status.STUNNED, 0.4)
    wait(0.3, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "[electric shock] end":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == ElectricShock
    @Condition eventPlayer.target != null
    
    wait(3, Wait.ABORT_WHEN_FALSE)
    eventPlayer.target = null


rule "[i just wan't do die] on death":
    @Event playerDied
    @Condition _objectVariable_0[eventPlayer.ability] == IJustWantToDie
    
    eventPlayer.target = random.choice(getLivingPlayers(getOppositeTeam(eventPlayer.getTeam())))
    eventPlayer.target.teleport(eventPlayer)
    eventPlayer.target.setStatusEffect(eventPlayer, Status.ROOTED, 3)
    bigMessage(eventPlayer.target, "{0}{1}".format(eventPlayer, ": Just don't die!"))


rule "[can't move] on damage dealt":
    @Event playerDealtDamage
    @Condition _objectVariable_0[eventPlayer.ability] == CantMove
    
    victim.setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 1.5)


rule "[repay] on damage taken":
    @Event playerTookDamage
    @Condition _objectVariable_0[eventPlayer.ability] == Repay
    
    damage(attacker, eventPlayer, eventDamage * 0.7)


rule "[i am speed] increase speed":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == IAmSpeed
    @Condition eventPlayer.isUsingAbility1() == true
    
    eventPlayer.setMoveSpeed(1000)
    eventPlayer.setDamageDealt(200)


rule "[i am speed] reset speed":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == IAmSpeed
    @Condition eventPlayer.isUsingAbility1() == false
    
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)


rule "[water ghost] on death":
    @Event playerDied
    @Condition _objectVariable_0[eventPlayer.ability] == WaterGhost
    
    kill(attacker, eventPlayer)


rule "[uncle pop hummer] on damage dealt":
    @Event playerDealtDamage
    @Condition _objectVariable_0[eventPlayer.ability] == UnclePopHummer
    @Condition eventPlayer.getCurrentWeapon() == 2
    @Condition eventPlayer.isFiringPrimaryFire() == true
    
    victim.setStatusEffect(eventPlayer, Status.STUNNED, 1.5)


rule "[spin float up] start":
    @Event eachPlayer
    @Condition eventPlayer.is_spin_floating != null
    
    eventPlayer.startAcceleration(Vector.UP, 30, 60, Relativity.TO_PLAYER, AccelReeval.NONE)
    eventPlayer.startFacing(Vector.LEFT, 1000, Relativity.TO_PLAYER)
    wait(2)
    eventPlayer.stopFacing()
    wait(3)
    eventPlayer.stopAcceleration()


rule "[spin float up] finish":
    @Event eachPlayer
    @Condition eventPlayer.is_spin_floating != null
    @Condition eventPlayer.isOnGround() == true
    
    wait(0.16, Wait.ABORT_WHEN_FALSE)
    damage(eventPlayer, eventPlayer.is_spin_floating, 30)
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 2)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.RED, eventPlayer, 100)
    eventPlayer.is_spin_floating = null


rule "[its time to sleep] on final b\zlow":
    @Event playerDealtFinalBlow
    @Condition _objectVariable_0[eventPlayer.ability] == ItsTimeToSleep
    
    getAllPlayers().setStatusEffect(eventPlayer, Status.ASLEEP, 3)
    smallMessage(getAllPlayers(), "It's all bedtime")


rule "[laying egg] return to egg":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == LayingEgg
    @Condition eventPlayer.getHealth() == 1
    @Condition eventPlayer.egg_position != null
    
    eventPlayer.teleport(eventPlayer.egg_position)
    eventPlayer.setStatusEffect(null, Status.INVINCIBLE, 1)
    heal(eventPlayer, null, 1000)
    wait(1, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()
    eventPlayer.setStatusEffect(null, Status.UNKILLABLE, 9999)
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.GREEN, eventPlayer, 0.3)
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.GREEN, eventPlayer, 100)


rule "[laying egg] egg broken":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == LayingEgg
    @Condition eventPlayer.egg_position != null
    
    wait(1)
    if getPlayersInRadius(eventPlayer.egg_position, 1, getOppositeTeam(eventPlayer.getTeam())).exclude(eventPlayer) != []:
        playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, eventPlayer.egg_position, 120)
        eventPlayer.egg_position = null
        eventPlayer.targets = null
        eventPlayer.allies = null
        eventPlayer.show_text = null
        eventPlayer.cooldown_count = 15 * cooldown_multiplier
        eventPlayer.clearStatusEffect(Status.UNKILLABLE)
        bigMessage(eventPlayer, "The egg is broken!")
    if ruleCondition:
        loop()


rule "[why hit me] change camera angle":
    @Event playerTookDamage
    @Condition _objectVariable_0[eventPlayer.ability] == WhyHitMe
    
    attacker.setFacing(vect(random.uniform(-1, 1), random.uniform(-1, 1), random.uniform(-1, 1)), Relativity.TO_PLAYER)


rule "[jumping trap] jump":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == JumpingTrap
    @Condition eventPlayer.trap_pos != null
    
    eventPlayer.targets = getPlayersInRadius(eventPlayer.trap_pos, 1, Team.ALL)
    for eventPlayer.targetIndex in range(len(eventPlayer.targets)):
        eventPlayer.target = eventPlayer.targets[eventPlayer.targetIndex]
        eventPlayer.target.setStatusEffect(eventPlayer, Status.STUNNED, 0.01)
        eventPlayer.target.applyImpulse(directionTowards(eventPlayer.trap_pos, eventPlayer.target), 45, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.LIME_GREEN, eventPlayer.trap_pos, 1)
        playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, eventPlayer.trap_pos, 80)
    wait()
    if ruleCondition:
        loop()


rule "[sleepy ninja] stun":
    @Event playerDealtDamage
    @Condition _objectVariable_0[eventPlayer.ability] == SleepyNinja
    
    victim.setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 0.8)


rule "[slap] increase damage":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == Slap
    @Condition eventPlayer.isUsingAbility1() == true
    
    eventPlayer.setDamageDealt(1000)


rule "[slap] reset damage":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == Slap
    @Condition eventPlayer.isUsingAbility1() == false
    
    eventPlayer.setDamageDealt(100)


rule "[one shot] on damage":
    @Event playerDealtDamage
    @Condition _objectVariable_0[eventPlayer.ability] == OneShot
    @Condition eventPlayer != victim
    @Condition eventPlayer.cooldown_count <= 0
    
    if random.randint(1, 100) > 50:
        return
    bigMessage(victim, "{0}: get rekt!".format(eventPlayer))
    kill(victim, attacker)
    eventPlayer.cooldown_count = 12 * cooldown_multiplier
    attacker.setStatusEffect(victim, Status.STUNNED, 6)


rule "[rotating tornado] rotate":
    @Event eachPlayer
    @Condition eventPlayer.is_rotating == true
    
    eventPlayer.startFacing(Vector.LEFT, 1000, Relativity.TO_PLAYER)
    wait(3)
    eventPlayer.stopFacing()
    eventPlayer.is_rotating = false


rule "[lack of concentration] on attack":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == LackOfConcentration
    @Condition eventPlayer.isFiringPrimaryFire() == true
    
    eventPlayer.setFacing(vect(random.uniform(-1, 1), random.uniform(-1, 1), random.uniform(-1, 1)), Relativity.TO_PLAYER)
    wait(0.38)
    if ruleCondition:
        loop()


rule "[flush bang] on attack":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == FlushBang
    @Condition eventPlayer.isFiringPrimaryFire() == true
    
    eventPlayer.target_pos = raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 1000, getPlayers(getOppositeTeam(eventPlayer.getTeam())), eventPlayer, true).getHitPosition()
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.YELLOW, eventPlayer.target_pos, 1)
    eventPlayer.target = getPlayersInRadius(eventPlayer.target_pos, 3, getOppositeTeam(eventPlayer.getTeam()), LosCheck.SURFACES_AND_ENEMY_BARRIERS)
    eventPlayer.target.setStatusEffect(eventPlayer, Status.STUNNED, 0.25)


rule "[telekinesis] stun":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == Telekinesis
    @Condition eventPlayer.target != null
    
    eventPlayer.target.applyImpulse(vect(random.uniform(-1, 1), [], random.uniform(-1, 1)), 100, Relativity.TO_PLAYER, Impulse.INCORPORATE_CONTRARY_MOTION)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "[telekinesis] end":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == Telekinesis
    @Condition eventPlayer.target != null
    
    wait(2.6, Wait.ABORT_WHEN_FALSE)
    eventPlayer.target = null


rule "[earthquake] reset power":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == Earthquake
    @Condition eventPlayer.is_jumping == false
    @Condition (not eventPlayer.isHoldingButton(Button.CROUCH) or eventPlayer.isInAir()) == true
    
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.earthquake_power = 0


rule "[earthquake] increase power":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == Earthquake
    @Condition eventPlayer.cooldown_count <= 0
    @Condition eventPlayer.isHoldingButton(Button.CROUCH) == true
    @Condition eventPlayer.isOnGround() == true
    @Condition eventPlayer.earthquake_power < 10
    
    eventPlayer.earthquake_power++
    wait(0.15)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.AQUA, eventPlayer, 2)
    playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.AQUA, eventPlayer, 200)
    if ruleCondition:
        loop()


rule "[earthquake] jump":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == Earthquake
    @Condition eventPlayer.cooldown_count <= 0
    @Condition eventPlayer.earthquake_power >= 1
    @Condition eventPlayer.isHoldingButton(Button.CROUCH) == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.isOnGround() == true
    
    eventPlayer.applyImpulse(Vector.UP, eventPlayer.earthquake_power * 2, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    eventPlayer.setStatusEffect(null, Status.HACKED, 9999)
    eventPlayer.cooldown_count = 8 * cooldown_multiplier
    wait(0.15)
    eventPlayer.is_jumping = true


rule "[earthquake] earthquake":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == Earthquake
    @Condition eventPlayer.is_jumping == true
    @Condition eventPlayer.isOnGround() == true
    
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.WHITE, eventPlayer, eventPlayer.earthquake_power * 1.25)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.YELLOW, eventPlayer, eventPlayer.earthquake_power * 5000)
    eventPlayer.is_jumping = false
    damage(getPlayersInRadius(eventPlayer.getPosition(), eventPlayer.earthquake_power * 1.25, getOppositeTeam(eventPlayer.getTeam())), eventPlayer, eventPlayer.earthquake_power * 10)
    (getPlayersInRadius(eventPlayer.getPosition(), eventPlayer.earthquake_power * 1.25, getOppositeTeam(eventPlayer.getTeam()))).applyImpulse(Vector.UP, eventPlayer.earthquake_power, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    (getPlayersInRadius(eventPlayer.getPosition(), eventPlayer.earthquake_power * 1.25, getOppositeTeam(eventPlayer.getTeam()))).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, eventPlayer.earthquake_power * 0.2)
    wait(0.1)
    eventPlayer.earthquake_power = 0
    eventPlayer.clearStatusEffect(Status.HACKED)


rule "[lifesaver] finish ability":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == LifeSaver
    @Condition eventPlayer.pulling_target != null
    @Condition eventPlayer.pulling_target.hasStatus(Status.ROOTED) == false
    
    wait(0.1)
    eventPlayer.pulling_target.enableEnvironmentCollision()
    wait(0.1)
    eventPlayer.pulling_target.teleport(worldVector(vect([], [], 0.5), eventPlayer, Transform.ROTATION_AND_TRANSLATION))
    eventPlayer.pulling_target = null


rule "[High sensitivity] countdown":
    @Event eachPlayer
    @Condition eventPlayer.high_sens_remains > 0
    
    wait(2, Wait.ABORT_WHEN_FALSE)
    eventPlayer.high_sens_remains -= 2
    if eventPlayer.high_sens_remains > 0:
        if eventPlayer.high_sens_speed == 10:
            eventPlayer.high_sens_speed = 2000
        else:
            eventPlayer.high_sens_speed = 10
        eventPlayer.setAimSpeed(eventPlayer.high_sens_speed)
    if ruleCondition:
        loop()


rule "[High sensitivity] end":
    @Event eachPlayer
    @Condition eventPlayer.high_sens_remains == 0
    
    eventPlayer.high_sens_speed = 100
    eventPlayer.setAimSpeed(100)


rule "[You are speed] countdown":
    @Event eachPlayer
    @Condition eventPlayer.high_speed_remains > 0
    
    eventPlayer.high_speed_remains--
    wait(1, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "[You are speed] end":
    @Event eachPlayer
    @Condition eventPlayer.high_speed_remains == 0
    
    eventPlayer.setMoveSpeed(eventPlayer.movement_speed)


rule "[Strong Gravity] countdown":
    @Event eachPlayer
    @Condition eventPlayer.strong_gravity_remains > 0
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.strong_gravity_remains--
    if ruleCondition:
        loop()


rule "[Strong Gravity] end":
    @Event eachPlayer
    @Condition eventPlayer.strong_gravity_remains <= 0
    
    eventPlayer.setGravity(100)


rule "[mind control] on start":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.mindcontrol_time > 0
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.mindcontrol_time--
    if ruleCondition:
        loop()


rule "[mind control] on death":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition (eventPlayer.mindcontrol_time == 0 or eventPlayer.isDead() or eventPlayer.target.isDead()) == true
    
    eventPlayer.target.stopFacing()
    eventPlayer.target.stopThrottleInDirection()
    eventPlayer.target.stopThrottleInDirection()
    eventPlayer.target.stopForcingButton(Button.PRIMARY_FIRE)
    eventPlayer.target.stopForcingButton(Button.SECONDARY_FIRE)
    eventPlayer.target.stopForcingButton(Button.ABILITY_1)
    eventPlayer.target.stopForcingButton(Button.ABILITY_2)
    eventPlayer.target.stopForcingButton(Button.ULTIMATE)
    eventPlayer.target.stopForcingButton(Button.CROUCH)
    eventPlayer.target.stopForcingButton(Button.MELEE)
    eventPlayer.target = null
    eventPlayer.controlling = false
    eventPlayer.setMoveSpeed(eventPlayer.movement_speed)
    eventPlayer.stopCamera()
    destroyEffect(eventPlayer.control_beam)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.allowButton(Button.ULTIMATE)
    eventPlayer.allowButton(Button.JUMP)
    eventPlayer.allowButton(Button.CROUCH)
    eventPlayer.allowButton(Button.MELEE)
    eventPlayer.cooldown_count = 30 * cooldown_multiplier


rule "[mind control] start jump":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true
    
    eventPlayer.target.startForcingButton(Button.JUMP)


rule "[mind control] stop jump":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition (eventPlayer.isDead() or eventPlayer.target.isDead() or not eventPlayer.isHoldingButton(Button.JUMP)) == true
    
    eventPlayer.target.stopForcingButton(Button.JUMP)


rule "[mind control] start crouch":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.CROUCH) == true
    
    eventPlayer.target.startForcingButton(Button.CROUCH)


rule "[mind control] stop crouch":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition (eventPlayer.isDead() or eventPlayer.target.isDead() or not eventPlayer.isHoldingButton(Button.CROUCH)) == true
    
    eventPlayer.target.stopForcingButton(Button.CROUCH)


rule "[mind control] throttle":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.mindcontrol_time > 0
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    
    bigMessage(eventPlayer.target, "{0} has taken control of you".format(eventPlayer))
    eventPlayer.startCamera(raycast(eventPlayer.target.getEyePosition(), eventPlayer.target.getEyePosition() + worldVector(vect(0, 0.4, 0.3), eventPlayer.target, Transform.ROTATION) + eventPlayer.target.getFacingDirection() * -2.5, null, null, false).getHitPosition(), eventPlayer.target + eventPlayer.target.getFacingDirection() * 1000, 40)
    eventPlayer.target.startFacing(eventPlayer.getFacingDirection(), 500)
    eventPlayer.target.startThrottleInDirection(eventPlayer.getThrottle(), magnitude(eventPlayer.getThrottle()), Relativity.TO_PLAYER)
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.getEyePosition(), eventPlayer.target.getEyePosition(), Color.PURPLE, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.control_beam = getLastCreatedEntity()
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.disallowButton(Button.ULTIMATE)
    eventPlayer.disallowButton(Button.CROUCH)
    eventPlayer.disallowButton(Button.JUMP)
    eventPlayer.disallowButton(Button.MELEE)


rule "[mind control] start firing primary":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    
    eventPlayer.target.startForcingButton(Button.PRIMARY_FIRE)


rule "[mind control] stop firing primary":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == false
    
    eventPlayer.target.stopForcingButton(Button.PRIMARY_FIRE)


rule "[mind control] start firing sec":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    
    eventPlayer.target.startForcingButton(Button.SECONDARY_FIRE)


rule "[mind control] stop firing sec":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == false
    
    eventPlayer.target.stopForcingButton(Button.SECONDARY_FIRE)


rule "[mind control] start ability1":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_1) == true
    
    eventPlayer.target.startForcingButton(Button.ABILITY_1)


rule "[mind control] stop ability 1":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_1) == false
    
    eventPlayer.target.stopForcingButton(Button.ABILITY_1)


rule "[mind control] start ability2":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2) == true
    
    eventPlayer.target.startForcingButton(Button.ABILITY_2)


rule "[mind control] stop ability 2":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2) == false
    
    eventPlayer.target.stopForcingButton(Button.ABILITY_2)


rule "[mind control] ultimate":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true
    
    eventPlayer.target.startForcingButton(Button.ULTIMATE)


rule "[mind control] stop ultimate":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == false
    
    eventPlayer.target.stopForcingButton(Button.ULTIMATE)


rule "[mind control] start melee":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.MELEE) == true
    
    eventPlayer.target.startForcingButton(Button.MELEE)


rule "[mind control] stop melee":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.MELEE) == false
    
    eventPlayer.target.stopForcingButton(Button.MELEE)


rule "[mind control] in air":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MindControl
    @Condition eventPlayer.target != null
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.target.isAlive() == true
    @Condition eventPlayer.target.isInAir() == true
    
    eventPlayer.target.setStatusEffect(eventPlayer, Status.STUNNED, 0.01)


rule "[taxi] attach system":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == Taxi
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    eventPlayer.acquireViewedTarget(Team.ALL)
    eventPlayer.horse_target = eventPlayer.target
    if eventPlayer.ishobbihorsing == false:
        eventPlayer.ishobbihorsing = true
        eventPlayer.attachTo(eventPlayer.horse_target, vect(0, 2, 0))
    elif eventPlayer.ishobbihorsing == true:
        eventPlayer.ishobbihorsing = false
        eventPlayer.detach()


rule "[taxi] horse is dead":
    @Event eachPlayer
    @Condition eventPlayer.horse_target.isDead() == true
    
    eventPlayer.horse_target = null
    eventPlayer.ishobbihorsing = false
    eventPlayer.detach()


rule "[helicopter] flying":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == Helicopter
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition (eventPlayer.hasStatus(Status.HACKED) or eventPlayer.hasStatus(Status.ASLEEP) or eventPlayer.hasStatus(Status.STUNNED) or eventPlayer.hasStatus(Status.KNOCKED_DOWN)) == false
    
    if eventPlayer.Is_Flying == false:
        eventPlayer.Is_Flying = true
    else:
        eventPlayer.Is_Flying = false


rule "[helicopter] controls":
    @Event eachPlayer
    @Condition eventPlayer.Is_Flying == true
    
    eventPlayer.setGravity(0)
    eventPlayer.flyspeed = 0
    while eventPlayer.Is_Flying:
        if not eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
            eventPlayer.flyspeed = 10
        else:
            eventPlayer.flyspeed = 1
        if eventPlayer.getThrottle() != vect([], [], []):
            eventPlayer.applyImpulse(crossProduct(Vector.UP, normalize(worldVector(eventPlayer.getThrottle(), eventPlayer, Transform.ROTATION))), 0.001, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            eventPlayer.applyImpulse(crossProduct(Vector.DOWN, normalize(worldVector(eventPlayer.getThrottle(), eventPlayer, Transform.ROTATION))), 0.001, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            eventPlayer.applyImpulse(directionTowards(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + normalize(worldVector(eventPlayer.getThrottle(), eventPlayer, Transform.ROTATION))), eventPlayer.flyspeed, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        if eventPlayer.getThrottle() != vect([], [], []) and eventPlayer.isHoldingButton(Button.CROUCH) == false:
            eventPlayer.applyImpulse(Vector.UP, 0.001, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        if eventPlayer.getThrottle() != vect([], [], []) and eventPlayer.isHoldingButton(Button.JUMP) == false:
            eventPlayer.applyImpulse(Vector.DOWN, 0.001, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        if eventPlayer.getThrottle() == vect([], [], []) and eventPlayer.getSpeed() > 0.01:
            eventPlayer.applyImpulse(Vector.LEFT, 0.001, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            eventPlayer.applyImpulse(Vector.RIGHT, 0.001, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            eventPlayer.applyImpulse(Vector.FORWARD, 0.001, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            eventPlayer.applyImpulse(Vector.BACKWARD, 0.001, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        if eventPlayer.getThrottle() == vect([], [], []) and eventPlayer.getSpeed() > 0.01 and eventPlayer.isHoldingButton(Button.CROUCH) == false:
            eventPlayer.applyImpulse(Vector.UP, 0.001, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        if eventPlayer.getThrottle() == vect([], [], []) and eventPlayer.getSpeed() > 0.01 and eventPlayer.isHoldingButton(Button.JUMP) == false:
            eventPlayer.applyImpulse(Vector.DOWN, 0.001, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        if eventPlayer.isHoldingButton(Button.JUMP):
            eventPlayer.applyImpulse(Vector.UP, eventPlayer.flyspeed, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        elif eventPlayer.isHoldingButton(Button.CROUCH):
            eventPlayer.applyImpulse(Vector.DOWN, eventPlayer.flyspeed, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait()
    eventPlayer.setGravity(100)


rule "[helicopter] balance":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == Helicopter
    @Condition (eventPlayer.hasStatus(Status.HACKED) or eventPlayer.hasStatus(Status.ASLEEP) or eventPlayer.hasStatus(Status.STUNNED) or eventPlayer.hasStatus(Status.KNOCKED_DOWN)) == true
    
    eventPlayer.Is_Flying = false


rule "[widow is ugly] widow charge chase":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MadWidow
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    
    wait(0.25)
    if not ruleCondition:
        return
    chaseAtRate(eventPlayer.widow_charge, 120, 120, ChaseRateReeval.NONE)


rule "[widow is ugly] widow charge reset":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MadWidow
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == false
    
    stopChasingVariable(eventPlayer.widow_charge)
    eventPlayer.widow_charge = 12


rule "[widow is ugly] widow balance":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MadWidow
    @Condition getSpawnedTeammatesExcludingSelf(eventPlayer) != []
    @Condition distance(eventPlayer, getClosestSpawnedTeammate(eventPlayer)) <= 3
    @Condition getClosestSpawnedTeammate(eventPlayer).isHoldingButton(Button.MELEE) == true
    @Condition isInLoS(getClosestSpawnedTeammate(eventPlayer).getEyePosition(), eventPlayer, BarrierLos.BLOCKED_BY_ENEMY_BARRIERS) == true
    
    damage(eventPlayer, getClosestSpawnedTeammate(eventPlayer), 1000)


rule "[widow is ugly] message":
    @Event playerDealtFinalBlow
    @Condition _objectVariable_0[eventPlayer.ability] == MadWidow
    @Condition victim.getTeam() == eventPlayer.getTeam()
    
    bigMessage(getPlayers(eventPlayer.getTeam()).exclude(eventPlayer), "{0} Your teammate widowmaker is trying to kill you ALL!  Punish her with melee! ".format(iconString(Icon.WARNING)))


rule "[widow is ugly] widow projectile":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MadWidow
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    
    createProjectile(Projectile.ORB, eventPlayer, null, null, Relativity.TO_WORLD, ModifyHealth.DAMAGE, eventPlayer.getTeam(), eventPlayer.widow_charge, 2.5, 0, DynamicEffect.BAD_EXPLOSION, DynamicEffect.RING_EXPLOSION_SOUND, 0, 1000, 1)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)


rule "[widow is ugly] disallow":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == MadWidow
    
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)


rule "[hole] placing start/stop":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.isInSpawnRoom() == false
    @Condition _objectVariable_0[eventPlayer.ability] == Hole
    @Condition eventPlayer.cooldown_count <= 0
    
    if eventPlayer.hole_placing == false:
        eventPlayer.hole_placing = true
        eventPlayer.hole_placed = false
    else:
        eventPlayer.hole_placing = false
        eventPlayer.hole_placed = false


rule "[hole] hole placing":
    @Event eachPlayer
    @Condition eventPlayer.hole_placing == true
    @Condition _objectVariable_0[eventPlayer.ability] == Hole
    
    eventPlayer.hole = raycast(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 12, null, eventPlayer, false).getHitPosition(), raycast(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 9, null, eventPlayer, false).getHitPosition(), Vector.DOWN * 1000, null, eventPlayer, false).getHitPosition(), null, eventPlayer, false).getHitPosition()
    playEffect(eventPlayer, DynamicEffect.RING_EXPLOSION, Color.WHITE, eventPlayer.hole, 5)
    wait(0.25)
    if ruleCondition:
        loop()


rule "[hole] primary fire to place":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.hole_placing == true
    @Condition eventPlayer.isInSpawnRoom() == false
    @Condition _objectVariable_0[eventPlayer.ability] == Hole
    
    eventPlayer.hole_placing = false
    eventPlayer.hole_placed = true
    eventPlayer.cooldown_count = 20
    smallMessage(eventPlayer, "hole placed")
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)


rule "[hole] placed effect":
    @Event eachPlayer
    @Condition eventPlayer.hole_placed == true
    @Condition _objectVariable_0[eventPlayer.ability] == Hole
    
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.SKY_BLUE, eventPlayer.hole, 5)
    wait(0.25)
    if ruleCondition:
        loop()


rule "[hole] placing message":
    @Event eachPlayer
    @Condition eventPlayer.hole_placing == true
    @Condition _objectVariable_0[eventPlayer.ability] == Hole
    
    smallMessage(eventPlayer, "{0} to place".format(inputBindingString(Button.PRIMARY_FIRE)))
    wait(3)
    if ruleCondition:
        loop()


rule "[hole] hole swallow":
    @Event eachPlayer
    @Condition eventPlayer.hole_placed == true
    @Condition _objectVariable_0[eventPlayer.ability] == Hole
    
    eventPlayer.targets = getPlayersInRadius(eventPlayer.hole, 2, Team.ALL, LosCheck.SURFACES)
    for eventPlayer.targetIndex in range(len(eventPlayer.targets)):
        eventPlayer.target = eventPlayer.targets[eventPlayer.targetIndex]
        if eventPlayer.target.isInSpawnRoom():
            goto lbl_0
        eventPlayer.target.disableEnvironmentCollision(true)
        eventPlayer.target.setStatusEffect(eventPlayer, Status.STUNNED, 0.01)
        eventPlayer.target.applyImpulse(Vector.DOWN, 4, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(0.25)
        eventPlayer.target.enableEnvironmentCollision()
        lbl_0:
    wait()
    if ruleCondition:
        loop()


rule "[portal gun] portals placing start/stop/delete":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition _objectVariable_0[eventPlayer.ability] == PortalGun
    @Condition eventPlayer.isInSpawnRoom() == false
    
    if eventPlayer.tp_placing == false:
        eventPlayer.tp_placing = true
        eventPlayer.disallowButton(Button.PRIMARY_FIRE)
        eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    else:
        eventPlayer.allowButton(Button.PRIMARY_FIRE)
        eventPlayer.allowButton(Button.SECONDARY_FIRE)
        eventPlayer.tp_placing = false
    wait(1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.tp1 = null
    eventPlayer.tp2 = null
    eventPlayer.tp_placing = false
    smallMessage(eventPlayer, "portals deleted")
    playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)


rule "[portal gun] tp1 placing":
    @Event eachPlayer
    @Condition eventPlayer.tp_placing == true
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition _objectVariable_0[eventPlayer.ability] == PortalGun
    @Condition eventPlayer.cooldown_count <= 0
    
    eventPlayer.tmp = raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 100, null, eventPlayer, false).getHitPosition()
    if eventPlayer.tmp.y < 20:
        eventPlayer.tp1 = eventPlayer.tmp
        playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
        eventPlayer.cooldown_count = 5
    else:
        smallMessage(eventPlayer, "Too much bro")


rule "[portal gun] tp1 effect":
    @Event eachPlayer
    @Condition eventPlayer.tp1 != null
    @Condition _objectVariable_0[eventPlayer.ability] == PortalGun
    
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.ORANGE, eventPlayer.tp1, 1)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.ORANGE, eventPlayer.tp1, 2)
    wait(0.5)
    if ruleCondition:
        loop()


rule "[portal gun] tp1 teleporting":
    @Event eachPlayer
    @Condition eventPlayer.tp1 != null
    @Condition eventPlayer.tp2 != null
    @Condition _objectVariable_0[eventPlayer.ability] == PortalGun
    
    eventPlayer.tp1_targets = getPlayersInRadius(eventPlayer.tp1, 2, Team.ALL, LosCheck.SURFACES)
    for eventPlayer.targetIndex in range(len(eventPlayer.tp1_targets)):
        eventPlayer.tp1_target = eventPlayer.tp1_targets[eventPlayer.targetIndex]
        if eventPlayer.tp1_target.teleported > 0:
            eventPlayer.tp1_target = null
        if eventPlayer.tp1_target != null:
            eventPlayer.tp1_target.setStatusEffect(eventPlayer, Status.STUNNED, 0.01)
            if not ruleCondition:
                return
            eventPlayer.tp1_target.disableEnvironmentCollision(true)
            eventPlayer.tp1_target.applyImpulse(Vector.DOWN, 5, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer.tp1, 70)
            playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer.tp2, 70)
            wait(0.25)
            eventPlayer.tp1_target.teleported = 2
            eventPlayer.tp1_target.teleport(eventPlayer.tp2)
            eventPlayer.tp1_target.enableEnvironmentCollision()
            eventPlayer.tp1_target.applyImpulse(Vector.UP, 5, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            eventPlayer.tp1_target = null
    wait()
    if ruleCondition:
        loop()


rule "[portal gun] tp2 placing":
    @Event eachPlayer
    @Condition eventPlayer.tp_placing == true
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    @Condition _objectVariable_0[eventPlayer.ability] == PortalGun
    @Condition eventPlayer.cooldown_count <= 0
    
    eventPlayer.tmp = raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 100, null, eventPlayer, false).getHitPosition()
    if eventPlayer.tmp.y < 20:
        eventPlayer.tp2 = eventPlayer.tmp
        playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
        eventPlayer.cooldown_count = 5
    else:
        smallMessage(eventPlayer, "Too much bro")


rule "[portal gun] tp2 teleporting":
    @Event eachPlayer
    @Condition eventPlayer.tp2 != null
    @Condition eventPlayer.tp1 != null
    @Condition _objectVariable_0[eventPlayer.ability] == PortalGun
    
    eventPlayer.targets = getPlayersInRadius(eventPlayer.tp2, 2, Team.ALL, LosCheck.SURFACES)
    for eventPlayer.targetIndex in range(len(eventPlayer.targets)):
        eventPlayer.target = eventPlayer.targets[eventPlayer.targetIndex]
        if eventPlayer.target.teleported > 0:
            eventPlayer.target = null
        if eventPlayer.target != null:
            eventPlayer.target.setStatusEffect(eventPlayer, Status.STUNNED, 0.01)
            if not ruleCondition:
                return
            eventPlayer.target.disableEnvironmentCollision(true)
            eventPlayer.target.applyImpulse(Vector.DOWN, 5, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer.tp1, 70)
            playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer.tp2, 70)
            wait(0.25)
            eventPlayer.target.teleported = 2
            eventPlayer.target.teleport(eventPlayer.tp1)
            eventPlayer.target.enableEnvironmentCollision()
            eventPlayer.target.applyImpulse(Vector.UP, 5, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            eventPlayer.target = null
    wait()
    if ruleCondition:
        loop()


rule "[portal gun] tp2 effect":
    @Event eachPlayer
    @Condition eventPlayer.tp2 != null
    @Condition _objectVariable_0[eventPlayer.ability] == PortalGun
    
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.PURPLE, eventPlayer.tp2, 1)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.PURPLE, eventPlayer.tp2, 2)
    wait(0.5)
    if ruleCondition:
        loop()


rule "[portal gun] tp placing message":
    @Event eachPlayer
    @Condition eventPlayer.tp_placing == true
    @Condition _objectVariable_0[eventPlayer.ability] == PortalGun
    
    if not (eventPlayer.tp1 and eventPlayer.tp2):
        smallMessage(eventPlayer, "{0} to place 1st portal {1} to place 2nd portal".format(inputBindingString(Button.PRIMARY_FIRE), inputBindingString(Button.SECONDARY_FIRE)))
    wait(3)
    if ruleCondition:
        loop()


rule "[portal gun] tick":
    @Event eachPlayer
    @Condition eventPlayer.teleported > 0
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.teleported--
    if ruleCondition:
        loop()


rule "hold [reload] to self-reset":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    @Condition eventPlayer.isAlive() == true
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    bigMessage(eventPlayer, "Continue holding {0} to self-reset".format(inputBindingString(Button.RELOAD)))
    if eventPlayer.getHero() == Hero.DVA:
        eventPlayer.egg_position = null
        eventPlayer.targets = null
        eventPlayer.allies = null
        eventPlayer.show_text = null
        eventPlayer.clearStatusEffect(Status.UNKILLABLE)
        kill(eventPlayer)
        wait(1)
        kill(eventPlayer)
    else:
        eventPlayer.egg_position = null
        eventPlayer.targets = null
        eventPlayer.allies = null
        eventPlayer.show_text = null
        eventPlayer.clearStatusEffect(Status.UNKILLABLE)
        kill(eventPlayer)


rule "[increased kb]":
    @Event eachPlayer
    
    getAllPlayers().setKnockbackDealt(400)


rule "[nuke]":
    @Event eachPlayer
    @Condition eventPlayer.getHero() == Hero.DVA
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition _objectVariable_0[eventPlayer.ability] == NUKE
    
    probabilityNuke = random.randint(1, 100)
    if probabilityNuke <= 40:
        eventPlayer.previous_pos = eventPlayer.getPosition()
        eventPlayer.setAbility1Enabled(false)
        eventPlayer.setAbility2Enabled(false)
        eventPlayer.setUltEnabled(false)
        destroyAllHudTexts()
        hudHeader(getAllPlayers(), "ATTENTION", HudPosition.TOP, 3, Color.RED, HudReeval.VISIBILITY_AND_STRING)
        wait(2)
        hudHeader(getAllPlayers(), "{0} HAS CONFIRMED A NUCLEAR DETONATION".format(eventPlayer), HudPosition.TOP, 3, Color.RED, HudReeval.VISIBILITY_AND_STRING)
        wait(2)
        destroyAllHudTexts()
        hudHeader(getAllPlayers(), "NUCLEAR DETONATION IN: 3", HudPosition.TOP, 3, Color.RED, HudReeval.VISIBILITY_AND_STRING)
        wait(1)
        destroyAllHudTexts()
        hudHeader(getAllPlayers(), "NUCLEAR DETONATION IN: 2", HudPosition.TOP, 2, Color.RED, HudReeval.VISIBILITY_AND_STRING)
        wait(1)
        destroyAllHudTexts()
        hudHeader(getAllPlayers(), "NUCLEAR DETONATION IN: 1", HudPosition.TOP, 1, Color.RED, HudReeval.VISIBILITY_AND_STRING)
        wait(1)
        destroyAllHudTexts()
        bigMessage(getAllPlayers(), "{0} HAS DESTROYED THE WORLD!".format(eventPlayer))
        getAllPlayers().teleport(vect(0, 750, 0))
        getAllPlayers().communicate(Comms.GOODBYE)
        wait(3)
        nukeBlastRadius = 1
        createEffect(getAllPlayers(), Effect.SPHERE, Color.RED, eventPlayer.previous_pos, nukeBlastRadius, EffectReeval.VISIBILITY)
        if ruleCondition:
            loop()
        while nukeBlastRadius < 300:
            wait(0.05)
            nukeBlastRadius += 10
            createEffect(getAllPlayers(), Effect.CLOUD, Color.GREEN, eventPlayer.previous_pos, nukeBlastRadius * 1, EffectReeval.VISIBILITY)
            createEffect(getAllPlayers(), Effect.SPHERE, Color.RED, eventPlayer.previous_pos, nukeBlastRadius * 2, EffectReeval.VISIBILITY)
            playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.RED, eventPlayer, nukeBlastRadius * 50)
            playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.BLACK, eventPlayer, nukeBlastRadius * 25)
        kill(getAllPlayers())
        wait(1)
        kill(getAllPlayers())
        getAllPlayers().disableRespawn()
        wait(2)
        restartMatch()
    else:
        kill(eventPlayer)
        hudHeader(eventPlayer, "â™¥ UNLUCKY {0} â™¥".format(eventPlayer), HudPosition.TOP, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
        wait(2)
        destroyHudText(getLastCreatedText())


rule "[mega mauga]":
    @Event eachPlayer
    @Condition eventPlayer.Is_Flying == true
    @Condition eventPlayer.isHoldingButton(Button.CROUCH) == true
    @Condition _objectVariable_0[eventPlayer.ability] == megaMauga
    
    eventPlayer.applyImpulse(Vector.UP, 10, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    wait(0.02)
    if ruleCondition:
        loop()


rule "[mega mauga]":
    @Event eachPlayer
    @Condition eventPlayer.getHero() == Hero.MAUGA
    @Condition _objectVariable_0[eventPlayer.ability] == megaMauga
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.cooldown_count <= 0
    @Condition eventPlayer.isMegaMauga == false
    
    eventPlayer.isMegaMauga = true
    eventPlayer.previous_pos = eventPlayer.getPosition()
    createEffect(eventPlayer, Effect.SPARKLES, Color.YELLOW, eventPlayer, 30, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.setDamageDealt(1000)
    if eventPlayer.Is_Flying == false:
        eventPlayer.Is_Flying = true
    eventPlayer.startScalingSize(10)
    eventPlayer.setMaxHealth(1000)
    wait()
    heal(eventPlayer, null, 99999)
    eventPlayer.startModifyingVoicelinePitch(0.5)
    smallMessage(eventPlayer, "10x MAUGA")
    eventPlayer.disablePlayerCollision()
    eventPlayer.disableEnvironmentCollision(true)


rule "[mega mauga]":
    @Event eachPlayer
    @Condition eventPlayer.isMegaMauga == true
    
    wait(30)
    if eventPlayer.isMegaMauga == true:
        eventPlayer.teleport(nearestWalkablePosition(eventPlayer.previous_pos))
        eventPlayer.startScalingSize(1)
        wait(0.25)
        eventPlayer.enableEnvironmentCollision()
        eventPlayer.enablePlayerCollision()
        eventPlayer.startModifyingVoicelinePitch(1)
        eventPlayer.setDamageDealt(100)
        if eventPlayer.Is_Flying == true:
            eventPlayer.Is_Flying = false
        eventPlayer.setMaxHealth(50)
        eventPlayer.cooldown_count = 60 * cooldown_multiplier
        destroyAllEffects()
        eventPlayer.isMegaMauga = false


rule "[mega mauga]":
    @Event playerDied
    @Condition eventPlayer.isMegaMauga == true
    
    eventPlayer.startScalingSize(1)
    eventPlayer.enableEnvironmentCollision()
    eventPlayer.enablePlayerCollision()
    eventPlayer.startModifyingVoicelinePitch(1)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setMaxHealth(50)
    destroyAllEffects()
    eventPlayer.isMegaMauga = false


rule "[mega mauga]":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == megaMauga
    
    eventPlayer.setAbility1Enabled(false)


rule "[mega mauga]":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] != megaMauga
    
    eventPlayer.setAbility1Enabled(true)


rule "[stolen soul]":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == StolenSoul
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    eventPlayer.target = (getPlayersInRadius(eventPlayer.getEyePosition(), 200, Team.ALL, LosCheck.SURFACES_AND_ALL_BARRIERS).filter(lambda player: player != eventPlayer and player.isAlive()))[0]
    if eventPlayer.target == null:
        return
    eventPlayer.next_ability = eventPlayer.target.ability
    eventPlayer.respawn_position = eventPlayer.getPosition()
    kill(eventPlayer.target)
    kill(eventPlayer)


rule "[stolen soul]":
    @Event eachPlayer
    @Condition eventPlayer.respawn_position != null
    
    waitUntil(eventPlayer.isAlive(), 99999)
    wait()
    eventPlayer.teleport(eventPlayer.respawn_position)
    eventPlayer.respawn_position = null


rule "[katrina]":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == katrina
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    eventPlayer.target = (getPlayersInRadius(eventPlayer.getEyePosition(), 200, Team.ALL, LosCheck.SURFACES_AND_ALL_BARRIERS).filter(lambda player: player != eventPlayer and player.isAlive()))[0]
    if eventPlayer.target == null:
        return
    if random.randint(1, 100) <= 50:
        bigMessage(eventPlayer, "Soul stolen.")
        if eventPlayer.target == null:
            return
        kill(eventPlayer.target)
    elif random.randint(1, 100) <= 50:
        kill(eventPlayer)
        bigMessage(eventPlayer, "Fate turns on you.")


rule "[katrina]":
    @Event eachPlayer
    @Condition _objectVariable_0[eventPlayer.ability] == katrina
    @Condition eventPlayer.isUsingUltimate() == false
    
    eventPlayer.setUltCharge(100)
    wait(0.1)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
