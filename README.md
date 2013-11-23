dev_world Cookbook
==================

俺のための開発環境を整備するレシピ

### Vagrantと組み合わせる場合

Vagrantfileの設置に、以下を記述


```ruby
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "yum::epel",
      "mercurial::default",
      "java",
      "dev_world",
      "dev_world::runcommand",
      "dev_world::java_devel",
      "dev_world::desktop"
    ]

    chef.json = {
        :"java" => {
            :"install_flavor" => "oracle",
            :"jdk_version" => 7,
            :"java_home" => "/usr/java/default",
            :"oracle" => {
              :"accept_oracle_download_terms" => true
            }
        }
    }
  end
 ```