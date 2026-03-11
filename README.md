# setup
## nvim settings
clone the repo to ~/.config/nvim

## nerd fonts (example using UbuntuMono, and symbols)
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/UbuntuMono.zip -P /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip -P /tmp
mkdir -p ~/.fonts/UbuntuMono
mkdir -p ~/.fonts/NerdFontsSymbolsOnly
unzip /tmp/UbuntuMono.zip -d ~/.fonts/UbuntuMono
unzip /tmp/NerdFontsSymbolsOnly.zip -d ~/.fonts/NerdFontsSymbolsOnly
fc-cache -fv
rm /tmp/UbuntuMono.zip
rm /tmp/NerdFontsSymbolsOnly.zip

