#compdef deno

autoload -U is-at-least

_deno() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
":: :_deno_commands" \
"*::: :->deno" \
&& ret=0
    case $state in
    (deno)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:deno-command-$line[1]:"
        case $line[1] in
            (bundle)
_arguments "${_arguments_options[@]}" \
'--cert=[Load certificate authority from PEM encoded file]' \
'--importmap=[UNSTABLE: Load import map file]' \
'-c+[Load tsconfig.json configuration file]' \
'--config=[Load tsconfig.json configuration file]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--unstable[Enable unstable APIs]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
':source_file:_files' \
'::out_file:_files' \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
':shell:(zsh bash fish powershell elvish)' \
&& ret=0
;;
(eval)
_arguments "${_arguments_options[@]}" \
'--inspect=[activate inspector on host:port (default: 127.0.0.1:9229)]' \
'--inspect-brk=[activate inspector on host:port and break at start of user script]' \
'--cert=[Load certificate authority from PEM encoded file]' \
'--v8-flags=[Set V8 command line options. For help: --v8-flags=--help]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--unstable[Enable unstable APIs]' \
'-T[Treat eval input as TypeScript]' \
'--ts[Treat eval input as TypeScript]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
':code:_files' \
&& ret=0
;;
(cache)
_arguments "${_arguments_options[@]}" \
'-r+[Reload source code cache (recompile TypeScript)]' \
'--reload=[Reload source code cache (recompile TypeScript)]' \
'--lock=[Check the specified lock file]' \
'--importmap=[UNSTABLE: Load import map file]' \
'-c+[Load tsconfig.json configuration file]' \
'--config=[Load tsconfig.json configuration file]' \
'--cert=[Load certificate authority from PEM encoded file]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--lock-write[Write lock file. Use with --lock.]' \
'--unstable[Enable unstable APIs]' \
'--no-remote[Do not resolve remote modules]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
':file:_files' \
&& ret=0
;;
(fmt)
_arguments "${_arguments_options[@]}" \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--check[Check if the source files are formatted.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
'::files:_files' \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" \
'--cert=[Load certificate authority from PEM encoded file]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--unstable[Enable unstable APIs]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
'::file:_files' \
&& ret=0
;;
(install)
_arguments "${_arguments_options[@]}" \
'--allow-read=[Allow file system read access]' \
'--allow-write=[Allow file system write access]' \
'--allow-net=[Allow network access]' \
'-n+[Executable file name]' \
'--name=[Executable file name]' \
'--root=[Installation root]' \
'--cert=[Load certificate authority from PEM encoded file]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--allow-env[Allow environment access]' \
'--allow-run[Allow running subprocesses]' \
'--allow-plugin[Allow loading plugins]' \
'--allow-hrtime[Allow high resolution time measurement]' \
'-A[Allow all permissions]' \
'--allow-all[Allow all permissions]' \
'-f[Forcefully overwrite existing installation]' \
'--force[Forcefully overwrite existing installation]' \
'--unstable[Enable unstable APIs]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
':cmd:_files' \
&& ret=0
;;
(repl)
_arguments "${_arguments_options[@]}" \
'--inspect=[activate inspector on host:port (default: 127.0.0.1:9229)]' \
'--inspect-brk=[activate inspector on host:port and break at start of user script]' \
'--v8-flags=[Set V8 command line options. For help: --v8-flags=--help]' \
'--cert=[Load certificate authority from PEM encoded file]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--unstable[Enable unstable APIs]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
&& ret=0
;;
(run)
_arguments "${_arguments_options[@]}" \
'--inspect=[activate inspector on host:port (default: 127.0.0.1:9229)]' \
'--inspect-brk=[activate inspector on host:port and break at start of user script]' \
'--allow-read=[Allow file system read access]' \
'--allow-write=[Allow file system write access]' \
'--allow-net=[Allow network access]' \
'--importmap=[UNSTABLE: Load import map file]' \
'-r+[Reload source code cache (recompile TypeScript)]' \
'--reload=[Reload source code cache (recompile TypeScript)]' \
'-c+[Load tsconfig.json configuration file]' \
'--config=[Load tsconfig.json configuration file]' \
'--lock=[Check the specified lock file]' \
'--v8-flags=[Set V8 command line options. For help: --v8-flags=--help]' \
'--cert=[Load certificate authority from PEM encoded file]' \
'--seed=[Seed Math.random()]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--allow-env[Allow environment access]' \
'--allow-run[Allow running subprocesses]' \
'--allow-plugin[Allow loading plugins]' \
'--allow-hrtime[Allow high resolution time measurement]' \
'-A[Allow all permissions]' \
'--allow-all[Allow all permissions]' \
'--unstable[Enable unstable APIs]' \
'--lock-write[Write lock file. Use with --lock.]' \
'--no-remote[Do not resolve remote modules]' \
'--cached-only[Require that remote dependencies are already cached]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
':script_arg -- script args:_files' \
&& ret=0
;;
(test)
_arguments "${_arguments_options[@]}" \
'--inspect=[activate inspector on host:port (default: 127.0.0.1:9229)]' \
'--inspect-brk=[activate inspector on host:port and break at start of user script]' \
'--allow-read=[Allow file system read access]' \
'--allow-write=[Allow file system write access]' \
'--allow-net=[Allow network access]' \
'--importmap=[UNSTABLE: Load import map file]' \
'-r+[Reload source code cache (recompile TypeScript)]' \
'--reload=[Reload source code cache (recompile TypeScript)]' \
'-c+[Load tsconfig.json configuration file]' \
'--config=[Load tsconfig.json configuration file]' \
'--lock=[Check the specified lock file]' \
'--v8-flags=[Set V8 command line options. For help: --v8-flags=--help]' \
'--cert=[Load certificate authority from PEM encoded file]' \
'--seed=[Seed Math.random()]' \
'--filter=[A pattern to filter the tests to run by]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--allow-env[Allow environment access]' \
'--allow-run[Allow running subprocesses]' \
'--allow-plugin[Allow loading plugins]' \
'--allow-hrtime[Allow high resolution time measurement]' \
'-A[Allow all permissions]' \
'--allow-all[Allow all permissions]' \
'--unstable[Enable unstable APIs]' \
'--lock-write[Write lock file. Use with --lock.]' \
'--no-remote[Do not resolve remote modules]' \
'--cached-only[Require that remote dependencies are already cached]' \
'--failfast[Stop on first error]' \
'--allow-none[Don'\''t return error code if no test files are found]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
'::files -- List of file names to run:_files' \
&& ret=0
;;
(types)
_arguments "${_arguments_options[@]}" \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--unstable[Enable unstable APIs]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
&& ret=0
;;
(upgrade)
_arguments "${_arguments_options[@]}" \
'--version=[The version to upgrade to]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--dry-run[Perform all checks without replacing old exe]' \
'-f[Replace current exe even if not out-of-date]' \
'--force[Replace current exe even if not out-of-date]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
&& ret=0
;;
(doc)
_arguments "${_arguments_options[@]}" \
'-r+[Reload source code cache (recompile TypeScript)]' \
'--reload=[Reload source code cache (recompile TypeScript)]' \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'--unstable[Enable unstable APIs]' \
'--json[Output documentation in JSON format.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
'::source_file:_files' \
'::filter -- Dot separated path to symbol.:_files' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
'-L+[Set log level]: :(debug info)' \
'--log-level=[Set log level]: :(debug info)' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'-q[Suppress diagnostic output]' \
'--quiet[Suppress diagnostic output]' \
&& ret=0
;;
        esac
    ;;
