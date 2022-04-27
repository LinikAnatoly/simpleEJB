unit ENDisconnectorDriveTypeController;

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

  ENDisconnectorDriveType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDisconnectorDriveTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDisconnectorDriveType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENDisconnectorDriveTypeFilter = class(TRemotable)
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

  ENDisconnectorDriveTypeFilter = class(ENDisconnectorDriveType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENDisconnectorDriveTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENDisconnectorDriveTypeShort = array of ENDisconnectorDriveTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDisconnectorDriveTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDisconnectorDriveTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDisconnectorDriveTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDisconnectorDriveTypeController/message/
  // soapAction: http://ksoe.org/ENDisconnectorDriveTypeController/action/ENDisconnectorDriveTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDisconnectorDriveTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDisconnectorDriveTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDisconnectorDriveTypeControllerSoapPort = interface(IInvokable)
  ['{15bc15bc-15bc-15bc-15bc-15bc15bc15bc}']
    function  add(const aENDisconnectorDriveType: ENDisconnectorDriveType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDisconnectorDriveType: ENDisconnectorDriveType); stdcall;
    function  getObject(const anObjectCode: Integer): ENDisconnectorDriveType; stdcall;
    function  getList: ENDisconnectorDriveTypeShortList; stdcall;
    function  getFilteredList(const aENDisconnectorDriveTypeFilter: ENDisconnectorDriveTypeFilter): ENDisconnectorDriveTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectorDriveTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENDisconnectorDriveTypeFilter: ENDisconnectorDriveTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectorDriveTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectorDriveTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENDisconnectorDriveTypeFilter: ENDisconnectorDriveTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENDisconnectorDriveTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDisconnectorDriveType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorDriveType');
  RemClassRegistry.RegisterXSClass(ENDisconnectorDriveTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorDriveTypeRef');
  RemClassRegistry.RegisterXSClass(ENDisconnectorDriveTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorDriveTypeFilter');
  RemClassRegistry.RegisterXSClass(ENDisconnectorDriveTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorDriveTypeShort');
  RemClassRegistry.RegisterXSClass(ENDisconnectorDriveTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorDriveTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDisconnectorDriveTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDisconnectorDriveTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDisconnectorDriveTypeControllerSoapPort), 'http://ksoe.org/ENDisconnectorDriveTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDisconnectorDriveTypeControllerSoapPort), 'http://ksoe.org/ENDisconnectorDriveTypeController/action/ENDisconnectorDriveTypeController.%operationName%');


end.
