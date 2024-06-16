MoD2 Path Editor v0.1

GENERAL

"MoD2 Path Editor" is an experimental tool that accompanies Marbles of Darkness 2, a marble shooter game. It is useful for modding the game. Its purpose is to make path creation easier by providing a graphical interface and visualizing the paths.

This manual covers just the path editor. For general MoD2 modding help, check the help file in the assets of the base game.

The editor runs on the same engine as the game for the best support of the paths themselves and their files. As the engine, GameMaker, is meant for games and not productive work, there are drawbacks on file management. The graphical file manager and clipboard are not supported on Linux, leaving it unable to save or load any files. Hence, the program does not work well enough on that platform and cannot be exported to that.



USER INTERFACE

The majority of the window is used to display the game room and the path. The default visible game area is visualized with a grey grid. In GameMaker, and therefore MoD, paths are made out of points it follows through in smooth curves.

The path is visualised by a smooth curve just like it would be in-game. Each point is marked with a circle outline. The parts of the paths that are above the tunnel image have a blue colour, the parts going under the tunnel are red. The currently selected point has a green outline. There is a grey arrow going from each point to the next to show the order of the points and the direction.

By clicking on an empty spot, you can add a point to the path that snaps to the grid. You may place points outside the visible grid, just note that then the path would go out of the screen in-game. By clicking on an existing point, you can drag it around and change its position. It would still snap to the grid. By pressing the right mouse button and dragging, you can move the view around. Use the scroll wheel on your mouse to zoom in and out. When placing the points, keep in mind that some of the in-game space is likely used for HUD and the shooter.

This will be explained more below, but you can save the path into a file by clicling on the "Save path" button or by pressing the S key on your keyboard. You can also press F12 to take a screenshot of the path.



MENU

On the right side of the window there is a menu with multiple buttons, each with their own actions.

New path - Empties the path and resets the view and background to start creating a new path. Asks for confirmation when the current path is unsaved. Keyboard shortcut: N

Load path - Opens up the file manager you can use to find and load existing path files. Path files are supposed to be located at /assets/paths/ in the game files. The path needs at least 2 points in different coordinates to be valid. Asks for confirmation when the current path is unsaved. Keyboard shortcut: O

Save path - Saves your current path into a text file that can be loaded into MoD 2. It again opens the file manager for you to locate the location where it should be saved to. You cannot save an empty path, meaning it has to have at least 2 points in different coordinates to be valid. Keyboard shortcut: S

Background - Opens the file manager to load a PNG image to be used as a background in the editor.

Delete - Removes the selected point. Keyboard shortcut: Delete

Insert - Adds a point in the middle of the selected point and the previous one that snaps to the grid as well. Cannot be used on the starting point. Keyboard shortcut: Insert

Depth - Toggles whether the selected point would be on top of or below the tunnel cutout. Its state is also written out on the button. Again, points above are blue in the editor the ones below are red.

Grid - This displays the gap between the grid lines the points snap to. Clicking on it lets you change the value by typing the number on your keyboard. The maximum allowed gap is 999,999,999 pixels.

Reverse - Reverses the order of the points, making the path go the other way.

Flip horizontal - Flips the path so the points on the left go to the right and vice versa.

Flip vertical - Flips the path so the points on the top go to the bottom and vice versa.

BG view - Changes how the background is displayed, if loaded. There are currently 5 modes. "Corner" puts it in the top-left corner as it normally appears in game. "Fill" resizes it to fill the entire game field. "Center" puts it in the middle of the game field. "Fit" scales it to fit the field, but keeps the aspect ratio while placing it at the center. "Off" hides the background.

Preview - Toggles between the default edit mode and preview mode. While in preview mode, the path is displayed in all white and with the thickness of the orbs to really show how it would appear in-game. The grid (except the border), path lines, points and statistics are not displayed when in preview mode.

Reset view - Resets the editor view to the default position and zoom.

Statistics - When turned on, displays info about the path in the top left corner. This includes the amount of points the path has, the length of the path, the selected point, whether it is being dragged and the X and Y coordinates of the selected point. Keyboard shortcut: F3



KEYBOARD FUNCTIONS

Delete - Removes the selected point, just like the "Delete" button on the menu.

Insert - Adds a point between the selected point and the previous one, just like the "Insert" button on the menu.

Page Up, Page Down - Select the next or previous point.

Home - Selects the first point of the path.
End - Selects the last point of the path.

F3 - Toggle Statistics.

Arrow keys - Move the selected point by one grid cell in the respective direction. When holding Shift at the same time, moves all points.

O - Load a path file.
S - Save the path into a file.
N - Create a new path.

C - Copy the path to the clipboard.
V - Paste a path from the clipboard. Asks for confirmation when the current path is unsaved.

I - Import a Marbles of Darkness 1 legacy path file. Asks for confirmation and then opens the file manager to search for it. Note that MoD1 paths have a different format and are not compatible with MoD 2 unless converted. Above/below tunnel checks are also not in the path file, therefore everything will appear above the tunnel.

F12 - Take a screenshot of the path in the form. Only the area inside the visible game field will be captured. Useful for background editing. Automatically resets the view to give an accurate depiction of the path. The file manager is opened to asking for the save location of the image.

Numpad +/- - Zoom in or out. Only works with Numpad keys
