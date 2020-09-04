function clone --description 'clone a project in git/owner/project'
  set gitRoot ~ git
  set defaultOwner algolia
  set defaultGitProvider https://github.com

  set parts (string split / $argv)
  set numParts (count $parts)

  switch $numParts
    case 1
      set owner $defaultOwner
      set repo $parts[1]
      set url (string join / $defaultGitProvider $owner $repo)
    case 2
      set owner $parts[1]
      set repo $parts[2]
      set url (string join / $defaultGitProvider $owner $repo)
    case '*'
      set owner $parts[4]
      set repo $parts[5]
      set url $argv
  end

  echo cloning (string join / $owner $repo)

  set ownerPath (string join / $gitRoot $owner)

  mkdir -p $ownerPath

  cd $ownerPath

  git clone $url

  cd $repo
end
