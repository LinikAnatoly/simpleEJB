unit ENInspectionSheetStatusController;

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

  ENInspectionSheetStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInspectionSheetStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInspectionSheetStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENInspectionSheetStatusFilter = class(TRemotable)
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

  ENInspectionSheetStatusFilter = class(ENInspectionSheetStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENInspectionSheetStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENInspectionSheetStatusShort = array of ENInspectionSheetStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENInspectionSheetStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENInspectionSheetStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENInspectionSheetStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENInspectionSheetStatusController/message/
  // soapAction: http://ksoe.org/ENInspectionSheetStatusController/action/ENInspectionSheetStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENInspectionSheetStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENInspectionSheetStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENInspectionSheetStatusControllerSoapPort = interface(IInvokable)
  ['{CD0C1E3C-7B8C-4D44-884A-6C8C3ABFD853}']
    function add(const aENInspectionSheetStatus: ENInspectionSheetStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENInspectionSheetStatus: ENInspectionSheetStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENInspectionSheetStatus; stdcall;
    function getList: ENInspectionSheetStatusShortList; stdcall;
    function getFilteredList(const aENInspectionSheetStatusFilter: ENInspectionSheetStatusFilter): ENInspectionSheetStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENInspectionSheetStatusShortList; stdcall;
    function getScrollableFilteredList(const aENInspectionSheetStatusFilter: ENInspectionSheetStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENInspectionSheetStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENInspectionSheetStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENInspectionSheetStatusFilter: ENInspectionSheetStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENInspectionSheetStatusShort; stdcall;
  end;


implementation



  destructor ENInspectionSheetStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENInspectionSheetStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetStatus');
  RemClassRegistry.RegisterXSClass(ENInspectionSheetStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetStatusRef');
  RemClassRegistry.RegisterXSClass(ENInspectionSheetStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetStatusFilter');
  RemClassRegistry.RegisterXSClass(ENInspectionSheetStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetStatusShort');
  RemClassRegistry.RegisterXSClass(ENInspectionSheetStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENInspectionSheetStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENInspectionSheetStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENInspectionSheetStatusControllerSoapPort), 'http://ksoe.org/ENInspectionSheetStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENInspectionSheetStatusControllerSoapPort), 'http://ksoe.org/ENInspectionSheetStatusController/action/ENInspectionSheetStatusController.%operationName%');


end.
