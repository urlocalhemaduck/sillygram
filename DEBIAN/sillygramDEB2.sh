#!/bin/bash

figlet sillygram

# Start Ollama if not running
if ! pgrep -x "ollama" >/dev/null 2>&1; then
    echo "Starting Ollama server in the background..."
    ollama serve >/dev/null 2>&1 &
fi

while true; do
    echo "welcome to sillygram, if there is an error above, please run the included installer program,
what can i silly today? :3:
1. put a silly background :3
2. exit the program and go back to standard terminal
3. put something in pixel art
4. ask boykisser ai something (beta, based on ollama phi)"
    read -r choice

    if [ "$choice" = "1" ]; then
        echo "setting a silly wallpaper (BK.jpg)..."
        curl -L -o "$HOME/BK.jpg" "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/216bf209-6112-48d1-a017-56e99bf4a2aa/dfw38to-36a427f9-3076-4f21-9fa0-27324bb7ebd9.png"
        gsettings set org.gnome.desktop.background picture-uri "file://$HOME/BK.jpg"  

    elif [ "$choice" = "2" ]; then
        echo "ok! have fun sillying!"
        exit

    elif [ "$choice" = "3" ]; then
        echo "what do u wanna turn into silly art? :3"
        read -r input
        figlet "$input"
        echo "you can copy paste this anywhere :3"

    elif [ "$choice" = "4" ]; then
        echo "WARNING: this AI runs locally, that means it's on your computer. We recommend at least an i5 from the 10th generation and some kind of dedicated graphics. Do you want to continue? (y/n)"
        read -r warning

        if [ "$warning" = "y" ]; then
            while true; do
                echo "what do you want to ask? it may take a minute...."
                read -r prompt
                response=$(curl -s http://localhost:11434/api/generate \
                    -d '{
                        "model": "phi",
                        "prompt": "'"$prompt"'"
                    }' | jq -r '.response' | tr '\n' ' ')  

                echo "$response"
                echo ""  # Blank line for spacing
            done
        else
            echo "Returning to main menu..."
        fi
    fi
done
