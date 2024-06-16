# Marbles of Darkness 2

![Marbles of Darkness 2 banner](https://img.itch.zone/aW1nLzEzOTI1NzA1LnBuZw==/original/4wYBzb.png)

## About
A larger black cloud is threatening to cover the mainland in darkness. Once again you have to surround it with light to get rid of it.

Marbles of Darkness 2 is a marble shooter puzzle game sequel that includes:

- A shooter rolling along the bottom for a change
- Adventure level packs with variable lengths and difficulties
- 6 different maps
- Practice and Endless modes to freely play on the maps
- 18 powerups to help you created by cascades
- Game files editable by the player

![Marbles of Darkness 2 screenshot](https://img.itch.zone/aW1hZ2UvMjM1MDg0Ny8xNTg5NzAyMi5qcGc=/original/c%2FDkg9.jpg)

## Game instructions
The game is played using a mouse. A stream of coloured orbs is rolling along a marked path. The shooter points at the mouse cursor and shoots the orb displayed on it when clicked. The shot orb joins the stream of rolling orbs upon contact. By making a group of 3 or more orbs with the same colour, they will be removed. Clearing orbs increases the bar at the bottom. Fill it completely to stop any more streams from appearing. Clear all orbs to complete the level. You must not let any orbs reach the hole at the end of the path!

When removing any orbs leaves matching ones on both ends of the gap, they will be pulled together and, if a large enough group forms, remove themselves. This is called a combo. A chain is when you create a successful match with multiple shot orbs in a row. Chains and combos award power-ups that can be picked up to help with clearing the rest of the orbs.

You can use the right mouse button to switch the shot orb colour with the secondary colour displayed on the shooter. The game can be paused by pressing Spacebar, clicking outside the game window or by pressing the Menu button on the bottom-right corner.

## Engine
Made with GameMaker Studio 2. Version 2022.6.1.26 was used for support of building for legacy 32-bit systems. This or later version of GM is required.

![GameMaker Studio 2](https://duckduckgo.com/i/19488ac7.png)

Latest release https://gamemaker.io/en/download

Older versions https://gms.yoyogames.com/ReleaseNotes.html

Compiling for Linux (guide) https://help.gamemaker.io/hc/en-us/articles/235186168-Setting-Up-For-Ubuntu

## Modding
Marbles of Darkness 2 is intended to be simply modifiable. Images, sounds, paths and some configurations are editable and loaded separately.

A path editor for the game, currently in experimental state, is also included in this project.

Note that as modded assets and functions are not part of the vanilla game, they may not be as well tested and are more prone to having bugs or crashes.

## Issues
Sometimes when the shot orb reaches the stream of orbs, the stream might suddenly jump forwards or backwards. This was the most noticeable on some paths when under the Reverse effect. The last one was fixed in the 1.1 update. It may still be possible for the stream to jump forwards by a significant amount under really precise circumstances. In a similar way, the shot orb colliding with the stream while the other orbs are matching might result in the game crashing. An attempt was made to fix it in 1.1...

When using an imported font, it may be misplaced. For example, the default font, if loaded externally, is too much at the bottom. This is why the default font remains built-in in the data of the game as a failsafe and used by default.

![Font placement issue](https://pbs.twimg.com/media/GQMIzgsWYAErVN4?format=png&name=small)

When compiling for Linux, an option is to create a zip file containing all the assets and an executable. This does not seem to work, as running the executable does nothing. Running it through a terminal reveals an error about a missing library, "libcrypto.so.1.0.0". Hence, the only supported format for Linux is the AppImage, which puts everything in a single file. It seems to work, but does not allow editing.
> error while loading shared libraries: libcrypto.so.1.0.0: cannot open shared object file: No such file or directory

The path editor does not fully work on Linux, as opening the file manager through GameMaker is not supported on that platform. Saving the path can be gotten around by copying the path data into the clipboard. This would still leave it unable to load paths or backgrounds.

The path editor attempts to draw every pixel of the path, which is affected by zoom. If you were to zoom out and create a really long path, then zoom in, the editor would completely freeze from the sheer length of the displayed path.
