require 'fileutils'
module RocketFuel
  module Fix
    class FileSanitizerFix < AbstractFix
      def run
        self.class.files_to_remove.each do |path|
          if FileTest.exist?(path)
            FileUtils.rm_rf(path)
          end
        end
      end

      class << self
        def remove_file(file)
          @files_to_remove ||= []
          @files_to_remove << file
        end

        def files_to_remove
          @files_to_remove
        end
      end
    end
  end
end
