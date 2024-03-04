echo "Enter the link: "
read link
echo "Enter the filename where you want to save the data: "
read file
curl $link > ~/$file
grep -o 'http[^"]*\.\(png\|jpg\|jpeg\|svg\)' ~/$file > imagefile.txt
grep -o 'http[^"]*\.\(gif\|mp4\|mov\|avi\|flv\)' ~/$file > videofile.txt
grep -o 'http[^"]*\.\(mp3\|ogg\|wav\)' ~/$file > audiofile.txt
image_file='imagefile.txt'
c=1
while read line;
do
curl -o ~/Pictures/image$c $line
(( c++ ))
done < $image_file

video_file='videofile.txt'
c=1
while read line; do
  curl -o ~/Videos/video$c $line
  ((c++))
done < $video_file

audio_file='audiofile.txt'
c=1
while read line; do
  curl -o ~/Music/audio$c $line
  ((c++))
done < $audio_file
