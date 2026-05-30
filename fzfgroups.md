| Highlight Group         | Default          | Override Via         | Notes                                 |
| ----------------------- | ---------------- | -------------------- | ------------------------------------- |
| FzfLuaNormal            | Normal           | `hls.normal`         | Main win `fg/bg`                      |
| FzfLuaBorder            | Normal           | `hls.border`         | Main win border                       |
| FzfLuaTitle             | FzfLuaNormal     | `hls.title`          | Main win title                        |
| FzfLuaTitleFlags        | CursorLine       | `hls.title_flags`    | Main win title flags                  |
| FzfLuaPreviewNormal     | FzfLuaNormal     | `hls.preview_normal` | Builtin preview `fg/bg`               |
| FzfLuaPreviewBorder     | FzfLuaBorder     | `hls.preview_border` | Builtin preview border                |
| FzfLuaPreviewTitle      | FzfLuaTitle      | `hls.preview_title`  | Builtin preview title                 |
| FzfLuaCursor            | Cursor           | `hls.cursor`         | Builtin preview `Cursor`              |
| FzfLuaCursorLine        | CursorLine       | `hls.cursorline`     | Builtin preview `Cursorline`          |
| FzfLuaCursorLineNr      | CursorLineNr     | `hls.cursorlinenr`   | Builtin preview `CursorLineNr`        |
| FzfLuaSearch            | IncSearch        | `hls.search`         | Builtin preview search matches        |
| FzfLuaScrollBorderEmpty | FzfLuaBorder     | `hls.scrollborder_e` | Builtin preview `border` scroll empty |
| FzfLuaScrollBorderFull  | FzfLuaBorder     | `hls.scrollborder_f` | Builtin preview `border` scroll full  |
| FzfLuaScrollFloatEmpty  | PmenuSbar        | `hls.scrollfloat_e`  | Builtin preview `float` scroll empty  |
| FzfLuaScrollFloatFull   | PmenuThumb       | `hls.scrollfloat_f`  | Builtin preview `float` scroll full   |
| FzfLuaHelpNormal        | FzfLuaNormal     | `hls.help_normal`    | Help win `fg/bg`                      |
| FzfLuaHelpBorder        | FzfLuaBorder     | `hls.help_border`    | Help win border                       |
| FzfLuaBufName           | Directory        | `hls.buf_name`       | Buffer name (`lines`)                 |
| FzfLuaBufId             | TabLine          | `hls.buf_id`         | Buffer ID (`lines`)                   |
| FzfLuaBufLineNr         | LineNr           | `hls.buf_linenr`     | Buffer line nr (`lines,blines`)       |
| FzfLuaDirIcon           | Directory        | `hls.dir_icon`       | Paths directory icon                  |
| FzfLuaDirPart           | Comment          | `hls.dir_part`       | Path formatters directory hl group    |
| FzfLuaFilePart          | @none            | `hls.file_part`      | Path formatters file hl group         |
| FzfLuaFzfNormal         | FzfLuaNormal     | `fzf.normal`         | fzf's `fg\|bg`                        |
| FzfLuaFzfCursorLine     | FzfLuaCursorLine | `fzf.cursorline`     | fzf's `fg+\|bg+`                      |
| FzfLuaFzfMatch          | Special          | `fzf.match`          | fzf's `hl+`                           |
| FzfLuaFzfBorder         | FzfLuaBorder     | `fzf.border`         | fzf's `border`                        |
| FzfLuaFzfScrollbar      | FzfLuaFzfBorder  | `fzf.scrollbar`      | fzf's `scrollbar`                     |
| FzfLuaFzfSeparator      | FzfLuaFzfBorder  | `fzf.separator`      | fzf's `separator`                     |
| FzfLuaFzfGutter         | FzfLuaNormal     | `fzf.gutter`         | fzf's `gutter` (hl `bg` is used)      |
| FzfLuaFzfHeader         | FzfLuaTitle      | `fzf.header`         | fzf's `header`                        |
| FzfLuaFzfInfo           | NonText          | `fzf.info`           | fzf's `info`                          |
| FzfLuaFzfPointer        | Special          | `fzf.pointer`        | fzf's `pointer`                       |
| FzfLuaFzfMarker         | FzfLuaFzfPointer | `fzf.marker`         | fzf's `marker`                        |
| FzfLuaFzfSpinner        | FzfLuaFzfPointer | `fzf.spinner`        | fzf's `spinner`                       |
| FzfLuaFzfPrompt         | Special          | `fzf.prompt`         | fzf's `prompt`                        |
| FzfLuaFzfQuery          | FzfLuaNormal     | `fzf.query`          | fzf's `header`                        |
| FzfLuaBackdrop          | \*bg=Black       | `hls.backdrop`       | Backdrop color                        |
| FzfLuaHeaderBind        | \*BlanchedAlmond | `hls.header_bind`    | Header keybind                        |
| FzfLuaHeaderText        | \*Brown1         | `hls.header_text`    | Header text                           |
| FzfLuaPathColNr         | \*CadetBlue1 C   | `hls.path_colnr`     | Path col nr (`qf,lsp,diag`)           |
| FzfLuaPathLineNr        | \*LightGreen     | `hls.path_linenr`    | Path line nr (`qf,lsp,diag`)          |
| FzfLuaBufNr             | \*BlanchedAlmond | `hls.buf_nr`         | Buffer number (`buffers,tabs`)        |
| FzfLuaBufFlagCur        | \*Brown1         | `hls.buf_flag_cur`   | Buffer line (`buffers`)               |
| FzfLuaBufFlagAlt        | \*CadetBlue1     | `hls.buf_flag_alt`   | Buffer line (`buffers`)               |
| FzfLuaTabTitle          | \*LightSkyBlue1  | `hls.tab_title`      | Tab title (`tabs`)                    |
| FzfLuaTabMarker         | \*BlanchedAlmond | `hls.tab_marker`     | Tab marker (`tabs`)                   |
| FzfLuaLivePrompt        | \*PaleVioletRed1 | `hls.live_prompt`    | "live" queries prompt text            |
| FzfLuaLiveSym           | \*PaleVioletRed1 | `hls.live_sym`       | LSP live symbols query match          |

FzfLuaBackdrop
FzfLuaHeaderBind
FzfLuaHeaderText
FzfLuaPathColNr
FzfLuaPathLineNr
FzfLuaBufNr
FzfLuaBufFlagCur
FzfLuaBufFlagAlt
FzfLuaTabTitle
FzfLuaTabMarker
FzfLuaLivePrompt
FzfLuaLiveSym
