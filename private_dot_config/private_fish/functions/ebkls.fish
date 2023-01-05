function ebkls
  set -l ebkdir "/Volumes/GoogleDrive/My Drive/00_ebooks"
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  ebk ls $ebkdir | peco $peco_flags | read line

  if [ $line ]
    set -l filename (echo $line | cut -d : -f 2)
    echo "$filename"
    if test -f "$ebkdir/$filename"
        open "$ebkdir/$filename"
    end
    commandline -f repaint
  end
end
