require 'rocket_fuel/fix/command_line_tools/dmg_metadata'

module RocketFuel
  module Fix
    module CommandLineTools
      class Install
        def initialize(dmg_path)
          @dmg_path = dmg_path
          @metadata = DmgMetadata.new(dmg_path)
        end

        def run
          #sudo before the work needs to be done to improve clarity of prompt
          `sudo echo `
          `echo Y | PAGER=true hdiutil attach '#{@dmg_path}' -quiet `
          `sudo installer -pkg '/Volumes/#{volume_dir}/#{pkg_name}.pkg' -target /`
          `hdiutil detach '/Volumes/#{volume_dir}' || hdiutil detach '/Volumes/#{volume_dir}' -force`
        end

        protected
        def volume_dir
          @metadata.volume_dir
        end

        def pkg_name
          @metadata.pkg_name
        end
      end
    end
  end
end
