import pathlib, struct, subprocess
p = pathlib.Path(__file__).resolve().parent
subprocess.run(['clang','-target','armv7-none-eabi','-c',str(p/'root-helper.S'),'-o',str(p/'root-helper.o')],check=True)
b = (p/'root-helper.o').read_bytes()
h = struct.unpack_from('<16sHHIIIIIHHHHHH', b)
sections = [struct.unpack_from('<IIIIIIIIII', b, h[6]+i*h[11]) for i in range(h[12])]
strings = sections[h[13]]
names = b[strings[4]:strings[4]+strings[5]]
code = None
for s in sections:
    name = names[s[0]:].split(b'\0')[0]
    if name == b'.text': code = b[s[4]:s[4]+s[5]]
    if name == b'.rel.text' and s[5]: raise RuntimeError('Unexpected relocation')
assert code
ident = b'\x7fELF\x01\x01\x01'+b'\0'*9
header = struct.pack('<16sHHIIIIIHHHHHH',ident,2,40,1,0x10000+84,52,0,0x05000000,52,32,1,0,0,0)
program = struct.pack('<IIIIIIII',1,0,0x10000,0x10000,84+len(code),84+len(code),5,0x1000)
(p/'root-helper').write_bytes(header+program+code)
print('Built audited ARM32 helper:',84+len(code),'bytes')
