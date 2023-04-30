# made this oct 2022, also see the env var in bashrc
# this is run as r code, so need to use Sys, e.g.:
# Sys.setenv(key = "value")

# see prominent r developer profile: https://github.com/randy3k/dotfiles/blob/master/.Rprofile

# type into an r terminal to see where libraries are installed:
# .libPaths()

# In vscode, to make self-managed R sessions behave like those created by "R: Create R terminal", the following code should be added to ~/.Rprofile (https://github.com/REditorSupport/vscode-R/wiki/Interacting-with-R-terminals):
 # (the httpgd part came from here: (http://aeturrell.com/2021/11/04/setting-up-r-in-vscode/)
if (interactive() && Sys.getenv("RSTUDIO") == "") { 
	Sys.setenv(TERM_PROGRAM = "vscode") 
	if ("httpgd" %in% .packages(all.available = TRUE)) { 
		options(vsc.plot = FALSE) 
		options(device = function(...) { 
			httpgd::hgd(silent = TRUE) 
			.vsc.browser(httpgd::hgd_url(history = FALSE), viewer = "Beside") 
		}
		) 
	} 
	source(file.path(Sys.getenv(
		if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"
			), ".vscode-R", "init.R")) 
}
