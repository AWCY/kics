package Cx

import data.generic.common as common_lib
import data.generic.terraform as tf_lib

CxPolicy[result] {
	resource := input.document[i].resource.aws_cloudtrail[name]
	resource.enable_log_file_validation == false

	result := {
		"documentId": input.document[i].id,
		"resourceType": "aws_cloudtrail",
		"resourceName": tf_lib.get_resource_name(resource, name),
		"searchKey": sprintf("aws_cloudtrail[%s].enable_log_file_validation", [name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": sprintf("'aws_cloudtrail[%s].enable_log_file_validation' is true", [name]),
		"keyActualValue": sprintf("'aws_cloudtrail[%s].enable_log_file_validation' is false", [name]),
	}
}

CxPolicy[result] {
	resource := input.document[i].resource.aws_cloudtrail[name]
	not common_lib.valid_key(resource, "enable_log_file_validation")

	result := {
		"documentId": input.document[i].id,
		"resourceType": "aws_cloudtrail",
		"resourceName": tf_lib.get_resource_name(resource, name),
		"searchKey": sprintf("aws_cloudtrail[%s]", [name]),
		"issueType": "MissingAttribute",
		"keyExpectedValue": sprintf("'aws_cloudtrail[%s].enable_log_file_validation' is set", [name]),
		"keyActualValue": sprintf("'aws_cloudtrail[%s].enable_log_file_validation' is undefined", [name]),
	}
}
