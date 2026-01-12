# Flapper
Basic flappy bird clone for the nintendo 3ds family


# Building for yourself
If you can't wait for the next release (which I strongly advise) you can build the game for yourself using the bundler (Windows : "bundle.bat", Linux : "bundle.sh")

Just run the script and upload the obtained "bundle.zip" to this website
https://bundler.nawiasdev.eu/

The script requires you to have 7zip installed on your machine

The obtained archive (another bundle.zip I believe) will contain the playable .3dsx file.

On Windows, 7zip is required to run the bundler.

What the bundler does is quite simple :
- copy main.lua and the src folder to ./flapper-ready-to-bundle/game/
- compress THE CONTENT OF flapper-ready-to-bundle/ into a zip file

This last could be confusing so I want to be clear :
- You dont want the zip file to contain a folder containing itself "lovebrew.toml" and the "game" folder
- What you want is these two things at the root of the zip file
- With 7zip installed you would go to "flapper-ready-to-bundle", highlight both items and select the 7zip option saying something like "add to flapper-ready-to-bundle.zip"


# AI Usage
I think it is important to be transparent on this topic

Some AI was used during the making of this game :
- The Batch file used to bundle the game in a zip was AI generated
- I used (not so often) the in-line suggestions from Copilot to correct some of my mistakes since it is the first time i code in Lua

The list may expand (though my ego thinks I can do most of the work without using AI) but for now that's it.

# Anti-Piracy Statement
I do not support or condone piracy in any form.
This project is intended for legal use on homebrew-enabled Nintendo 3DS consoles.
I will not provide any information, guidance, or support regarding the modification of consoles, the use of pirated software, or the circumvention of copyright protections.
Please respect intellectual property rights and only use legally obtained software.
