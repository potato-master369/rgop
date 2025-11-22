# Bad Apple for Roblox

## Prerequisites
- ffmpeg
- Python
- PIL
- at least ~300MB free space
  
## Running

Firstly, obtain the Bad Apple!! video (length should be 3:51)

Then, run the following:
```
mkdir src
chmod a+x ./genf.sh
./genf.sh
python genlua.py
printf "\n" >> out.lua # maybe a new line wasn't added?
cat addontoback.lua >> out.lua
```

And, add rgop.lua to `ReplicatedStorage > RGOP` (ModuleScript). Add out.lua to `ServerScriptService > Script` (Script).

Create a part named "MyClickablePart" (Don't ask about the naming), and give it a child of a `ClickDetector` (named "ClickDetector").

When you run the game as a test, click MyClickablePart and it should run.
