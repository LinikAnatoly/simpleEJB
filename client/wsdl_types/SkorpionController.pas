unit SkorpionController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"
  // !:date            - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"



  // ************************************************************************ //
  // Namespace : http://ksoe.org/SkorpionController/message/
  // soapAction: http://ksoe.org/SkorpionController/action/SkorpionController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SkorpionControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SkorpionController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SkorpionControllerSoapPort = interface(IInvokable)
        ['{7F122D2A-9595-4CA8-BE49-C8A5FE6D3782}']
	function executeBeanShellScript(const script : WideString) : WideString; stdcall;
  end;


implementation



initialization

  InvRegistry.RegisterInterface(TypeInfo(SkorpionControllerSoapPort), 'http://ksoe.org/SkorpionController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SkorpionControllerSoapPort), 'http://ksoe.org/SkorpionController/action/SkorpionController.%operationName%');


end.
