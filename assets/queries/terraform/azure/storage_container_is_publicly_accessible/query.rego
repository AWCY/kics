package Cx

import data.generic.terraform as tf_lib

CxPolicy[result] {
	resource := input.document[i].resource.azurerm_storage_container[name]

	resource.container_access_type != "private"

	result := {
		"documentId": input.document[i].id,
		"resourceType": "azurerm_storage_container",
		"resourceName": tf_lib.get_resource_name(resource, name),
		"searchKey": sprintf("azurerm_storage_container[%s].container_access_type", [name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "'container_access_type' is equal to 'private'",
		"keyActualValue": "'container_access_type' is not equal to 'private'",
	}
}
