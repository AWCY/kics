package Cx

import data.generic.terraform as tf_lib

CxPolicy[result] {
	resource := input.document[i].resource.azurerm_postgresql_configuration[var0]

	is_string(resource.name)
	name := lower(resource.name)

	is_string(resource.value)
	value := upper(resource.value)

	name == "connection_throttling"
	value != "ON"

	result := {
		"documentId": input.document[i].id,
		"resourceType": "azurerm_postgresql_configuration",
		"resourceName": tf_lib.get_resource_name(resource, name),
		"searchKey": sprintf("azurerm_postgresql_configuration[%s].value", [var0]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": sprintf("'azurerm_postgresql_configuration.%s.value' should be 'ON'", [var0]),
		"keyActualValue": sprintf("'azurerm_postgresql_configuration.%s.value' is 'OFF'", [var0]),
	}
}
