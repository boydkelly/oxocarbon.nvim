.PHONY: all lua

all: lua

lua:
	nvim --headless -c "fennel make.fnl" +qa
