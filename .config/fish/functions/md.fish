# yarn global add cli-md
# uses https://yarn.fyi/marked-terminal behind the scenes
function md
  cli-md $argv --color | less -r
end
