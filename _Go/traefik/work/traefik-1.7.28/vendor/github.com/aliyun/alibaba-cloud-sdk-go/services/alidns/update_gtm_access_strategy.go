package alidns

//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.
//
// Code generated by Alibaba Cloud SDK Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

import (
	"github.com/aliyun/alibaba-cloud-sdk-go/sdk/requests"
	"github.com/aliyun/alibaba-cloud-sdk-go/sdk/responses"
)

// UpdateGtmAccessStrategy invokes the alidns.UpdateGtmAccessStrategy API synchronously
// api document: https://help.aliyun.com/api/alidns/updategtmaccessstrategy.html
func (client *Client) UpdateGtmAccessStrategy(request *UpdateGtmAccessStrategyRequest) (response *UpdateGtmAccessStrategyResponse, err error) {
	response = CreateUpdateGtmAccessStrategyResponse()
	err = client.DoAction(request, response)
	return
}

// UpdateGtmAccessStrategyWithChan invokes the alidns.UpdateGtmAccessStrategy API asynchronously
// api document: https://help.aliyun.com/api/alidns/updategtmaccessstrategy.html
// asynchronous document: https://help.aliyun.com/document_detail/66220.html
func (client *Client) UpdateGtmAccessStrategyWithChan(request *UpdateGtmAccessStrategyRequest) (<-chan *UpdateGtmAccessStrategyResponse, <-chan error) {
	responseChan := make(chan *UpdateGtmAccessStrategyResponse, 1)
	errChan := make(chan error, 1)
	err := client.AddAsyncTask(func() {
		defer close(responseChan)
		defer close(errChan)
		response, err := client.UpdateGtmAccessStrategy(request)
		if err != nil {
			errChan <- err
		} else {
			responseChan <- response
		}
	})
	if err != nil {
		errChan <- err
		close(responseChan)
		close(errChan)
	}
	return responseChan, errChan
}

// UpdateGtmAccessStrategyWithCallback invokes the alidns.UpdateGtmAccessStrategy API asynchronously
// api document: https://help.aliyun.com/api/alidns/updategtmaccessstrategy.html
// asynchronous document: https://help.aliyun.com/document_detail/66220.html
func (client *Client) UpdateGtmAccessStrategyWithCallback(request *UpdateGtmAccessStrategyRequest, callback func(response *UpdateGtmAccessStrategyResponse, err error)) <-chan int {
	result := make(chan int, 1)
	err := client.AddAsyncTask(func() {
		var response *UpdateGtmAccessStrategyResponse
		var err error
		defer close(result)
		response, err = client.UpdateGtmAccessStrategy(request)
		callback(response, err)
		result <- 1
	})
	if err != nil {
		defer close(result)
		callback(nil, err)
		result <- 0
	}
	return result
}

// UpdateGtmAccessStrategyRequest is the request struct for api UpdateGtmAccessStrategy
type UpdateGtmAccessStrategyRequest struct {
	*requests.RpcRequest
	StrategyName       string `position:"Query" name:"StrategyName"`
	DefaultAddrPoolId  string `position:"Query" name:"DefaultAddrPoolId"`
	AccessLines        string `position:"Query" name:"AccessLines"`
	FailoverAddrPoolId string `position:"Query" name:"FailoverAddrPoolId"`
	UserClientIp       string `position:"Query" name:"UserClientIp"`
	StrategyId         string `position:"Query" name:"StrategyId"`
	Lang               string `position:"Query" name:"Lang"`
}

// UpdateGtmAccessStrategyResponse is the response struct for api UpdateGtmAccessStrategy
type UpdateGtmAccessStrategyResponse struct {
	*responses.BaseResponse
	RequestId string `json:"RequestId" xml:"RequestId"`
}

// CreateUpdateGtmAccessStrategyRequest creates a request to invoke UpdateGtmAccessStrategy API
func CreateUpdateGtmAccessStrategyRequest() (request *UpdateGtmAccessStrategyRequest) {
	request = &UpdateGtmAccessStrategyRequest{
		RpcRequest: &requests.RpcRequest{},
	}
	request.InitWithApiInfo("Alidns", "2015-01-09", "UpdateGtmAccessStrategy", "Alidns", "openAPI")
	return
}

// CreateUpdateGtmAccessStrategyResponse creates a response to parse from UpdateGtmAccessStrategy response
func CreateUpdateGtmAccessStrategyResponse() (response *UpdateGtmAccessStrategyResponse) {
	response = &UpdateGtmAccessStrategyResponse{
		BaseResponse: &responses.BaseResponse{},
	}
	return
}
