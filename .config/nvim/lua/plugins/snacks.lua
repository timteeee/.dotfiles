return {
    "folke/snacks.nvim",
    lazy = false,
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
        picker = {},
        indent = {
            indent = { char = "┊" },
            scope = { char = "┊", only_current = true },
            animate = { enabled = false },
        },
        dashboard = {
            preset = {
                header = [[
         .                  *.                                                                               
       .*%0.                &&*.                                                                             
     .*%%%00*               &&&&*.                                                     .*.                   
   .*%%%%%000*              &&&&&&*.                          ..*******.              .%@&'                  
 .*%%%%%%%00000             &&&&&&&&*.                 .*0&%%@@@@@@@@@@@&0^          *@@@&'                  
*00%%%%%%%000000.           &&&&&&&&&&*            o&@@@@%&00*^^^''''^^*0%&'       *@@@&                     
0000%%%%%%0000000*          &&&&&&&&&&&          '%@@%0^ .*.              &%000&&&&@@@@&&&0o                 
000000%%%%000000000.        &&&&&&&&&&&           0@*   0%@@0            *@@&&000%@@@0^^'                    
0000000%%%0000000000*       &&&&&&&&&&&                00*@@0          *&@%'    0@@@0                  *.    
00000000%%000000000000      &&&&&&&&&&&               0 *@@%        .0%@@0'    0@@@0     *%&          &@%'   
000000000%'000000000000.    &&&&&&&&&&&              ^ 0@@%'     .o&@@&^      0@@@0     *@@&  .*.    &@@0    
0000000000 '000000000000.   &&&&&&&&&&&             .*&@@%'  .*0%@@&*'       *@@@0     *@@%  .0@%   0@@*     
0000000000   '00000000000*  &&&&&&&&&&&            *0%@@@%%%@@@%0^          *@@@0     *@@%  *%@@%  *@@^      
0000000000    '000000000000.&&&&&&&&&&&           @@@@@@@@@@@%0'           '@@@&     *@@%  &0%@@* *@%'       
0000000000      000000000000%&&&&&&&&&&           0@@@^    '^00%@&o.       %@@%'    *@@@'.&^0@@% *@%'        
0000000000       ^0000000000%%&&&&&&&&&          '@@%'          '0@@&'    &@@@'   .&@@@ 0&''@@@*o@&          
0000000000        '000000000%%%%&&&&&&&         '@@%'            0@@@0   *@@@^  .00@@@0&0  %@@%0@0           
0000000000          00000000%%%%%%&&&&&        '@@&           .0@@@@0   '@@@* .*0'&@@@%*  *@@@%@0            
0000000000           '000000%%%%%%%%&&*        %@0        .*&%@@%&^     0@@&'0&^ ^@@@@^   &@@@@*             
 ^00000000            '00000%%%%%%'.*.         *0'  .*00&%@@@&0*'       ^0@@%&^    0@@&    &@@%^             
   ^000000              ^000%%%%% &@&0o.o0000&&%%@@@@%&0*^'              ^0^        ''     ''                
     ^0000               '00%%%%% ^&&%%%%&&&&000*^^'                                                         
       ^00                '0%%%%'                                                                            
         '                  ^''                                                                              ]],
                keys = {
                    { icon = " ", key = "m", desc = "Mason", action = ":Mason", enabled = package.loaded.lazy ~= nil },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "h", desc = "Health", action = ":checkhealth" },
                    { icon = " ", key = "c", desc = "Config", action = ":cd $DOTFILES/.config/nvim | :e ." },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup", padding = 1 },
            },
        },
    },

    keys = {
        {
            "sd",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "Buffer Diagnostics",
        },
        {
            "sh",
            function()
                Snacks.picker.help()
            end,
            desc = "Help Pages",
        },
        {
            "sH",
            function()
                Snacks.picker.highlights()
            end,
            desc = "Highlights",
        },
        -- Need to define this keybind twice because tmux doesn't support Kitty Keyboard Protocol
        {
            "<C-/>",
            function()
                Snacks.picker.lines({ layout = { preset = "vertical" } })
            end,
            desc = "Search lines in current buffer",
        },
        {
            "<C-_>",
            function()
                Snacks.picker.lines({ layout = { preset = "vertical" } })
            end,
            desc = "Search lines in current buffer",
        },
    },
}
