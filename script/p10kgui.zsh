#   show colors
#   for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done

'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  autoload -Uz is-at-least && is-at-least 5.1 || return

  # Left prompt
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    # Line 1
    date
    time
    newline

    # Line 2
    ip
    wifi
    newline

    # Line 3
    dir                     
    vcs                     
    prompt_char           
  )

  # Right prompt
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    # Line 1
    ram
    swap
    load
    battery
    newline

    # Line 2
    proxy
    public_ip
    newline

    # Line 3
    command_execution_time  
    status                  
  )

  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_ICON_PADDING=moderate

  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=

  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%244F╭─'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%244F├─'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%244F╰─'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX='%244F─╮'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX='%244F─┤'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX='%244F─╯'

  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR='·'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_GAP_BACKGROUND=
  if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=244
    typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
    typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
  fi

  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B1'
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0B3'
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=

  ################################[ prompt_char ]################################
  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=76
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=196
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=


  ##################################[ dir ]##################################
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=202
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=0
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=0
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=0
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  local anchor_files=(
    .bzr
    .citc
    .git
    .hg
    .node-version
    .python-version
    .go-version
    .ruby-version
    .lua-version
    .java-version
    .perl-version
    .php-version
    .tool-version
    .shorten_folder_marker
    .svn
    .terraform
    CVS
    Cargo.toml
    composer.json
    go.mod
    package.json
    stack.yaml
  )
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
  typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=50
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=true

  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3

  #####################################[ vcs ]######################################
  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=47
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=214
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=2
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND=9
  typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND=8

  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='\uF126 '

  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

  function my_git_formatter() {
    emulate -L zsh

    if [[ -n $P9K_CONTENT ]]; then
      typeset -g my_git_format=$P9K_CONTENT
      return
    fi

    local       meta='%7F'
    local      clean='%0F'
    local   modified='%0F'
    local  untracked='%0F'
    local conflicted='%1F'

    local res

    if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
      local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
      (( $#branch > 32 )) && branch[13,-13]="…"  # <-- this line
      res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
    fi

    if [[ -n $VCS_STATUS_TAG
          && -z $VCS_STATUS_LOCAL_BRANCH  # <-- this line
        ]]; then
      local tag=${(V)VCS_STATUS_TAG}
      (( $#tag > 32 )) && tag[13,-13]="…"  # <-- this line
      res+="${meta}#${clean}${tag//\%/%%}"
    fi

    [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_LOCAL_BRANCH ]] &&  # <-- this line
      res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

    if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
      res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
    fi

    (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
    (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
    (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
    (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
    (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
    (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
    (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
    [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
    (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
    (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
    (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
    (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
    (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

    typeset -g my_git_format=$res
  }
  functions -M my_git_formatter 2>/dev/null

  typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1

  typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'

  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter()))+${my_git_format}}'
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

  typeset -g POWERLEVEL9K_VCS_PREFIX='Git '

  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

  ##########################[ status ]###########################
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

  typeset -g POWERLEVEL9K_STATUS_OK=true
  typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=0
  typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND=10

  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=0
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND=10

  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=0
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=196

  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=0
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=196

  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=0
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=196

  ###################[ command_execution_time ]###################
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=226
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX='took '

  ######################################[ ram ]#######################################
  typeset -g POWERLEVEL9K_RAM_FOREGROUND=0
  typeset -g POWERLEVEL9K_RAM_BACKGROUND=47

  #####################################[ swap ]######################################
  typeset -g POWERLEVEL9K_SWAP_FOREGROUND=0
  typeset -g POWERLEVEL9K_SWAP_BACKGROUND=47

  ######################################[ load ]######################################
  typeset -g POWERLEVEL9K_LOAD_WHICH=1
  typeset -g POWERLEVEL9K_LOAD_NORMAL_FOREGROUND=0
  typeset -g POWERLEVEL9K_LOAD_NORMAL_BACKGROUND=47
  typeset -g POWERLEVEL9K_LOAD_WARNING_FOREGROUND=0
  typeset -g POWERLEVEL9K_LOAD_WARNING_BACKGROUND=160
  typeset -g POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND=0
  typeset -g POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND=196

  ###############################[ public_ip ]###############################
  typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND=0
  typeset -g POWERLEVEL9K_PUBLIC_IP_BACKGROUND=48

  ###########[ ip ]###########
  typeset -g POWERLEVEL9K_IP_FOREGROUND=0
  typeset -g POWERLEVEL9K_IP_BACKGROUND=48
  typeset -g POWERLEVEL9K_IP_CONTENT_EXPANSION='$P9K_IP_INTERFACE ${P9K_IP_RX_RATE:+⇣$P9K_IP_RX_RATE }${P9K_IP_TX_RATE:+⇡$P9K_IP_TX_RATE }$P9K_IP_IP'
  typeset -g POWERLEVEL9K_IP_INTERFACE='[ew].*'
  typeset -g POWERLEVEL9K_IP_VISUAL_IDENTIFIER_EXPANSION=''

  #########################[ proxy ]##########################
  typeset -g POWERLEVEL9K_PROXY_FOREGROUND=0
  typeset -g POWERLEVEL9K_PROXY_BACKGROUND=205
  typeset -g POWERLEVEL9K_PROXY_VISUAL_IDENTIFIER_EXPANSION='爵'

  ################################[ battery ]#################################
  typeset -g POWERLEVEL9K_BATTERY_FOREGROUND=0
  typeset -g POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
  typeset -g POWERLEVEL9K_BATTERY_LOW_BACKGROUND=196
  typeset -g POWERLEVEL9K_BATTERY_{CHARGING,CHARGED}_BACKGROUND=47
  typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND=214
  typeset -g POWERLEVEL9K_BATTERY_STAGES='\uf58d\uf579\uf57a\uf57b\uf57c\uf57d\uf57e\uf57f\uf580\uf581\uf578'
  typeset -g POWERLEVEL9K_BATTERY_VERBOSE=false

  #####################################[ wifi ]#####################################
  typeset -g POWERLEVEL9K_WIFI_FOREGROUND=0
  typeset -g POWERLEVEL9K_WIFI_BACKGROUND=48

  typeset -g my_wifi_icon=('睊 Very Low...' '睊 Low...' '  Medium' '  Well!' '  Nice!')     
  typeset -g POWERLEVEL9K_WIFI_VISUAL_IDENTIFIER_EXPANSION=' $P9K_WIFI_SSID   ${my_wifi_icon[P9K_WIFI_BARS+1]}'

  ####################################[ date and time ]####################################
  typeset -g POWERLEVEL9K_DATE_FORMAT='%D{%Y-%m-%d}'
  typeset -g POWERLEVEL9K_DATE_FOREGROUND=0
  typeset -g POWERLEVEL9K_DATE_BACKGROUND=231
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=0
  typeset -g POWERLEVEL9K_TIME_BACKGROUND=231
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  (( ! $+functions[p10k] )) || p10k reload
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
