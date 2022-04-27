unit ENTechConditionsServicesStatusController;

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

  ENTechConditionsServicesStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechConditionsServicesStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechConditionsServicesStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTechConditionsServicesStatusFilter = class(TRemotable)
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

  ENTechConditionsServicesStatusFilter = class(ENTechConditionsServicesStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTechConditionsServicesStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTechConditionsServicesStatusShort = array of ENTechConditionsServicesStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTechConditionsServicesStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTechConditionsServicesStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTechConditionsServicesStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTechConditionsServicesStatusController/message/
  // soapAction: http://ksoe.org/ENTechConditionsServicesStatusController/action/ENTechConditionsServicesStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTechConditionsServicesStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTechConditionsServicesStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTechConditionsServicesStatusControllerSoapPort = interface(IInvokable)
  ['{d454d454-d454-d454-d454-d454d454d454}']
    function  add(const aENTechConditionsServicesStatus: ENTechConditionsServicesStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTechConditionsServicesStatus: ENTechConditionsServicesStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENTechConditionsServicesStatus; stdcall;
    function  getList: ENTechConditionsServicesStatusShortList; stdcall;
    function  getFilteredList(const aENTechConditionsServicesStatusFilter: ENTechConditionsServicesStatusFilter): ENTechConditionsServicesStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTechConditionsServicesStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENTechConditionsServicesStatusFilter: ENTechConditionsServicesStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTechConditionsServicesStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTechConditionsServicesStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTechConditionsServicesStatusFilter: ENTechConditionsServicesStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENTechConditionsServicesStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesStatus');
  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesStatusRef');
  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesStatusFilter');
  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesStatusShort');
  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTechConditionsServicesStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTechConditionsServicesStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTechConditionsServicesStatusControllerSoapPort), 'http://ksoe.org/ENTechConditionsServicesStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTechConditionsServicesStatusControllerSoapPort), 'http://ksoe.org/ENTechConditionsServicesStatusController/action/ENTechConditionsServicesStatusController.%operationName%');


end.
