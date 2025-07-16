sudo pacman -S yay
sudo pacman -S jq
sudo pacman -S figlet
echo "please restart now, after restarting, come back here and press 1 upon this output."
read -r restart
if [ "$restart" = "1" ]; then
yay -S ollama-bin
konsole --noclose -e bash -c "ollama serve"
gnome-terminal -- bash -c "ollama serve; exec bash"
ollama pull phi
fi
