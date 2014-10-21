module RocketFuel
  module Fix
    module CommandLineTools
      class DmgMetadata
        def initialize(dmg_path)
          @dmg_path = dmg_path
          @os = RocketFuel::SystemDetails.os.minor_version
        end

        def volume_dir
          if map[@os]
            map[@os]['volume_dir']
          end
        end

        def pkg_name
          if map[@os]
            map[@os]['pkg_name']
          end
        end

        protected
        def map
          @map ||= {
            '10.10' => {
              'volume_dir' => 'Command Line Developer Tools',
              'pkg_name'    => 'Command Line Tools (OS X 10.10)'
            },
            '10.9' => {
              'volume_dir' => 'Command Line Developer Tools',
              'pkg_name' => 'Command Line Tools (OS X 10.9)'
            },
            '10.8' => {
              'volume_dir' => 'Command Line Tools (Mountain Lion)',
              'pkg_name' => 'Command Line Tools (Mountain Lion)'
            },
            '10.7' => {
              'volume_dir' => 'Command Line Tools (Lion)',
              'pkg_name' => 'Command Line Tools (Lion)'
            }
          }
        end
      end
    end
  end
end
