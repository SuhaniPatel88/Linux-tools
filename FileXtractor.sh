echo "Enter the link: "
read link
echo "Enter the filename where you want to save the data: "
read file
curl $link > ~/$file

echo "Select the type of files to download:"
echo "1. Images"
echo "2. Videos"
echo "3. Audio"
read choice

case $choice in
  1)
    grep -o 'http[^"]*\.\(png\|jpg\|jpeg\|svg\)' ~/$file > imagefile.txt
    image_file='imagefile.txt'
    c=1
    while read line;
    do
      curl -o ~/Pictures/image$c $line
      (( c++ ))
    done < $image_file
    ;;
  2)
    grep -o 'http[^"]*\.\(gif\|mp4\|mov\|avi\|flv\)' ~/$file > videofile.txt
    video_file='videofile.txt'
    c=1
    while read line; do
      curl -o ~/Videos/video$c $line
      ((c++))
    done < $video_file
    ;;
  3)
    grep -o 'http[^"]*\.\(mp3\|ogg\|wav\)' ~/$file > audiofile.txt
    audio_file='audiofile.txt'
    c=1
    while read line; do
      curl -o ~/Music/audio$c $line
      ((c++))
    done < $audio_file
    ;;
  *)
    echo "Invalid choice. Please select a valid option."
    ;;
esac
