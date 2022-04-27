unit ENLoadSwitchTypeController;

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

  ENLoadSwitchType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLoadSwitchTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLoadSwitchType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENLoadSwitchTypeFilter = class(TRemotable)
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

  ENLoadSwitchTypeFilter = class(ENLoadSwitchType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLoadSwitchTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENLoadSwitchTypeShort = array of ENLoadSwitchTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLoadSwitchTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLoadSwitchTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLoadSwitchTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLoadSwitchTypeController/message/
  // soapAction: http://ksoe.org/ENLoadSwitchTypeController/action/ENLoadSwitchTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLoadSwitchTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLoadSwitchTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLoadSwitchTypeControllerSoapPort = interface(IInvokable)
  ['{1f721f72-1f72-1f72-1f72-1f721f721f72}']
    function  add(const aENLoadSwitchType: ENLoadSwitchType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLoadSwitchType: ENLoadSwitchType); stdcall;
    function  getObject(const anObjectCode: Integer): ENLoadSwitchType; stdcall;
    function  getList: ENLoadSwitchTypeShortList; stdcall;
    function  getFilteredList(const aENLoadSwitchTypeFilter: ENLoadSwitchTypeFilter): ENLoadSwitchTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLoadSwitchTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENLoadSwitchTypeFilter: ENLoadSwitchTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENLoadSwitchTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLoadSwitchTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLoadSwitchTypeFilter: ENLoadSwitchTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENLoadSwitchTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLoadSwitchType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchType');
  RemClassRegistry.RegisterXSClass(ENLoadSwitchTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchTypeRef');
  RemClassRegistry.RegisterXSClass(ENLoadSwitchTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchTypeFilter');
  RemClassRegistry.RegisterXSClass(ENLoadSwitchTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchTypeShort');
  RemClassRegistry.RegisterXSClass(ENLoadSwitchTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLoadSwitchTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLoadSwitchTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENLoadSwitchTypeControllerSoapPort), 'http://ksoe.org/ENLoadSwitchTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLoadSwitchTypeControllerSoapPort), 'http://ksoe.org/ENLoadSwitchTypeController/action/ENLoadSwitchTypeController.%operationName%');


end.
