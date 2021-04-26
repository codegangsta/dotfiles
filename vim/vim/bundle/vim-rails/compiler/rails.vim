" Vim compiler file

if exists("current_compiler")
  finish
endif

CompilerSet errorformat=%D(in\ %f),
      \%\\s%#from\ %f:%l:%m,
      \%\\s%#from\ %f:%l:,
      \%\\s%##\ %f:%l:%m,
      \%\\s%##\ %f:%l,
      \%\\s%#[%f:%l:\ %#%m,
      \%\\s%#%f:%l:\ %#%m,
      \%\\s%#%f:%l:,
      \%m\ [%f:%l]:,
      \%+Erake\ aborted!,
      \%+EDon't\ know\ how\ to\ build\ task\ %.%#,
      \%+Einvalid\ option:%.%#,
      \%+Irake\ %\\S%\\+%\\s%\\+#\ %.%#

runtime! compiler/rake.vim

let current_compiler = "rails"

CompilerSet makeprg=rails
" CompilerSet makeprg=ruby\ bin/rails
" CompilerSet makeprg=ruby\ script/rails

CompilerSet errorformat^=
      \%\\S%\\+\ \ %#%[cefi]%[rxod]%[eir]%[a-z]%#%\\x1b[0m\ %\\+%\\S%\\+%$
      \%\\&%\\x1b%\\S%\\+\ \ %#%m%\\>%\\x1b[0m\ \ %#%f,
      \%\\s\ %#%[cefi]%[rxod]%[eir]%[a-z]%#\ %\\+%\\S%\\+%$
      \%\\&%\\s\ %#%m%\\>\ \ %#%f,
      \\ %#Overwrite%.%#%\\S%\\+\ \ %#%m%\\x1b[0m\ \ %#%f,
      \%-G\ %#Overwrite%.%#\"h\"%.%#,
      \%+GStarted\ %\\u%\\u%.%#,
      \%+GCompleted\ %\\d%\\d%\\d%.%#,
      \%+G[ActiveJob]%.%#]\ Perform%.%#,
      \%.%#rails\ test\ %f:%l,
      \%+GCurrent\ version:%.%#,
      \%+G\ %#Status\ %#Migration\ ID%.%#,
      \%+G\ The\ fixture\ ID\ for\ %.%#,
      \%f:\ %s\ (%m)%$
      \%\\&%.%#/fixtures/%.%#(%\\d%\\+),
      \%+G\ %#Prefix\ %#Verb%.%#,
      \%+G\ %#Code\ LOC:\ %.%#,
      \%+GAbout\ your\ application's\ environment,
      \%+Grun\ %\\S%#::Application.routes,
      \%+Irails\ %\\S%\\+%\\s%\\+#\ %.%#,
      \%+Eruby:%.%#(LoadError),
      \%+EUsage:%.%#,
      \%+ECould\ not\ find\ generator%.%#,
      \%+EType\ 'rails'\ for\ help.,
      \%\\&completion=rails#complete_rails,
      \%\\&start=console,
      \%\\&terminal=%\\C%\\%%(console%\\\|dbconsole%\\\|server%\\\|%[cs]%\\\|db%\\)%\\>:%\\@!%\\ze%.%#,
      \%\\&force_start=%\\C%\\%%(console%\\\|dbconsole%\\\|server%\\\|%[cs]%\\\|db%\\)%\\>:%\\@!%\\ze%.%#,
      \%\\&default=default

" -complete=customlist,rails#complete_rails
