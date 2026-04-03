/*
RPG FFA starter:
- Gain XP from eliminations
- Level up for permanent stat points
- Spend points at one of 3 upgrade nodes by standing near it and holding a button
- Enemy NPC dummy waves for a clear PvE loop

Map suggestion:
Use Ilios Control (or a similarly open 2v2 map). Adjust all vectors if needed.
*/

globalvar xpBasePerKill = 90
globalvar xpScalePerLevel = 100
globalvar xpPerWave = 0
globalvar waveTimer = 22
globalvar waveIndex = 0

globalvar upgradeNodes = [vect(12, 0, 12), vect(-12, 0, 12), vect(0, 0, -12)]
globalvar waveSpawnNodes = [vect(8, 0, 0), vect(0, 0, 8), vect(-8, 0, 0), vect(0, 0, -8)]

playervar xp
playervar level
playervar points
playervar offense
playervar defense
playervar mobility
playervar levelPulse
playervar needsReapply

rule "rpg setup":
    for i in range(3):
        createInWorldText(getAllPlayers(), ["Primary Fire -> Offense Node", "Secondary Fire -> Defense Node", "Ability 1 -> Mobility Node"][i], upgradeNodes[i] + Vector.UP * 1.5, 2, Clip.NONE, WorldTextReeval.VISIBILITY, Color.SKY_BLUE, SpecVisibility.ALWAYS)

rule "player init profile":
    @Event eachPlayer
    @Condition eventPlayer.level == 0
    eventPlayer.xp = 0
    eventPlayer.level = 1
    eventPlayer.points = 0
    eventPlayer.offense = 0
    eventPlayer.defense = 0
    eventPlayer.mobility = 0
    eventPlayer.needsReapply = true
    eventPlayer.levelPulse = 0
    applyRPGStats()

rule "reapply pending stats":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned()
    @Condition eventPlayer.needsReapply == true
    applyRPGStats()
    eventPlayer.needsReapply = false

def applyRPGStats():
    @Name "Apply RPG Stats"
    eventPlayer.setMaxHealth(100 + eventPlayer.defense * 25)
    eventPlayer.setMoveSpeed(100 + eventPlayer.mobility * 8)
    eventPlayer.setDamageDealt(100 + eventPlayer.offense * 12)
    eventPlayer.setDamageReceived(100 - eventPlayer.defense * 3)

rule "show level":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned()
    bigMessage(eventPlayer, "Lv {}  XP {} / {}   Points {}".format(eventPlayer.level, eventPlayer.xp, xpScalePerLevel * eventPlayer.level, eventPlayer.points))

rule "kill xp and level":
    @Event playerEarnedElimination
    attacker.xp += xpBasePerKill
    while attacker.xp >= xpScalePerLevel * attacker.level:
        attacker.xp -= xpScalePerLevel * attacker.level
        attacker.level += 1
        attacker.points += 1
        attacker.levelPulse = 1
        attacker.needsReapply = true
        smallMessage(attacker, "LEVEL UP! Lv {} (+1 point)".format(attacker.level))

rule "defend against duplicate level alerts":
    @Event eachPlayer
    @Condition eventPlayer.levelPulse == 1
    do:
        eventPlayer.levelPulse = 0
        wait(0.1)
    while RULE_CONDITION

rule "offense upgrade":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned()
    @Condition eventPlayer.points > 0
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)
    @Condition distance(eventPlayer, upgradeNodes[0]) < 1.8
    eventPlayer.points -= 1
    eventPlayer.offense += 1
    eventPlayer.needsReapply = true
    smallMessage(eventPlayer, "Offense +1")

rule "defense upgrade":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned()
    @Condition eventPlayer.points > 0
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)
    @Condition distance(eventPlayer, upgradeNodes[1]) < 1.8
    eventPlayer.points -= 1
    eventPlayer.defense += 1
    eventPlayer.needsReapply = true
    smallMessage(eventPlayer, "Defense +1")

rule "mobility upgrade":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned()
    @Condition eventPlayer.points > 0
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_1)
    @Condition distance(eventPlayer, upgradeNodes[2]) < 1.8
    eventPlayer.points -= 1
    eventPlayer.mobility += 1
    eventPlayer.needsReapply = true
    smallMessage(eventPlayer, "Mobility +1")

rule "dummy waves":
    do:
        wait(waveTimer)
        waveIndex++
        xpPerWave = waveIndex

        for wavePosIndex in range(4):
            if wavePosIndex <= xpPerWave:
                createDummy(Hero.JUNKRAT, Team.ALL, -1, waveSpawnNodes[wavePosIndex], Vector.UP)

        if waveIndex % 3 == 0:
            bigMessage(getAllPlayers(), "WAVE {}".format(waveIndex + 1))
        wait(0.1)
    while RULE_CONDITION
