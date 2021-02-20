# -*- encoding: utf-8 -*-
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module Kitchen
  module Provisioner
    module Ansible
      class Os
        class ArchLinux < Os
          def update_packages_command
            @config[:update_package_repos] ? "#{sudo_env('pacman')} -Syu --noconfirm" : nil
          end
          def install_command
            <<-INSTALL
            if [ ! $(which ansible) ]; then
              #{sudo_env('pacman')} -Syu --noconfirm
              #{sudo_env('pacman')} -S ansible --needed --noconfirm
            fi
            INSTALL
          end
        end
      end
    end
  end
end
