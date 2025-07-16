sudo apt install figlet
sudo apt install jq
curl -L https://ollama.com/download/Ollama.deb -o ollama.deb
sudo dpkg -I ollama.deb
echo "restart now, please, after restarting, run this script again and press 1 on this screen."
read -r restart
if [ "$restart" = "1" ]; then
gnome-terminal -- bash -c "ollama serve; exec bash"
konsole --noclose -e bash -c "ollama serve"
echo "installing :3 ai"
ollama pull phi
echo "all done :3 exiting..."
sleep 5s
exit
fi