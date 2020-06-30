# setup workspace 
# usage:
# workspace ruby
# workspace go
# workspace nodejs
# workspace ruby,go


function setup_go
    echo "Setting up go"
    set PATH /usr/local/go/bin $PATH
    set -gx GOPATH ~/dev/go
end

function setup_ruby
    echo "Setting up ruby"
    source /usr/share/chruby/chruby.fish
    source /usr/share/chruby/auto.fish
end

function setup_node
    echo "Setting up node"
    nvm use default
end
    


function workspace -d "setup workspace"
    #count $argv
    set envs (string split ',' -- $argv)

    for env in $envs
        echo $env
        
        if test "$env" = "ruby"
            setup_ruby
        else if test "$env" = "go"
            setup_go
        end
    end
end

