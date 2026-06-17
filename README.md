# Window-Ratio-Lock
Outil AutoHotkey pour verrouiller et ajuster automatiquement les fenêtres en 16:9 ou 21:9.
Idéal pour les écrans ultra-wide (21:9 ou 32:9) pour contrôler précisément la taille et la position de leurs fenêtres.

Fonctionnalités :
Verrouillage de fenêtre :
   - Verrouille une fenêtre active pour qu’elle reste toujours à la même taille et position.
   - Utile pour éviter les redimensionnements accidentels (ex : jeux, logiciels de streaming).

Changement de ratio en un clic :
   - Passe de **16:9 (Full HD)** à **21:9 (Ultra-Wide)** et vice versa.
   - Dimensions prédéfinies :
     - **16:9** : 3840x2160 (positionnée à X=1920).
     - **21:9** : 5120x2160 (positionnée à X=1280).

Mode fenêtré forcé :
   - Force une fenêtre verrouillée à **rester en mode fenêtré** (désactive le plein écran).

Raccourcis clavier personnalisables :
   Raccourci          | Action                          |
 |--------------------|---------------------------------|
 | `Ctrl + Alt + P`    | Activer/Désactiver le script    |
 | `Ctrl + Alt + R`    | Changer de ratio (16:9 ↔ 21:9)  |
 | `Ctrl + Alt + L`    | Verrouiller/Déverrouiller une fenêtre |
 | `Ctrl + Alt + F`    | Forcer le mode fenêtré         |
 | `Ctrl + Alt + Q`    | Quitter le script               |

Notifications visuelles :
   - Affichage d’un **ToolTip** (info-bulle) pour confirmer les actions (ex : "Ratio changé: 21:9").

Technologies & Prérequis
- Langage : [AutoHotkey v1.1+](https://www.autohotkey.com/) *(script léger, sans installation lourde)*.
- Compatibilité : Windows 10/11.
- Matériel : Écran 21:9 ou 32:9 recommandé (mais fonctionnel sur tout écran).
