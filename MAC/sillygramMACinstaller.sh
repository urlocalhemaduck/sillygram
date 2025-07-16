echo "this installer requires brew. if you dont have brew yet. please go to https://brew.sh, do you already have brew? press 1"
read -r brew
if [ "$brew" = "1" ]; then
brew install figlet
brew install jq
brew install ollama
echo "starting ollama to pull :3 ai"
osascript <<EOF
tell application "Terminal"
    do script "ollama serve"
end tell
EOF
sleep 2s
ollama pull phi
fi
