// Code generated by ""fitask" -type=VPC"; DO NOT EDIT

package awstasks

import (
	"encoding/json"

	"k8s.io/kube-deploy/upup/pkg/fi"
)

// VPC

// JSON marshalling boilerplate
type realVPC VPC

func (o *VPC) UnmarshalJSON(data []byte) error {
	var jsonName string
	if err := json.Unmarshal(data, &jsonName); err == nil {
		o.Name = &jsonName
		return nil
	}

	var r realVPC
	if err := json.Unmarshal(data, &r); err != nil {
		return err
	}
	*o = VPC(r)
	return nil
}

var _ fi.HasName = &VPC{}

func (e *VPC) GetName() *string {
	return e.Name
}

func (e *VPC) SetName(name string) {
	e.Name = &name
}

func (e *VPC) String() string {
	return fi.TaskAsString(e)
}
