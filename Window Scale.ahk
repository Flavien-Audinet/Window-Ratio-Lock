#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; --- CONFIGURATION ---
intervalle := 300
raccourciActivation := "^!p"   ; Ctrl+Alt+P pour activer/désactiver
raccourciChangerRatio := "^!r"  ; Ctrl+Alt+R pour changer le ratio
raccourciVerrouiller := "^!l"   ; Ctrl+Alt+L pour verrouiller/déverrouiller
raccourciForcerFenetre := "^!f"  ; Ctrl+Alt+F pour forcer le mode fenêtré
raccourciQuitter := "^!q"       ; Ctrl+Alt+Q pour quitter

; --- Ratios disponibles ---
ratios := ["16:9", "21:9"]
ratioActuel := 1
fenetreVerrouillee := 0  ; ID de la fenêtre verrouillée (0 = aucune)

; --- Variables ---
estActif := false

; --- Raccourcis ---
Hotkey, %raccourciActivation%, basculerActivation
Hotkey, %raccourciChangerRatio%, changerRatio
Hotkey, %raccourciVerrouiller%, toggleVerrouillage
Hotkey, %raccourciForcerFenetre%, forcerModeFenetre
Hotkey, %raccourciQuitter%, quitterScript
return

basculerActivation:
    estActif := !estActif
    if (estActif) {
        msg := "Mode ACTIF - Ratio: " . ratios[ratioActuel] . "`n"
        msg .= "Ctrl+Alt+L: Verrouiller/Déverrouiller`n"
        msg .= "Ctrl+Alt+F: Forcer mode fenêtré`n"
        msg .= "Ctrl+Alt+R: Changer ratio`n"
        msg .= "Ctrl+Alt+Q: Quitter"
        ToolTip % msg
        SetTimer, corrigerFenetreActive, %intervalle%
    } else {
        ToolTip Mode INACTIF
        SetTimer, corrigerFenetreActive, Off
    }
    SetTimer, RemoveToolTip, 3000
return

toggleVerrouillage:
    if (fenetreVerrouillee = 0) {
        fenetreVerrouillee := WinExist("A")
        if (fenetreVerrouillee = 0) {
            ToolTip Aucune fenêtre trouvée !
            SetTimer, RemoveToolTip, 2000
            return
        }
        WinGetTitle, titre, ahk_id %fenetreVerrouillee%
        ToolTip % "Fenêtre verrouillée: " . titre
    } else {
        ToolTip Fenêtre déverrouillée
        fenetreVerrouillee := 0
    }
    SetTimer, RemoveToolTip, 2000
return

forcerModeFenetre:
    if (fenetreVerrouillee = 0) {
        ToolTip Aucune fenêtre verrouillée !
        SetTimer, RemoveToolTip, 2000
        return
    }
    WinSet, Style, -0xC00000, ahk_id %fenetreVerrouillee%
    if (ratioActuel = 1) {
        largeurCible := 3840
        positionX := 1920
    } else {
        largeurCible := 5120
        positionX := 1280
    }
    hauteurCible := 2160
    WinMove, ahk_id %fenetreVerrouillee%,, positionX, positionY, largeurCible, hauteurCible
    ToolTip Mode fenêtré forcé
    SetTimer, RemoveToolTip, 2000
return

changerRatio:
    ratioActuel := ratioActuel = 1 ? 2 : 1
    ToolTip % "Ratio changé: " . ratios[ratioActuel]
    SetTimer, RemoveToolTip, 2000
return

corrigerFenetreActive:
    if (fenetreVerrouillee = 0)
        return

    if (ratioActuel = 1) {
        largeurCible := 3840
        positionX := 1920
    } else {
        largeurCible := 5120
        positionX := 1280
    }
    hauteurCible := 2160

    WinGetPos, actX, actY, actL, actH, ahk_id %fenetreVerrouillee%
    if (actL != largeurCible || actH != hauteurCible) {
        WinMove, ahk_id %fenetreVerrouillee%,, positionX, positionY, largeurCible, hauteurCible
    }
return

RemoveToolTip:
    ToolTip
return

; --- Fin de tâche propre ---
quitterScript:
    ToolTip, Fermeture du script...
    SetTimer, corrigerFenetreActive, Off
    Sleep, 500
    ExitApp
return
