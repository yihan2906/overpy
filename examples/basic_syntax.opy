# basic_syntax.opy
# This file shows core OverPy syntax in a compact, valid form.

globalvar phase = 1
globalvar wave = 1
globalvar spawnPoints = [vect(0, 0, 0), vect(10, 0, 0), vect(-10, 0, 0)]
globalvar waveBonuses = [1, 2, 3]
globalvar totalBonus = 0

enum GamePhase:
    WAITING
    RUNNING
    FINISHED

playervar score
playervar lives
playervar isAlive

# Subroutine (no parameters, no return values in Workshop)
def initPlayer():
    @Name "Initialize player stats"
    eventPlayer.score = 0
    eventPlayer.lives = 3
    eventPlayer.isAlive = true

def awardPoint():
    @Name "Award one score point"
    eventPlayer.score += 1

rule "Match setup":
    @Event global
    phase = GamePhase.WAITING
    wave = 1

rule "Per-player init":
    @Event eachPlayer
    initPlayer()

rule "Game running loop":
    @Event eachPlayer
    if eventPlayer.isAlive:
        awardPoint()
        if eventPlayer.score >= 5:
            eventPlayer.lives -= 1
            eventPlayer.score = 0
            eventPlayer.isAlive = eventPlayer.lives > 0

rule "Wave array demo":
    @Event global
    totalBonus = 0
    for A in range(len(waveBonuses)):
        totalBonus += waveBonuses[A]

    switch wave:
        case 1:
            phase = GamePhase.RUNNING
        case 2:
            phase = GamePhase.WAITING
        default:
            phase = GamePhase.FINISHED

    wait(1)
