unit ENMeasurDeviceTypeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
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

  ENMeasurDeviceType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMeasurDeviceTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMeasurDeviceType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENMeasurDeviceTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
}

  ENMeasurDeviceTypeFilter = class(ENMeasurDeviceType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENMeasurDeviceTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENMeasurDeviceTypeShort = array of ENMeasurDeviceTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMeasurDeviceTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMeasurDeviceTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMeasurDeviceTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMeasurDeviceTypeController/message/
  // soapAction: http://ksoe.org/ENMeasurDeviceTypeController/action/ENMeasurDeviceTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMeasurDeviceTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMeasurDeviceTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMeasurDeviceTypeControllerSoapPort = interface(IInvokable)
  ['{216c216c-216c-216c-216c-216c216c216c}']
    function  add(const aENMeasurDeviceType: ENMeasurDeviceType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMeasurDeviceType: ENMeasurDeviceType); stdcall;
    function  getObject(const anObjectCode: Integer): ENMeasurDeviceType; stdcall;
    function  getList: ENMeasurDeviceTypeShortList; stdcall;
    function  getFilteredList(const aENMeasurDeviceTypeFilter: ENMeasurDeviceTypeFilter): ENMeasurDeviceTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMeasurDeviceTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENMeasurDeviceTypeFilter: ENMeasurDeviceTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMeasurDeviceTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMeasurDeviceTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENMeasurDeviceTypeFilter: ENMeasurDeviceTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENMeasurDeviceTypeShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;



initialization

  RemClassRegistry.RegisterXSClass(ENMeasurDeviceType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDeviceType');
  RemClassRegistry.RegisterXSClass(ENMeasurDeviceTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDeviceTypeRef');
  RemClassRegistry.RegisterXSClass(ENMeasurDeviceTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDeviceTypeFilter');
  RemClassRegistry.RegisterXSClass(ENMeasurDeviceTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDeviceTypeShort');
  RemClassRegistry.RegisterXSClass(ENMeasurDeviceTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDeviceTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMeasurDeviceTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMeasurDeviceTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMeasurDeviceTypeControllerSoapPort), 'http://ksoe.org/ENMeasurDeviceTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMeasurDeviceTypeControllerSoapPort), 'http://ksoe.org/ENMeasurDeviceTypeController/action/ENMeasurDeviceTypeController.%operationName%');


end.
