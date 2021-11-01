-- find_root looks for parent directories relative to the current buffer containing one of the given arguments.
require('jdtls').start_or_attach({
    cmd = {'jdtls-nvim'},
    root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'})
})
