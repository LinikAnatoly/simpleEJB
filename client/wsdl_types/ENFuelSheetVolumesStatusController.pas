unit ENFuelSheetVolumesStatusController;

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

  ENFuelSheetVolumesStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelSheetVolumesStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelSheetVolumesStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENFuelSheetVolumesStatusFilter = class(TRemotable)
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

  ENFuelSheetVolumesStatusFilter = class(ENFuelSheetVolumesStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelSheetVolumesStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENFuelSheetVolumesStatusShort = array of ENFuelSheetVolumesStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelSheetVolumesStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelSheetVolumesStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelSheetVolumesStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelSheetVolumesStatusController/message/
  // soapAction: http://ksoe.org/ENFuelSheetVolumesStatusController/action/ENFuelSheetVolumesStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelSheetVolumesStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelSheetVolumesStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelSheetVolumesStatusControllerSoapPort = interface(IInvokable)
  ['{25E11029-1C98-45A4-B32D-8F2611D182D4}']
    function add(const aENFuelSheetVolumesStatus: ENFuelSheetVolumesStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelSheetVolumesStatus: ENFuelSheetVolumesStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelSheetVolumesStatus; stdcall;
    function getList: ENFuelSheetVolumesStatusShortList; stdcall;
    function getFilteredList(const aENFuelSheetVolumesStatusFilter: ENFuelSheetVolumesStatusFilter): ENFuelSheetVolumesStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelSheetVolumesStatusShortList; stdcall;
    function getScrollableFilteredList(const aENFuelSheetVolumesStatusFilter: ENFuelSheetVolumesStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelSheetVolumesStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelSheetVolumesStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelSheetVolumesStatusFilter: ENFuelSheetVolumesStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelSheetVolumesStatusShort; stdcall;
  end;


implementation



  destructor ENFuelSheetVolumesStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesStatus');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesStatusRef');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesStatusFilter');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesStatusShort');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelSheetVolumesStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelSheetVolumesStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelSheetVolumesStatusControllerSoapPort), 'http://ksoe.org/ENFuelSheetVolumesStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelSheetVolumesStatusControllerSoapPort), 'http://ksoe.org/ENFuelSheetVolumesStatusController/action/ENFuelSheetVolumesStatusController.%operationName%');


end.
