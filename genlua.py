from PIL import Image


with open("out.lua", "w") as f:
    f.write("""local RGOP = require(game.ReplicatedStorage.RGOP)\n""")
    f.write("""local fb = RGOP.RGOP_init(96, 72, 0, 0, false, 1)\n""")
    f.write("local frames = {\n")

    for i in range(1, 4226):
        print("Processing frame:", i)
        img = Image.open("src/output_" + str(i).zfill(4) + ".pgm")
        if i != 1:
            previmg = Image.open("src/output_" + str(i - 1).zfill(4) + ".pgm")

        pixels = img.convert("RGB").load()
        width, height = img.size
        if i != 1:
            oldpx = previmg.convert("RGB").load()
            f.write("\tend,\n")
        f.write("\tfunction(fb)\n")
        for y in range(height):
            for x in range(width):

                r, g, b = pixels[x, y]

                if i > 1:

                    oldr, oldg, oldb = oldpx[x, y]
                    if r != oldr or g != oldg or b != oldb:
                        f.write(f"\t\tRGOP.PlotPixel(fb, {x + 1}, {y + 1}, Color3.fromRGB({r}, {g}, {b}))\n")
                else:
                    f.write(f"\t\tRGOP.PlotPixel(fb, {x + 1}, {y + 1}, Color3.fromRGB({r}, {g}, {b}))\n")

    f.write("\tend\n}\n")
