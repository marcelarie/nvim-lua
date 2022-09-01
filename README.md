# Nvim config

## Language Servers

### Lua

```bash
git clone https://github.com/sumneko/lua-language-server.git
git submodule update --init --recursive
cd 3rd/luamake &&
./compile/install.sh &&
cd ../.. &&
./3rd/luamake/luamake rebuild
```
