figlet sillygram
if ! pgrep -x "ollama" >/dev/null 2>&1; then
echo "Starting Ollama server in the background..."
ollama serve >/dev/null 2>&1 &
while true; do
echo "welcome to sillygram, if there is an error above, please run the included installer program,
what can i silly today? :3:
1. put a silly background :3
2. exit the program and go back to standard terminal
3. put something in pixel art
4. talk to boykisser ai (beta, based on phi by ollama)"
read -r choice
if [ "$choice" = "1" ]; then
echo "setting a silly wallpaper (bk.jpg)..."
curl -L -o BK.jpg https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/216bf209-6112-48d1-a017-56e99bf4a2aa/dfw38to-36a427f9-3076-4f21-9fa0-27324bb7ebd9.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzIxNmJmMjA5LTYxMTItNDhkMS1hMDE3LTU2ZTk5YmY0YTJhYVwvZGZ3Mzh0by0zNmE0MjdmOS0zMDc2LTRmMjEtOWZhMC0yNzMyNGJiN2ViZDkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ToIFezYHp8KgH2e53t397fautW1IcPp3uZAys-Ak1jw
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "'"$HOME/BK.jpg"'"'
fi
if [ "$choice" = "2" ]; then
echo "ok! have fun sillying!"
exit
fi
if [ "$choice" = "3" ]; then
echo "what do u wanna turn into silly art? :3"
read -r input
figlet "$input"
echo "you can copy paste this anywhere :3"
fi
done
if [ "$choice" = "4" ]; then
while true; do
echo "what do u want to ask? it may take a minute...."
read -r prompt
 response=$(curl -s http://localhost:11434/api/generate \
-d '{
"model": "phi",
"prompt": "'"$prompt"'"}' | jq -r '.response' | tr '\n' ' ')
echo "$response"
done
fi
done	
else
echo "returning to main menu"
fi
done