esac
}

(( $+functions[_deno_commands] )) ||
_deno_commands() {
    local commands; commands=(
        "bundle:Bundle module and dependencies into single file" \
"completions:Generate shell completions" \
"eval:Eval script" \
"cache:Cache the dependencies" \
"fmt:Format source files" \
"info:Show info about cache or info related to source file" \
"install:Install script as an executable" \
"repl:Read Eval Print Loop" \
"run:Run a program given a filename or url to the module" \
"test:Run tests" \
"types:Print runtime TypeScript declarations" \
"upgrade:Upgrade deno executable to given version" \
"doc:Show documentation for a module" \
"help:Prints this message or the help of the given subcommand(s)" \
    )
    _describe -t commands 'deno commands' commands "$@"
}
(( $+functions[_deno__bundle_commands] )) ||
_deno__bundle_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno bundle commands' commands "$@"
}
(( $+functions[_deno__cache_commands] )) ||
_deno__cache_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno cache commands' commands "$@"
}
(( $+functions[_deno__completions_commands] )) ||
_deno__completions_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno completions commands' commands "$@"
}
(( $+functions[_deno__doc_commands] )) ||
_deno__doc_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno doc commands' commands "$@"
}
(( $+functions[_deno__eval_commands] )) ||
_deno__eval_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno eval commands' commands "$@"
}
(( $+functions[_deno__fmt_commands] )) ||
_deno__fmt_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno fmt commands' commands "$@"
}
(( $+functions[_deno__help_commands] )) ||
_deno__help_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno help commands' commands "$@"
}
(( $+functions[_deno__info_commands] )) ||
_deno__info_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno info commands' commands "$@"
}
(( $+functions[_deno__install_commands] )) ||
_deno__install_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno install commands' commands "$@"
}
(( $+functions[_deno__repl_commands] )) ||
_deno__repl_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno repl commands' commands "$@"
}
(( $+functions[_deno__run_commands] )) ||
_deno__run_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno run commands' commands "$@"
}
(( $+functions[_deno__test_commands] )) ||
_deno__test_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno test commands' commands "$@"
}
(( $+functions[_deno__types_commands] )) ||
_deno__types_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno types commands' commands "$@"
}
(( $+functions[_deno__upgrade_commands] )) ||
_deno__upgrade_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'deno upgrade commands' commands "$@"
}

_deno "$@"