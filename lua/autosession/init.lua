local options = {
    -- -- Sets the log level of the plugin (debug, info, error)
    -- logLevel = vim.g.auto_session_log_level or AutoSession.conf.logLevel or
    --     'info',
    -- Root dir where sessions will be stored
    auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
    -- Enables/disables auto save/restore
    auto_session_enabled = true
}

require('auto-session').setup(options)
