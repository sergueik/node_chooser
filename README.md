### Info 


This is the standalone tiny node mapping data browser application based on
[stackoverflow example](https://stackoverflow.com/questions/7346563/loading-local-json-file) and [how to work with yaml files](https://stackoverflow.com/questions/9043765/how-to-parse-yaml-in-the-browser)

![OSX Example](https://github.com/sergueik/node_chooser/blob/master/screenshots/osx_chrome_loaded.png)

![Windows Example](https://github.com/sergueik/node_chooser/blob/master/screenshots/windows_chrome.png)

It processes the configuration file in yaml format which looks like
```yaml
node-ad8c3125.domain.com:
  datacenter: 'miami'
  consul_node_name: consul-service-discovery-server
  branch_name: 'uat'
  environment: 'prod'
  dc: 'bcp'
  param1: 
    - 'a'
    - 'b'
    - 'c'
  param2: 
    key1: 'value1'
    key2: 'value2'
  param3: 'data'
```
node set describing the cluster and evaluates the node hostname key based on combination of envionment, role and data center the node belongs, discarding non-essential information in `param` and also handling redundancy of legacy definitions (like synonims in subkeys like `environment =  test_bcp` and `environment = test`).
The page handles sorting and filtering the node items. It has to be loaded in the Chrome browser from the local file:

 
![OSX starting](https://github.com/sergueik/node_chooser/blob/master/screenshots/osx_open_capture.png)

### Note

There was [earlier work](https://github.com/sergueik/powershell_ui_samples/blob/master/node_selector_sample.ps1) for the same purpose through powershell 

![Windows PowershellExample](https://github.com/sergueik/node_chooser/blob/master/screenshots/windows_powershell.png)

### See also

  * [FileReader](http://www.html5rocks.com/en/tutorials/file/dndfiles/)
  * [standalone yaml parser javsctit package](https://github.com/nodeca/js-yaml)
  * [pure javascript file loader](https://codepen.io/KryptoniteDove/post/load-json-file-locally-using-pure-javascript) -  not applicable for local file case

### Author

[Serguei Kouzmine](kouzmine_serguei@yahoo.com)
