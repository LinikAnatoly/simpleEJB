unit ENLoadSwitchDriveTypeController;

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

  ENLoadSwitchDriveType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLoadSwitchDriveTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLoadSwitchDriveType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENLoadSwitchDriveTypeFilter = class(TRemotable)
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

  ENLoadSwitchDriveTypeFilter = class(ENLoadSwitchDriveType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLoadSwitchDriveTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENLoadSwitchDriveTypeShort = array of ENLoadSwitchDriveTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLoadSwitchDriveTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLoadSwitchDriveTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLoadSwitchDriveTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLoadSwitchDriveTypeController/message/
  // soapAction: http://ksoe.org/ENLoadSwitchDriveTypeController/action/ENLoadSwitchDriveTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLoadSwitchDriveTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLoadSwitchDriveTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLoadSwitchDriveTypeControllerSoapPort = interface(IInvokable)
  ['{f25af25a-f25a-f25a-f25a-f25af25af25a}']
    function  add(const aENLoadSwitchDriveType: ENLoadSwitchDriveType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLoadSwitchDriveType: ENLoadSwitchDriveType); stdcall;
    function  getObject(const anObjectCode: Integer): ENLoadSwitchDriveType; stdcall;
    function  getList: ENLoadSwitchDriveTypeShortList; stdcall;
    function  getFilteredList(const aENLoadSwitchDriveTypeFilter: ENLoadSwitchDriveTypeFilter): ENLoadSwitchDriveTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLoadSwitchDriveTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENLoadSwitchDriveTypeFilter: ENLoadSwitchDriveTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENLoadSwitchDriveTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLoadSwitchDriveTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLoadSwitchDriveTypeFilter: ENLoadSwitchDriveTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENLoadSwitchDriveTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLoadSwitchDriveType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchDriveType');
  RemClassRegistry.RegisterXSClass(ENLoadSwitchDriveTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchDriveTypeRef');
  RemClassRegistry.RegisterXSClass(ENLoadSwitchDriveTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchDriveTypeFilter');
  RemClassRegistry.RegisterXSClass(ENLoadSwitchDriveTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchDriveTypeShort');
  RemClassRegistry.RegisterXSClass(ENLoadSwitchDriveTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchDriveTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLoadSwitchDriveTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLoadSwitchDriveTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENLoadSwitchDriveTypeControllerSoapPort), 'http://ksoe.org/ENLoadSwitchDriveTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLoadSwitchDriveTypeControllerSoapPort), 'http://ksoe.org/ENLoadSwitchDriveTypeController/action/ENLoadSwitchDriveTypeController.%operationName%');


end.
