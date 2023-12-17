ctypes.windll.user32.MessageBoxW(4,  "this is not an application it is a dangerous virus don't forget the creator is mihneastefan2015 and Endermanch.", "Warning!", 64)
ctypes.windll.user32.MessageBoxW(0, "any wrong move comes to file encryption", "rip pc!", 64)
import binascii

# Feed this function the full value of the _sparkle string.
def deobfuscate(data):
    decode = 'abcdefghijklmnopqrstuvwxyz0123456789'
    r = "".join(binascii.unhexlify(str(x)).decode() for x in str(data).split('/'))
    for x in r:
        if x == "ζ":
            print()
        else:
            x = chr(ord(x)-683867)
            if x in decode:
                x = decode[(decode.index(x) + 1) % len(decode)]
            print(x, end='')
