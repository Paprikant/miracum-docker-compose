# IRIDA plugins

IRIDA plugins can be used to make galaxy workflows available in the IRIDA UI
developer documentation may be found [here](https://phac-nml.github.io/irida-documentation/developer/tools/pipelines)

The process goes somethin like this:
* create galaxy workflow 
> :warning: only one workflow of type *collection of list:paired* is allowed (and required)
> output files will be detected if the outputs checkmark is set in galaxy, a label is assigned and the file is renamed using *rename output*
* export galaxy workflow (.ga file)
* java -jar ga2xml.jar -i workflow.ga -o output
> this will create workflow and metadata files in output/<workflow name>
* clone the [sample plugin](https://github.com/phac-nml/irida-plugin-example.git)
* add workflow from output/<workflow name> src/resources/... in the plugin
* use `mvn clean package` to build the plugin
> plugin will be in target/ directory
