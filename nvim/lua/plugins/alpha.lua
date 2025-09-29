 -- stylua: ignore start
  -- or
  -- prettier-ignore
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- dashboard.section.header.val = {
		-- 	"HOWDY",
		-- }
		-- Set your ASCII art here
		-- Make header text smaller
		dashboard.section.header.opts = {
			hl = "AlphaHeader",
			position = "center",
		}

		dashboard.section.header.val = {
'                                                                                                                                  +$&X&;&&$&$$&&&$&&&&',
'                                                                                                                               x  Xx$&;X&&&&+$&&&XX&&&',
'                                                                                                                               $$$&$X$&$$&x&X&&;$&$&$&',
'                                                                                                                                $$&&$+&+$$&&x&&&&&&&$+',
'                                                                                                                              xX&+$&&&&&&&&&&&&&X&&&&&',
'                                                                                                                           X &X&&++X$&&+&+&&&&&&&&&&&&',
'                                                                                                                            XX;$x;&&&X&&&&&&$&&X&&&&&&',
'                                                                                                                        xXX$+$+Xx&&$&&$+&$&&&&&&&&&&&&',
'                                                                                                                     $x$$x&XX+$$&XXXX&&&&&&&x&&&X&&&&&',
'                                                                                                                      x$X ;$+$&&&$$X&:&&$&&&&&$&&&&&&&',
'                                                                                          +$XXX$$&X;$X                   +$  $&+X$$&$&&&+&&&:&&&&&&&&&',
'                                                                                       $X$&&&$&$&&&&&&+&                         X$&&&&&&&&&&&&&&&&&&&',
'                                                           +xxx++xxxXxxx++xxxXXXXXxxx$X$&&&&&&$&$$&&+$$                            +$$&&&&&&&&&&&&&&&&',
'                                                       X++x$$$XxxXXX+xx+XxxxXxxXXX+x+X&$&&&&&$&&$$&$&&                                  X&&&XX&&$ &+&&',
'                                                     ;+;+X$$&$&&$$++;+;XxXXxXX$X+XXXxX&&&&&&&&&&&&&  $                                 $X$$X&&&&&&XX&&',
'                                                   ;X++xXX&&&&&&$x;X++X+Xx$$$$&$X$&&;X$&&&&&&& &&&$                                     +$&&&&x&&&$&+&',
'                                                 x$ :;;x&$&&&&&&&$+;++xXx&XX&$&&&&&&;x$&&&&&&                                             X&X$$.&&&:$&',
'                                               ++   ;:+&&&&&&&&&&&&Xx+xx$$$X&&&&&&&$;+$&&&&&                                        Xx     && &&&&&$$&',
'                                           X &;      ;;&&&&&&&&&&   X$++XXX&&&&&&&&;++X$&&&                                        &&.$&&&& &&X&&&&x&x',
'                                       $&&XX         ;+&&&&&&$&&&       x+x&&&&&&&&;;+$&&&                                          &&&   ;&&&&$&$x&&&',
'                                                      +X&&&&&&&&             &&&&&&;;X&&&                                          & &&X&&&  &&&$X&&X&',
'                                                      ;x+&&&&&&&                  X+$&&&                                           &  & &     &$$XXx&&',
'                                                      ;X&&&&&&&&                  &x$&&                                                     X        X',
'                                                     :+X&&&&&&&                   X+X&&                                                               ',
'                                                     $$X&&X&&&                    &+$&&                                                               ',
'                                                    $;$& $&+&                     &+$&                                                                ',
'                                                   &&X$+ &&&                       +$&                                                                ',
'                                                  &&&&  $&$$                       ;$&                                                                ',
'                                                  +X&     &                       $+$&                                                                ',
'                                                  $X$    X$                       &+X&                                                                ',
'                                                   &&     X&                        X&                                                                ',
'                                                   ;&      &                        ;&$&                                                              ',
'                                                   ;X$$    &;::+$;&:.+:.;;..;::+ :xx;&X&:;.;:X&X                                                      ',
'                                     ;& &;;;x.:+.:+;;:+.$ X;+.+:+::. .;.:;.;..;;:x:;X+&;&X$$X&&$Xx                                                    ',
'X           &  ;::;X:X+;+. :;;XX:;::;. .;+X::; +x;::+.:;;+x:.+X;$+$;X; .X;+ ..;+::+:x;;:x:;:;.X;X$                                                    ',
'  $       & ;++;;;+$::;:.:+.x::+...;: ::.++;::..+:+X:;+.; :.;;+x+;x.:++;;+:$x.;:+$:;::. +.+.:;;:X.;                                                   ',
'         X ;+;X.+;:+:;;:.;:xXx.;+ .;x;+:;+::.:;  $X+$+:.:.:xx::+$ xX:x++XX.+.+ +X$.;+x::$$;x.::X:xx                                                   ',
'      : .::X+++Xx:;.;$x;x+$.+;;+++::$+x$;;:.:+::+:;$&$::;:.:: :;:.::+:+..X:;.X:$+&X.X xXX++$X$X+&;$                                                   ',
'    $   ; XX:X+:;x.:;;X:+::+;: ++::$:X+;;;;X;::; +$x.:+;$ :XX$ X+:+xx;X+;XX$XX&.$+$+$+X;+; +.X;;.;+&                                                  ',
'       ;..+x:;.:X+.x:;.$;XX+;XXx;x+;.;;X.;:::;$;x++X:X.+.+:X::x++:+;X.+x:+$&XX:+XxXX+:XX ;;  ++X$+.&                                                  ',
'     ;::x.+;Xx$:..+ &;.+x+.;:+xx: :: X:;.;;+:.+..+X.+X:+;++;.;+;X.XX$::+;+X;x;x;;$$$+.;;Xx.++$:;;.;&&                                                 ',
'    $$;:$XX:;.;;+;x:;:  .X;X::.++X+;.XX:::+:;X&;:;+++$;;++:..+X ;++++&.;.$++$:&:&+ $+x:;X+$+x&.$;+$x$$                                                ',
'X   +.:;XXX+:x:+::+&;++;X:+;;::;::x:+::xX:.X:. ;;;;.:++$;++x:++:;+.;+x ++ ;x$+;+&$X+;;:+;;:$ +.;$ $$$X                                                ',
'    .;.x$:$:.+; .x..;XXXX;X+X::X+.x+;:+X.+ ;;:X+;;x.+x:;:;+;.$x x;.+$$.x+++ +X:: :+X$;$x;X;$&:$++;+$&&                                                ',
' ; x:+X+X::+X;.:;;;+;x;X :: ;.;X+;+ :+X.+;x+ ;::++;:+x.X;.:: ;X: ;::X++x:xX++:;X$;XX;:X:;&&x$ Xx;X;$;x;                                          .  . ',
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC -", "  > Toggle file explorer", "<cmd>Oil<CR>"),
			dashboard.button("SPC wr", "  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Create custom highlight group for smaller header text
		vim.cmd([[
			highlight AlphaHeaderSmall guifg=#7aa2f7 gui=bold
		]])

		-- Override header highlight
		dashboard.section.header.opts.hl = "AlphaHeaderSmall"

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
