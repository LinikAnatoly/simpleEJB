unit ENTechConditionsServicesTypeController;

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

  ENTechConditionsServicesType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechConditionsServicesTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechConditionsServicesType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTechConditionsServicesTypeFilter = class(TRemotable)
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

  ENTechConditionsServicesTypeFilter = class(ENTechConditionsServicesType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTechConditionsServicesTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTechConditionsServicesTypeShort = array of ENTechConditionsServicesTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTechConditionsServicesTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTechConditionsServicesTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTechConditionsServicesTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTechConditionsServicesTypeController/message/
  // soapAction: http://ksoe.org/ENTechConditionsServicesTypeController/action/ENTechConditionsServicesTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTechConditionsServicesTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTechConditionsServicesTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTechConditionsServicesTypeControllerSoapPort = interface(IInvokable)
  ['{3dac3dac-3dac-3dac-3dac-3dac3dac3dac}']
    function  add(const aENTechConditionsServicesType: ENTechConditionsServicesType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTechConditionsServicesType: ENTechConditionsServicesType); stdcall;
    function  getObject(const anObjectCode: Integer): ENTechConditionsServicesType; stdcall;
    function  getList: ENTechConditionsServicesTypeShortList; stdcall;
    function  getFilteredList(const aENTechConditionsServicesTypeFilter: ENTechConditionsServicesTypeFilter): ENTechConditionsServicesTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTechConditionsServicesTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENTechConditionsServicesTypeFilter: ENTechConditionsServicesTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTechConditionsServicesTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTechConditionsServicesTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTechConditionsServicesTypeFilter: ENTechConditionsServicesTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENTechConditionsServicesTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesType');
  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesTypeRef');
  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesTypeFilter');
  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesTypeShort');
  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTechConditionsServicesTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTechConditionsServicesTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTechConditionsServicesTypeControllerSoapPort), 'http://ksoe.org/ENTechConditionsServicesTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTechConditionsServicesTypeControllerSoapPort), 'http://ksoe.org/ENTechConditionsServicesTypeController/action/ENTechConditionsServicesTypeController.%operationName%');


end.
