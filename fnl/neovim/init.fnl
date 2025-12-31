;;                               O X O C A R B O N
;;        _..._         _..._         _..._         _..._         _..._
;;      .:::::::.     .::::. `.     .::::  `.     .::'   `.     .'     `.
;;     :::::::::::   :::::::.  :   ::::::    :   :::       :   :         :
;;     :::::::::::   ::::::::  :   ::::::    :   :::       :   :         :
;;     `:::::::::'   `::::::' .'   `:::::   .'   `::.     .'   `.       .'
;;       `':::''       `'::'-'       `'::.-'       `':..-'       `-...-'
;;
;;   Colorscheme name:    oxocarbon themeing system
;;   Description:         Neovim Colorschemes based on base16 in fennel made with (hs)luv <3
;;   Author:              https://github.com/shaunsingh

(local {: blend-hex} (require :neovim.colorutils))

;; utilities

(macro let! [...]
  (fn let-with-scope! [[scope] name value]
    (let [name (tostring name)
          scope (tostring scope)]
      `(tset ,(match scope
                :b `vim.b
                :w `vim.w
                :t `vim.t
                :g `vim.g) ,name ,value)))

  (match [...]
    [[scope] name value] (let-with-scope! [scope] name value)
    [name value] (let-with-scope! [:g] name value)
    _ (error "expected let! to have at least two arguments: name value")))

(macro set! [option]
  (let [option (tostring option)]
    `(tset vim.o ,option true)))

(macro custom-set-face! [name attributes colors]
  (let [definition (collect [_ attr (ipairs attributes) &into colors]
                     (tostring attr)
                     true)]
    `(vim.api.nvim_set_hl 0 ,name ,definition)))

;; reset variables

(when vim.g.colors_name
  (vim.cmd.hi :clear))

;; set defaults

(let! colors_name :neovim)
(set! termguicolors)

;; neovim palette

(local base00 "#07080d")
(local base06 "#ffffff")
(local base09 "#004c63")

(local neovim  (or (and (= vim.o.background :dark)
                          {: base00
                           :base01 (blend-hex base00 base06 0.085)
                           :base02 (blend-hex base00 base06 0.18)
                           :base03 (blend-hex base00 base06 0.3)
                           :base04 (blend-hex base00 base06 0.82)
                           :base05 (blend-hex base00 base06 0.95)
                           : base06
                           :base07 "#007373"
                           :base08 "#8cf8f7"
                           : base09
                           :base10 "#470045"
                           :base11 "#a6dbff"
                           :base12 "#ffcaea"
                           :base13 "#b3f6c0"
                           :base14 "#ffc094"
                           :base14 "#470045"
                           :base15 "#82cfff"
                           :blend "#131313"
                           :none :NONE})                     {:base00 base06
                      :base01 (blend-hex base00 base06 0.95)
                      :base02 (blend-hex base00 base06 0.82)
                      :base03 base00
                      :base04 "#37474F"
                      :base05 "#90A4AE"
                      :base06 "#525252"
                      :base07 "#08bdba"
                      :base08 "#ff7eb6"
                      :base09 "#ee5396"
                      :base10 "#FF6F00"
                      :base11 "#0f62fe"
                      :base12 "#673AB7"
                      :base13 "#42be65"
                      :base14 "#be95ff"
                      :base15 "#FFAB91"
                      :blend "#FAFAFA"
                      :none :NONE}))

;; terminal

(let! terminal_color_0 neovim.base01)
(let! terminal_color_1 neovim.base11)
(let! terminal_color_2 neovim.base14)
(let! terminal_color_3 neovim.base13)
(let! terminal_color_4 neovim.base09)
(let! terminal_color_5 neovim.base15)
(let! terminal_color_6 neovim.base08)
(let! terminal_color_7 neovim.base05)
(let! terminal_color_8 neovim.base03)
(let! terminal_color_9 neovim.base11)
(let! terminal_color_10 neovim.base14)
(let! terminal_color_11 neovim.base13)
(let! terminal_color_12 neovim.base09)
(let! terminal_color_13 neovim.base15)
(let! terminal_color_14 neovim.base07)
(let! terminal_color_15 neovim.base06)

;; editor

(custom-set-face! :ColorColumn [] {:fg neovim.none :bg neovim.base01})
(custom-set-face! :Cursor [] {:fg neovim.base00 :bg neovim.base04})
(custom-set-face! :CursorLine [] {:fg neovim.none :bg neovim.base01})
(custom-set-face! :CursorColumn [] {:fg neovim.none :bg neovim.base01})
(custom-set-face! :CursorLineNr [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :QuickFixLine [] {:fg neovim.none :bg neovim.base01})
(custom-set-face! :Error [] {:fg neovim.base10 :bg neovim.base01})
(custom-set-face! :LineNr [] {:fg neovim.base03 :bg neovim.base00})
(custom-set-face! :NonText [] {:fg neovim.base02 :bg neovim.none})
(custom-set-face! :Normal [] {:fg neovim.base04 :bg neovim.base00})
(custom-set-face! :Pmenu [] {:fg neovim.base04 :bg neovim.base01})
(custom-set-face! :PmenuSbar [] {:fg neovim.base04 :bg neovim.base01})
(custom-set-face! :PmenuSel [] {:fg neovim.base08 :bg neovim.base02})
(custom-set-face! :PmenuThumb [] {:fg neovim.base08 :bg neovim.base02})
(custom-set-face! :SpecialKey [] {:fg neovim.base03 :bg neovim.none})
(custom-set-face! :Visual [] {:fg neovim.none :bg neovim.base02})
(custom-set-face! :VisualNOS [] {:fg neovim.none :bg neovim.base02})
(custom-set-face! :TooLong [] {:fg neovim.none :bg neovim.base02})
(custom-set-face! :Debug [] {:fg neovim.base13 :bg neovim.none})
(custom-set-face! :Macro [] {:fg neovim.base07 :bg neovim.none})
(custom-set-face! :MatchParen [:underline]
                  {:fg neovim.none :bg neovim.base02})
(custom-set-face! :Bold [:bold] {:fg neovim.none :bg neovim.none})
(custom-set-face! :Italic [:italic] {:fg neovim.none :bg neovim.none})
(custom-set-face! :Underlined [:underline]
                  {:fg neovim.none :bg neovim.none})

;; diagnostics

(custom-set-face! :DiagnosticWarn [] {:fg neovim.base14 :bg neovim.none})
(custom-set-face! :DiagnosticError [] {:fg neovim.base10 :bg neovim.none})
(custom-set-face! :DiagnosticInfo [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :DiagnosticHint [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :DiagnosticUnderlineWarn [:undercurl]
                  {:fg neovim.base14 :bg neovim.none})
(custom-set-face! :DiagnosticUnderlineError [:undercurl]
                  {:fg neovim.base10 :bg neovim.none})
(custom-set-face! :DiagnosticUnderlineInfo [:undercurl]
                  {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :DiagnosticUnderlineHint [:undercurl]
                  {:fg neovim.base04 :bg neovim.none})

;; health
(custom-set-face! :HealthError [] {:fg neovim.base10 :bg neovim.none})
(custom-set-face! :HealthWarning [] {:fg neovim.base14 :bg neovim.none})
(custom-set-face! :HealthSuccess [] {:fg neovim.base13 :bg neovim.none})

;; ledger

(custom-set-face! "@comment" [] {:link "Comment"})
(custom-set-face! "@text.literal.commodity" [] {:fg neovim.base13 :bg neovim.none})
(custom-set-face! "@number" [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! "@number.date" [] {:fg neovim.base08 :bg neovim.none})
(custom-set-face! "@number.date.effective" [] {:fg neovim.base13 :bg neovim.none})
(custom-set-face! "@number.interval" [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! "@number.status" [] {:fg neovim.base12 :bg neovim.none})
(custom-set-face! "@number.quantity" [] {:fg neovim.base11 :bg neovim.none})
(custom-set-face! "@number.quantity.negative" [] {:fg neovim.base10 :bg neovim.none})

;; lsp

(custom-set-face! :LspCodeLens [] {:fg neovim.none :bg neovim.base03})
(custom-set-face! :LspReferenceText [] {:fg neovim.none :bg neovim.base03})
(custom-set-face! :LspReferenceread [] {:fg neovim.none :bg neovim.base03})
(custom-set-face! :LspReferenceWrite [] {:fg neovim.none :bg neovim.base03})
(custom-set-face! :LspSignatureActiveParameter [] {:fg neovim.base08 :bg neovim.none})

;; lps-semantic-tokens
(custom-set-face! "@lsp.type.class" [] {:link "Structure"})
(custom-set-face! "@lsp.type.decorator" [] {:link "Decorator"})
(custom-set-face! "@lsp.type.decorator.markdown" [] {:link "Structure"})
(custom-set-face! "@lsp.type.function" [] {:link "@function"})
(custom-set-face! "@lsp.type.macro" [] {:link "Macro"})
(custom-set-face! "@lsp.type.method" [] {:link "@function"})
(custom-set-face! "@lsp.type.struct" [] {:link "Structure"})
(custom-set-face! "@lsp.type.type" [] {:link "Type"})
(custom-set-face! "@lsp.type.typeParameter" [] {:link "Typedef"})
(custom-set-face! "@lsp.type.selfParameter" [] {:link "@variable.builtin"})
(custom-set-face! "@lsp.type.builtinConstant" [] {:link "@constant.builtin"})
(custom-set-face! "@lsp.type.magicFunction" [] {:link "@function.builtin"})
(custom-set-face! "@lsp.type.boolean" [] {:link "@boolean"})
(custom-set-face! "@lsp.type.builtinType" [] {:link "@type.builtin"})
(custom-set-face! "@lsp.type.comment" [] {:link "@comment"})
(custom-set-face! "@lsp.type.enum" [] {:link "@type"})
(custom-set-face! "@lsp.type.enumMember" [] {:link "@constant"})
(custom-set-face! "@lsp.type.escapeSequence" [] {:link "@string.escape"})
(custom-set-face! "@lsp.type.formatSpecifier" [] {:link "@punctuation.special"})
;;(custom-set-face! "@lsp.type.interface" [] {})
(custom-set-face! "@lsp.type.keyword" [] {:link "@keyword"})
(custom-set-face! "@lsp.type.namespace" [] {:link "@namespace"})
(custom-set-face! "@lsp.type.number" [] {:link "@number"})
(custom-set-face! "@lsp.type.operator" [] {:link "@operator"})
(custom-set-face! "@lsp.type.parameter" [] {:link "@parameter"})
(custom-set-face! "@lsp.type.property" [] {:link "@property"})
(custom-set-face! "@lsp.type.selfKeyword" [] {:link "@variable.builtin"})
(custom-set-face! "@lsp.type.string.rust" [] {:link "@string"})
(custom-set-face! "@lsp.type.typeAlias" [] {:link "@type.definition"})
(custom-set-face! "@lsp.type.unresolvedReference" [] {:link "Error"})
(custom-set-face! "@lsp.type.variable" [] {:link "@variable"} )
(custom-set-face! "@lsp.mod.readonly" [] {:link "@constant"})
(custom-set-face! "@lsp.mod.typeHint" [] {:link "Type"})
(custom-set-face! "@lsp.mod.builtin" [] {:link "Special"})
(custom-set-face! "@lsp.typemod.class.defaultLibrary" [] {:link "@type.builtin"})
(custom-set-face! "@lsp.typemod.enum.defaultLibrary" [] {:link "@type.builtin"})
(custom-set-face! "@lsp.typemod.enumMember.defaultLibrary" [] {:link "@constant.builtin"})
(custom-set-face! "@lsp.typemod.function.defaultLibrary" [] {:link "@function.builtin"})
(custom-set-face! "@lsp.typemod.keyword.async" [] {:link "@keyword.coroutine"})
(custom-set-face! "@lsp.typemod.macro.defaultLibrary" [] {:link "@function.builtin"})
(custom-set-face! "@lsp.typemod.method.defaultLibrary" [] {:link "@function.builtin"})
(custom-set-face! "@lsp.typemod.operator.injected" [] {:link "@operator"})
(custom-set-face! "@lsp.typemod.string.injected" [] {:link "@string"})
(custom-set-face! "@lsp.typemod.operator.controlFlow" [] {:link "@exception"})
(custom-set-face! "@lsp.typemod.keyword.documentation" [] {:link "Special"})
(custom-set-face! "@lsp.typemod.variable.global" [] {:link "@constant"})
(custom-set-face! "@lsp.typemod.variable.static" [] {:link "@constant"})
(custom-set-face! "@lsp.typemod.variable.defaultLibrary" [] {:link "Special"})
(custom-set-face! "@lsp.typemod.function.builtin" [] {:link "@function.builtin"})
(custom-set-face! "@lsp.typemod.function.readonly" [] {:link "@method"})
;;(custom-set-face! "@lsp.typemod.type.defaultLibrary" [] {})
(custom-set-face! "@lsp.typemod.variable.defaultLibrary" [] {:link "@variable.builtin"})
(custom-set-face! "@lsp.typemod.variable.injected" [] {:link "@variable"})

;; gutter

(custom-set-face! :Folded [] {:fg neovim.base02 :bg neovim.base01})
(custom-set-face! :FoldColumn [] {:fg neovim.base01 :bg neovim.base00})
(custom-set-face! :SignColumn [] {:fg neovim.base01 :bg neovim.base00})

;; navigation

(custom-set-face! :Directory [] {:fg neovim.base08 :bg neovim.none})

;; prompts

(custom-set-face! :EndOfBuffer [] {:fg neovim.base01 :bg neovim.none})
(custom-set-face! :ErrorMsg [] {:fg neovim.base10 :bg neovim.none})
(custom-set-face! :ModeMsg [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :MoreMsg [] {:fg neovim.base08 :bg neovim.none})
(custom-set-face! :Question [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :Substitute [] {:fg neovim.base01 :bg neovim.base08})
(custom-set-face! :WarningMsg [] {:fg neovim.base14 :bg neovim.none})
(custom-set-face! :WildMenu [] {:fg neovim.base08 :bg neovim.base01})

;; vimhelp

(custom-set-face! :helpHyperTextJump []
                  {:fg neovim.base08 :bg neovim.none})

(custom-set-face! :helpSpecial [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :helpHeadline [] {:fg neovim.base10 :bg neovim.none})
(custom-set-face! :helpHeader [] {:fg neovim.base15 :bg neovim.none})

;; diff

(custom-set-face! :DiffAdded [] {:fg neovim.base07 :bg neovim.none})
(custom-set-face! :DiffChanged [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :DiffRemoved [] {:fg neovim.base10 :bg neovim.none})
(custom-set-face! :DiffAdd [] {:bg "#122f2f" :fg neovim.none})
(custom-set-face! :DiffChange [] {:bg "#222a39" :fg neovim.none})
(custom-set-face! :DiffText [] {:bg "#2f3f5c" :fg neovim.none})
(custom-set-face! :DiffDelete [] {:bg "#361c28" :fg neovim.none})

;; search

(custom-set-face! :IncSearch [] {:fg neovim.base06 :bg neovim.base10})
(custom-set-face! :Search [] {:fg neovim.base01 :bg neovim.base08})

;; tabs

(custom-set-face! :TabLine [] {:link "StatusLineNC"})
(custom-set-face! :TabLineFill [] {:link "TabLine"})
(custom-set-face! :TabLineSel [] {:link "StatusLine"})

;; window

(custom-set-face! :Title [] {:fg neovim.base04 :bg neovim.none})
;; VertSplit has been replaced by `WinSpeperator` in nvim 0.10
(custom-set-face! :VertSplit [] {:fg neovim.base01 :bg neovim.base00})
(custom-set-face! :WinSeparator [] {:fg neovim.base01 :bg neovim.base00})

;; regular syntax

(custom-set-face! :Boolean [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :Character [] {:fg neovim.base14 :bg neovim.none})
(custom-set-face! :Comment [:italic]
                  {:fg neovim.base03 :bg neovim.none})
(custom-set-face! :Conceal [] {:fg neovim.none :bg neovim.none})
(custom-set-face! :Conditional [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :Constant [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :Decorator [] {:fg neovim.base12 :bg neovim.none})
(custom-set-face! :Define [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :Delimeter [] {:fg neovim.base06 :bg neovim.none})
(custom-set-face! :Exception [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :Float [] {:link "Number"})
(custom-set-face! :Function [] {:fg neovim.base08 :bg neovim.none})
(custom-set-face! :Identifier [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :Include [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :Keyword [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :Label [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :Number [] {:fg neovim.base15 :bg neovim.none})
(custom-set-face! :Operator [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :PreProc [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :Repeat [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :Special [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :SpecialChar [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :SpecialComment [] {:fg neovim.base08 :bg neovim.none})
(custom-set-face! :Statement [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :StorageClass [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :String [] {:fg neovim.base14 :bg neovim.none})
(custom-set-face! :Structure [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :Tag [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :Todo [] {:fg neovim.base13 :bg neovim.none})
(custom-set-face! :Type [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :Typedef [] {:fg neovim.base09 :bg neovim.none})

;; markdown

(custom-set-face! :markdownBlockquote []
                  {:fg neovim.base08 :bg neovim.none})
(custom-set-face! :markdownBold [] {:link "Bold"})
(custom-set-face! :markdownItalic [] {:link "Italic"})
(custom-set-face! :markdownBoldItalic [:bold :italic]
                  {:fg neovim.none :bg neovim.none})
(custom-set-face! :markdownRule [] {:link "Comment"})
(custom-set-face! :markdownH1 [] {:fg neovim.base10 :bg neovim.none})
(custom-set-face! :markdownH2 [] {:link "markdownH1"})
(custom-set-face! :markdownH3 [] {:link "markdownH1"})
(custom-set-face! :markdownH4 [] {:link "markdownH1"})
(custom-set-face! :markdownH5 [] {:link "markdownH1"})
(custom-set-face! :markdownH6 [] {:link "markdownH1"})
(custom-set-face! :markdownHeadingDelimiter [] {:link "markdownH1"})
(custom-set-face! :markdownHeadingRule [] {:link "markdownH1"})
(custom-set-face! :markdownUrl [:underline]
                  {:fg neovim.base14 :bg neovim.none})
(custom-set-face! :markdownCode [] {:link "String"})
(custom-set-face! :markdownCodeBlock [] {:link "markdownCode"})
(custom-set-face! :markdownCodeDelimiter [] {:link "markdownCode"})
(custom-set-face! :markdownUrl [] {:link "String"})
(custom-set-face! :markdownListMarker []
                  {:fg neovim.base08 :bg neovim.none})
(custom-set-face! :markdownOrderedListMarker []
                  {:fg neovim.base08 :bg neovim.none})

; markdown treesitter
(custom-set-face! "@markup" [] {:link "@none"})
(custom-set-face! "@markup.environment" [] {:link "Macro"})
(custom-set-face! "@markup.environment.name" [] {:link "Type"})
(custom-set-face! "@markup.emphasis" [] {:italic true})
(custom-set-face! "@markup.italic" [] {:italic true})
(custom-set-face! "@markup.strikethrough" [] {:strikethrough true})
(custom-set-face! "@markup.strong" [] {:bold true})
(custom-set-face! "@markup.underline" [] {:underline true})

(custom-set-face! "@markup.heading" [] {:link "Title"})
(custom-set-face! "@markup.heading.marker" [] {:link :markdownHeadingDelimiter})
(custom-set-face! "@markup.heading.1.markdown" [] {:link "markdownH1"})
(custom-set-face! "@markup.heading.2.markdown" [] {:link "markdownH1"})
(custom-set-face! "@markup.heading.3.markdown" [] {:link "markdownH1"})
(custom-set-face! "@markup.heading.4.markdown" [] {:link "markdownH1"})
(custom-set-face! "@markup.heading.5.markdown" [] {:link "markdownH1"})
(custom-set-face! "@markup.heading.6.markdown" [] {:link "markdownH1"})
(custom-set-face! "@markup.heading.7.markdown" [] {:link "markdownH1"})
(custom-set-face! "@markup.heading.8.markdown" [] {:link "markdownH1"})

(custom-set-face! "@markup.link" [] {:link "markdownUrl"})
(custom-set-face! "@markup.link.label" [] {:underline true})
(custom-set-face! "@markup.link.label.symbol" [] {:link "markdownItalic"})
(custom-set-face! "@markup.link.label.markdown_inline" [] {:link "markdownItalic"})
(custom-set-face! "@markup.link.title" [] {:link "Title"})
(custom-set-face! "@markup.link.url" [] {:link "markdownUrl"})
(custom-set-face! "@markup.link.destination" [] {:link "markdownUrl"})
(custom-set-face! "@markup.link.description" [] {:fg neovim.blend :underline true :italic true})

(custom-set-face! "@markup.list" [] {:link "markdownListMarker"})
(custom-set-face! "@markup.list.bullet" [] {:link "markdownListMarker"})
(custom-set-face! "@markup.list.checked" [] {:link "markdownListMarker"})
(custom-set-face! "@markup.list.markdown" [] {:link "markdownListMarker"})
(custom-set-face! "@markup.list.ordered" [] {:link "markdownOrderedListMarker"})
(custom-set-face! "@markup.list.unchecked" [] {:link "markdownListMarker"})

(custom-set-face! "@markup.math" [] {:link "Special"})
(custom-set-face! "@markup.raw" [] {:link "String"})
(custom-set-face! "@markup.raw.markdown_inline" [] {:link "String"})
(custom-set-face! "@markup.quote" [] {:link "markdownBlockquote"})

(custom-set-face! "@markup.literal" [] {:link "markdownCode"})
(custom-set-face! "@markup.code.block" [] {:link "markdownCodeBlock"})
(custom-set-face! "@markup.rule" [] {:link "Comment"})

;; asciidoc

(custom-set-face! :asciidocAttributeEntry [] {:fg neovim.base15 :bg neovim.none})
(custom-set-face! :asciidocAttributeList [] {:link "asciidocAttributeEntry"})
(custom-set-face! :asciidocAttributeRef [] {:link "asciidocAttributeEntry"})
(custom-set-face! :asciidocHLabel [] {:link "markdownH1"})
(custom-set-face! :asciidocOneLineTitle [] {:link "markdownH1"})
(custom-set-face! :asciidocQuotedMonospaced [] {:link "markdownBlockquote"})
(custom-set-face! :asciidocURL [] {:link "markdownUrl"})

;; treesitter
;;; misc

(custom-set-face! "@comment" [] {:link "Comment"})
(custom-set-face! "@error" [] {:fg neovim.base11 :bg neovim.none})

;; @none
;; @preproc
;; @define

(custom-set-face! "@operator" [] {:link "Operator"})

;;; punctuation

(custom-set-face! "@punctuation.delimiter" [] {:fg neovim.base08 :bg neovim.none})
(custom-set-face! "@punctuation.bracket" [] {:fg neovim.base08 :bg neovim.none})
(custom-set-face! "@punctuation.special" [] {:fg neovim.base08 :bg neovim.none})

;;; literals

(custom-set-face! "@string" [] {:link "String"})
(custom-set-face! "@string.regex" [] {:fg neovim.base07 :bg neovim.none})
(custom-set-face! "@string.escape" [] {:fg neovim.base15 :bg neovim.none})

;; @string.special

(custom-set-face! "@character" [] {:link "Character"})

;; @character.special

(custom-set-face! "@boolean" [] {:link "Boolean"})
(custom-set-face! "@number" [] {:link "Number"})
(custom-set-face! "@float" [] {:link "Float"})

;;; functions

(custom-set-face! "@function" [:bold]
                  {:fg neovim.base12 :bg neovim.none})
(custom-set-face! "@function.builtin" [] {:fg neovim.base12 :bg neovim.none})

;; @function.call

(custom-set-face! "@function.macro" [] {:fg neovim.base07 :bg neovim.none})
(custom-set-face! "@method" [] {:fg neovim.base07 :bg neovim.none})

;; @method.call

(custom-set-face! "@constructor" [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! "@parameter" [] {:fg neovim.base04 :bg neovim.none})

;;; keywords

(custom-set-face! "@keyword" [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! "@keyword.function" [] {:fg neovim.base08 :bg neovim.none})
(custom-set-face! "@keyword.operator" [] {:fg neovim.base08 :bg neovim.none})

;; @keyword.return

(custom-set-face! "@conditional" [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! "@repeat" [] {:fg neovim.base09 :bg neovim.none})

;; @debug

(custom-set-face! "@label" [] {:fg neovim.base15 :bg neovim.none})
(custom-set-face! "@include" [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! "@exception" [] {:fg neovim.base15 :bg neovim.none})

;;; types

(custom-set-face! "@type" [] {:link "Type"})
(custom-set-face! "@type.builtin" [] {:link "Type"})

;; @type.defintion
;; @type.qualifier
;; @storageclass
;; @storageclass.lifetime

(custom-set-face! "@attribute" [] {:fg neovim.base15 :bg neovim.none})
(custom-set-face! "@field" [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! "@property" [] {:fg neovim.base10 :bg neovim.none})

;;; identifiers

(custom-set-face! "@variable" [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! "@variable.builtin" [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! "@constant" [] {:fg neovim.base14 :bg neovim.none})
(custom-set-face! "@constant.builtin" [] {:fg neovim.base07 :bg neovim.none})
(custom-set-face! "@constant.macro" [] {:fg neovim.base07 :bg neovim.none})
(custom-set-face! "@namespace" [] {:fg neovim.base07 :bg neovim.none})
(custom-set-face! "@symbol" [:bold]
                  {:fg neovim.base15 :bg neovim.none})

;;; text

(custom-set-face! "@text" [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! "@text.strong" [] {:fg neovim.none :bg neovim.none})
(custom-set-face! "@text.emphasis" [:bold]
                  {:fg neovim.base10 :bg neovim.none})
(custom-set-face! "@text.underline" [:underline]
                  {:fg neovim.base10 :bg neovim.none})
(custom-set-face! "@text.strike" [:strikethrough]
                  {:fg neovim.base10 :bg neovim.none})
(custom-set-face! "@text.title" [] {:fg neovim.base10 :bg neovim.none})
(custom-set-face! "@text.literal" [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! "@text.uri" [:underline]
                  {:fg neovim.base14 :bg neovim.none})

;; @text.math
;; @text.environment
;; @text.environment.name
;; @text.reference
;; @text.todo
;; @text.note
;; @text.warning
;; @text.danger
;; @text.diff.add
;; @text.diff.delete
;;; tags

(custom-set-face! "@tag" [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! "@tag.attribute" [] {:fg neovim.base15 :bg neovim.none})
(custom-set-face! "@tag.delimiter" [] {:fg neovim.base15 :bg neovim.none})
(custom-set-face! "@tag.builtin.tsx" [] {:link "@tag.tsx"})

;;; Conceal
;; @conceal
;;; Spell
;; @spell
;; @nospell
;;; non-standard
;; @variable.global
;;; locals
;; @definition
;; @definition.constant
;; @definition.function
;; @definition.method
;; @definition.var
;; @definition.parameter
;; @definition.macro
;; @definition.type
;; @definition.field
;; @definition.enum
;; @definition.namespace
;; @definition.import
;; @definition.associated
;; @scope

(custom-set-face! "@reference" [] {:fg neovim.base04 :bg neovim.none})

;; neovim

(custom-set-face! :NvimInternalError [] {:fg neovim.base00 :bg neovim.base08})
(custom-set-face! :NormalFloat [] {:fg neovim.base05 :bg neovim.blend})
(custom-set-face! :FloatBorder [] {:fg neovim.blend :bg neovim.blend})
(custom-set-face! :NormalNC [] {:fg neovim.base05 :bg neovim.base00})
(custom-set-face! :TermCursor [] {:fg neovim.base00 :bg neovim.base04})
(custom-set-face! :TermCursorNC [] {:fg neovim.base00 :bg neovim.base04})

;; statusline/winbar

(custom-set-face! :StatusLine [] {:fg neovim.base04 :bg neovim.base00})
(custom-set-face! :StatusLineNC [] {:fg neovim.base04 :bg neovim.base01})
(custom-set-face! :StatusReplace [] {:fg neovim.base00 :bg neovim.base08})
(custom-set-face! :StatusInsert [] {:fg neovim.base00 :bg neovim.base12})
(custom-set-face! :StatusVisual [] {:fg neovim.base00 :bg neovim.base14})
(custom-set-face! :StatusTerminal [] {:fg neovim.base00 :bg neovim.base11})
(custom-set-face! :StatusNormal [] {:fg neovim.base00 :bg neovim.base15})
(custom-set-face! :StatusCommand [] {:fg neovim.base00 :bg neovim.base13})
(custom-set-face! :StatusLineDiagnosticWarn [:bold]
                  {:fg neovim.base14 :bg neovim.base00})
(custom-set-face! :StatusLineDiagnosticError [:bold]
                  {:fg neovim.base10 :bg neovim.base00})

;; telescope

(custom-set-face! :TelescopeBorder [] {:fg neovim.blend :bg neovim.blend})
(custom-set-face! :TelescopePromptBorder [] {:fg neovim.base02 :bg neovim.base02})
(custom-set-face! :TelescopePromptNormal [] {:fg neovim.base05 :bg neovim.base02})
(custom-set-face! :TelescopePromptPrefix [] {:fg neovim.base08 :bg neovim.base02})
(custom-set-face! :TelescopeNormal [] {:fg neovim.none :bg neovim.blend})
(custom-set-face! :TelescopePreviewTitle [] {:fg neovim.base02 :bg neovim.base12})
(custom-set-face! :TelescopePromptTitle [] {:fg neovim.base02 :bg neovim.base11})
(custom-set-face! :TelescopeResultsTitle [] {:fg neovim.blend :bg neovim.blend})
(custom-set-face! :TelescopeSelection [] {:fg neovim.none :bg neovim.base02})
(custom-set-face! :TelescopePreviewLine [] {:fg neovim.none :bg neovim.base01})
(custom-set-face! :TelescopeMatching [:bold :italic] {:fg neovim.base08 :bg neovim.none})

;; notify

(custom-set-face! :NotifyERRORBorder [] {:fg neovim.base08 :bg neovim.none})
(custom-set-face! :NotifyWARNBorder [] {:fg neovim.base14 :bg neovim.none})
(custom-set-face! :NotifyINFOBorder [] {:fg neovim.base05 :bg neovim.none})
(custom-set-face! :NotifyDEBUGBorder [] {:fg neovim.base13 :bg neovim.none})
(custom-set-face! :NotifyTRACEBorder [] {:fg neovim.base13 :bg neovim.none})
(custom-set-face! :NotifyERRORIcon [] {:fg neovim.base08 :bg neovim.none})
(custom-set-face! :NotifyWARNIcon [] {:fg neovim.base14 :bg neovim.none})
(custom-set-face! :NotifyINFOIcon [] {:fg neovim.base05 :bg neovim.none})
(custom-set-face! :NotifyDEBUGIcon [] {:fg neovim.base13 :bg neovim.none})
(custom-set-face! :NotifyTRACEIcon [] {:fg neovim.base13 :bg neovim.none})
(custom-set-face! :NotifyERRORTitle [] {:fg neovim.base08 :bg neovim.none})
(custom-set-face! :NotifyWARNTitle [] {:fg neovim.base14 :bg neovim.none})
(custom-set-face! :NotifyINFOTitle [] {:fg neovim.base05 :bg neovim.none})
(custom-set-face! :NotifyDEBUGTitle [] {:fg neovim.base13 :bg neovim.none})
(custom-set-face! :NotifyTRACETitle [] {:fg neovim.base13 :bg neovim.none})

;; cmp

(custom-set-face! :CmpItemAbbr [] {:fg "#adadad" :bg neovim.none})
(custom-set-face! :CmpItemAbbrMatch [:bold]
                  {:fg neovim.base05 :bg neovim.none})
(custom-set-face! :CmpItemAbbrMatchFuzzy [:bold]
                  {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :CmpItemMenu [:italic]
                  {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :CmpItemKindInterface [] {:fg neovim.base01 :bg neovim.base08})
(custom-set-face! :CmpItemKindColor [] {:fg neovim.base01 :bg neovim.base08})
(custom-set-face! :CmpItemKindTypeParameter [] {:fg neovim.base01 :bg neovim.base08})
(custom-set-face! :CmpItemKindText [] {:fg neovim.base01 :bg neovim.base09})
(custom-set-face! :CmpItemKindEnum [] {:fg neovim.base01 :bg neovim.base09})
(custom-set-face! :CmpItemKindKeyword [] {:fg neovim.base01 :bg neovim.base09})
(custom-set-face! :CmpItemKindConstant [] {:fg neovim.base01 :bg neovim.base10})
(custom-set-face! :CmpItemKindConstructor [] {:fg neovim.base01 :bg neovim.base10})
(custom-set-face! :CmpItemKindReference [] {:fg neovim.base01 :bg neovim.base10})
(custom-set-face! :CmpItemKindFunction [] {:fg neovim.base01 :bg neovim.base11})
(custom-set-face! :CmpItemKindStruct [] {:fg neovim.base01 :bg neovim.base11})
(custom-set-face! :CmpItemKindClass [] {:fg neovim.base01 :bg neovim.base11})
(custom-set-face! :CmpItemKindModule [] {:fg neovim.base01 :bg neovim.base11})
(custom-set-face! :CmpItemKindOperator [] {:fg neovim.base01 :bg neovim.base11})
(custom-set-face! :CmpItemKindField [] {:fg neovim.base01 :bg neovim.base12})
(custom-set-face! :CmpItemKindProperty [] {:fg neovim.base01 :bg neovim.base12})
(custom-set-face! :CmpItemKindEvent [] {:fg neovim.base01 :bg neovim.base12})
(custom-set-face! :CmpItemKindUnit [] {:fg neovim.base01 :bg neovim.base13})
(custom-set-face! :CmpItemKindSnippet [] {:fg neovim.base01 :bg neovim.base13})
(custom-set-face! :CmpItemKindFolder [] {:fg neovim.base01 :bg neovim.base13})
(custom-set-face! :CmpItemKindVariable [] {:fg neovim.base01 :bg neovim.base14})
(custom-set-face! :CmpItemKindFile [] {:fg neovim.base01 :bg neovim.base14})
(custom-set-face! :CmpItemKindMethod [] {:fg neovim.base01 :bg neovim.base15})
(custom-set-face! :CmpItemKindValue [] {:fg neovim.base01 :bg neovim.base15})
(custom-set-face! :CmpItemKindEnumMember [] {:fg neovim.base01 :bg neovim.base15})

;; nvimtree

(custom-set-face! :NvimTreeImageFile [] {:fg neovim.base12 :bg neovim.none})
(custom-set-face! :NvimTreeFolderIcon [] {:fg neovim.base12 :bg neovim.none})
(custom-set-face! :NvimTreeWinSeparator [] {:fg neovim.base00 :bg neovim.base00})
(custom-set-face! :NvimTreeFolderName [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :NvimTreeIndentMarker [] {:fg neovim.base02 :bg neovim.none})
(custom-set-face! :NvimTreeEmptyFolderName [] {:fg neovim.base15 :bg neovim.none})
(custom-set-face! :NvimTreeOpenedFolderName [] {:fg neovim.base15 :bg neovim.none})
(custom-set-face! :NvimTreeNormal [] {:fg neovim.base04 :bg neovim.base00})

;; neogit

(custom-set-face! :NeogitBranch [] {:fg neovim.base10 :bg neovim.none})
(custom-set-face! :NeogitRemote [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :NeogitHunkHeader [] {:fg neovim.base04 :bg neovim.base02})
(custom-set-face! :NeogitHunkHeaderHighlight [] {:fg neovim.base04 :bg neovim.base03})

;; gitsigns
(custom-set-face! :GitSignsCurrentLineBlame [] {:link "Comment" })

;; hydra

(custom-set-face! :HydraRed [] {:fg neovim.base12 :bg neovim.none})
(custom-set-face! :HydraBlue [] {:fg neovim.base09 :bg neovim.none})
(custom-set-face! :HydraAmaranth [] {:fg neovim.base10 :bg neovim.none})
(custom-set-face! :HydraTeal [] {:fg neovim.base08 :bg neovim.none})
(custom-set-face! :HydraHint [] {:fg neovim.none :bg neovim.blend})

;; alpha

(custom-set-face! :alpha1 [] {:fg neovim.base03 :bg neovim.none})
(custom-set-face! :alpha2 [] {:fg neovim.base04 :bg neovim.none})
(custom-set-face! :alpha3 [] {:fg neovim.base03 :bg neovim.none})

;; headlines.nvim

(custom-set-face! :CodeBlock [] {:fg neovim.none :bg neovim.base01})

;; nvim-bufferline

(custom-set-face! :BufferLineDiagnostic [:bold]
                  {:fg neovim.base10 :bg neovim.none})

(custom-set-face! :BufferLineDiagnosticVisible [:bold]
                  {:fg neovim.base10 :bg neovim.none})

;; preservim/vim-markdown

(custom-set-face! :htmlH1 [] {:link "markdownH1"})
(custom-set-face! :mkdRule [] {:link "markdownRule"})
(custom-set-face! :mkdListItem [] {:link "markdownListMarker"})
(custom-set-face! :mkdListItemCheckbox [] {:link "markdownListMarker"})

;; vimwiki/vimwiki

(custom-set-face! :VimwikiHeader1 [] {:link "markdownH1"})
(custom-set-face! :VimwikiHeader2 [] {:link "markdownH1"})
(custom-set-face! :VimwikiHeader3 [] {:link "markdownH1"})
(custom-set-face! :VimwikiHeader4 [] {:link "markdownH1"})
(custom-set-face! :VimwikiHeader5 [] {:link "markdownH1"})
(custom-set-face! :VimwikiHeader6 [] {:link "markdownH1"})
(custom-set-face! :VimwikiHeaderChar [] {:link "markdownH1"})
(custom-set-face! :VimwikiList [] {:link "markdownListMarker"})
(custom-set-face! :VimwikiLink [] {:link "markdownUrl"})
(custom-set-face! :VimwikiCode [] {:link "markdownCode"})

;; flash

(custom-set-face! :FlashLabel [:bold] {:fg neovim.base05 :bg neovim.base00})

;; blink

(custom-set-face! :BlinkCmpMenu [] {:link "Pmenu"})
(custom-set-face! :BlinkCmpLabel [] {:fg neovim.base04 :bg neovim.base01})
(custom-set-face! :BlinkCmpMenuSelection [] {:fg neovim.none :bg neovim.base02})
(custom-set-face! :BlinkCmpLabelMatch [:bold]
                  {:fg neovim.base14 :bg neovim.none})
(custom-set-face! :BlinkCmpKind [] {:fg neovim.base01 :bg neovim.base09})

(custom-set-face! :BlinkCmpKindText [] {:fg neovim.base01 :bg neovim.base09})
(custom-set-face! :BlinkCmpKindEnum [] {:fg neovim.base01 :bg neovim.base09})
(custom-set-face! :BlinkCmpKindKeyword [] {:fg neovim.base01 :bg neovim.base09})
(custom-set-face! :BlinkCmpKindConstant [] {:fg neovim.base01 :bg neovim.base10})
(custom-set-face! :BlinkCmpKindConstructor [] {:fg neovim.base01 :bg neovim.base10})
(custom-set-face! :BlinkCmpKindReference [] {:fg neovim.base01 :bg neovim.base10})
(custom-set-face! :BlinkCmpKindFunction [] {:fg neovim.base01 :bg neovim.base11})
(custom-set-face! :BlinkCmpKindStruct [] {:fg neovim.base01 :bg neovim.base11})
(custom-set-face! :BlinkCmpKindClass [] {:fg neovim.base01 :bg neovim.base11})
(custom-set-face! :BlinkCmpKindModule [] {:fg neovim.base01 :bg neovim.base11})
(custom-set-face! :BlinkCmpKindOperator [] {:fg neovim.base01 :bg neovim.base11})
(custom-set-face! :BlinkCmpKindField [] {:fg neovim.base01 :bg neovim.base12})
(custom-set-face! :BlinkCmpKindProperty [] {:fg neovim.base01 :bg neovim.base14})
(custom-set-face! :BlinkCmpKindEvent [] {:fg neovim.base01 :bg neovim.base12})
(custom-set-face! :BlinkCmpKindUnit [] {:fg neovim.base01 :bg neovim.base13})
(custom-set-face! :BlinkCmpKindSnippet [] {:fg neovim.base01 :bg neovim.base13})
(custom-set-face! :BlinkCmpKindFolder [] {:fg neovim.base01 :bg neovim.base13})
(custom-set-face! :BlinkCmpKindVariable [] {:fg neovim.base01 :bg neovim.base14})
(custom-set-face! :BlinkCmpKindFile [] {:fg neovim.base01 :bg neovim.base14})
(custom-set-face! :BlinkCmpKindMethod [] {:fg neovim.base01 :bg neovim.base15})
(custom-set-face! :BlinkCmpKindValue [] {:fg neovim.base01 :bg neovim.base15})
(custom-set-face! :BlinkCmpKindEnumMember [] {:fg neovim.base01 :bg neovim.base15})
(custom-set-face! :BlinkCmpDoc [] {:link "Pmenu"})

{ : neovim }
