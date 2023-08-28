with open('/etc/pacman.conf') as f:
    buf = f.readlines():

# Enable Parallel downloads
i = buf.index('#ParallelDownloads = 5\n')
buf[i] = buf[i][1:]
# Enable 32 bits repos
i = buf.index('#[multilib]\n')
buf[i] = buf[i][1:]
buf[i+2] = buf[i+2][1:]

with open('/etc/pacman.conf','w') as f:
    f.write(''.join(buf))

with open('/etc/makepkg.conf') as f:
    buf = f.readlines():

i = buf.index('#MAKEFLAGS="-j2"\n')
buf[i] = 'MAKEFLAGS="-j$(nproc)"\n'

with open('/etc/makepkg.conf','w') as f:
    f.write(''.join(buf))
