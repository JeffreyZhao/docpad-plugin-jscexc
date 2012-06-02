# Export Plugin
module.exports = (BasePlugin) ->
    # Define Plugin
    class JscexcPlugin extends BasePlugin
        name: "jscexc"
        
        # Render some content
        render: (opts, next) ->
            # Prepare
            {inExtension, outExtension, templateData, file} = opts

            # Check extensions
            if inExtension in ['jscex'] and outExtension in ['js']
                # Requires
                jscexc = require('jscexc')

                # Render
                opts.content = jscexc.compile(opts.content)
        
            # Done, return back to DocPad
            return next()