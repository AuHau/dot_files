// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'canary',


    /*
     * STYLING
     */
    fontSize: 12,
    fontFamily: '"Roboto Mono for Powerline"',

    cursorColor: 'rgba(0, 150, 136, .5)',
    cursorAccentColor: '#000',
    cursorShape: 'BLOCK', // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorBlink: true,

    foregroundColor: '#ECEFF1',
    backgroundColor: '#263238',
    selectionColor: 'rgba(248,28,229,0.3)',
    borderColor: '#222d32',

    padding: '5px 10px 20px 10px',

    colors: {
      black: '#263238',
      red: '#FF5252',
      green: '#9CCC65',
      yellow: '#fee94e',
      blue: '#2b98f0',
      magenta: '#b38bfc',
      cyan: '#68b6f3',
      white: '#ECEFF1',
      lightBlack: '#617d8a',
      lightRed: '#fc625d',
      lightGreen: '#9CCC65',
      lightYellow: '#fee94e',
      lightBlue: '#2b98f0',
      lightMagenta: '#b38bfc',
      lightCyan: '#68b6f3',
      lightWhite: '#ffffff'
    },

    termCSS: '\
::-webkit-scrollbar-thumb {\
        border-radius: 4px;\
        background-color:rgba(255, 255, 255, 0.5);\
}\
    ',

    css: `
      .hyper_main {
        border: none !important;
      }
      .header_header {
        background: #222d32 !important;
        z-index:0;
      }
      .tab_tab {
        border: 0;
      }
      .tab_textActive {
        border-bottom: 2px solid #009688;
      }
      .splitpane_divider {
        background-color: rgba(170, 187, 195, 0.16) !important;
      }
      .terms_terms{
        background-color: #263238;
      }
      .term_term {
        opacity: 0.5;
        transition: opacity 0.15s ease-in-out;
        will-change: opacity;
      }
      .term_active .term_term {
        opacity: 1;
      }
      .xterm {
        cursor: default;
      }
    `,

    // set to `true` (without backticks and without quotes) if you're using a
    // Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: '',

    // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
    showWindowControls: true,

    shell: '/usr/local/bin/fish',
    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    // shell: '/usr/bin/env',

    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    // shellArgs: ['fish'],

    // for environment variables
    env: {
      "HYPER_PASTE_SEPARATOR": "; and "
    },

    // set to `false` for no bell
    bell: 'SOUND',

    scrollback: 5000, // buffer size

    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
    // selection is present (`true` by default on Windows and disables the context menu feature)
    // quickEdit: true,

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg

    hypercwd: {
      initialWorkingDirectory: '~'
    },

    visor: {
      hotkey: 'F12',
      position: 'top', // or left, right, bottom
      width: '100%', // Optional, defaults to half of viewable area for horizontal positions, 100% for vertical
      height: '50%', // Optional, defaults to half of viewable area for vertical positions, 100% for horizontal
    },

    hyperlinks: {
      clickAction: 'open',
      defaultBrowser: true
    },

    paneNavigation: {
      hotkeys: {
        navigation: {
          up: 'alt+up',
          down: 'alt+down',
          left: 'alt+left',
          right: 'alt+right'
        },
        jump_prefix: 'ctrl', // completed with 1-9 digits
        permutation_modifier: 'shift', // Added to jump and navigation hotkeys for pane permutation
        maximize: 'meta+enter'
      },
      showIndicators: true, // Show pane number
      indicatorPrefix: '', // Will be completed with pane number
      indicatorStyle: { // Added to indicator <div>
        position: 'absolute',
        top: 0,
        left: 0,
        fontSize: '10px'
      },
      focusOnMouseHover: false
    },

    hyperline:{
      plugins:{
        'hostname': 'l', 'ip': 'l', 'memory':'r', 'battery': 'r', 'cpu': 'r', 'network': 'r', 'time': 'c'
      }
    },

  },

  plugins: [
    'hyperline-auhau',
    'hyperminimal',
    'hypercwd',
    'hyperlinks',
    'hyper-search',
    "hyperlayout",
    "hyper-pane@next"
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  },
};
