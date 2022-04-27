unit RQPackingListItemTypeController;

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

  RQPackingListItemType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPackingListItemTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPackingListItemType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQPackingListItemTypeFilter = class(TRemotable)
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

  RQPackingListItemTypeFilter = class(RQPackingListItemType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPackingListItemTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQPackingListItemTypeShort = array of RQPackingListItemTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPackingListItemTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPackingListItemTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPackingListItemTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPackingListItemTypeController/message/
  // soapAction: http://ksoe.org/RQPackingListItemTypeController/action/RQPackingListItemTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPackingListItemTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPackingListItemTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPackingListItemTypeControllerSoapPort = interface(IInvokable)
  ['{35343534-3534-3534-3534-353435343534}']
    function add(const aRQPackingListItemType: RQPackingListItemType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPackingListItemType: RQPackingListItemType); stdcall;
    function getObject(const anObjectCode: Integer): RQPackingListItemType; stdcall;
    function getList: RQPackingListItemTypeShortList; stdcall;
    function getFilteredList(const aRQPackingListItemTypeFilter: RQPackingListItemTypeFilter): RQPackingListItemTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPackingListItemTypeShortList; stdcall;
    function getScrollableFilteredList(const aRQPackingListItemTypeFilter: RQPackingListItemTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPackingListItemTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPackingListItemTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPackingListItemTypeFilter: RQPackingListItemTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPackingListItemTypeShort; stdcall;
  end;


implementation



  destructor RQPackingListItemTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPackingListItemType, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemType');
  RemClassRegistry.RegisterXSClass(RQPackingListItemTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemTypeRef');
  RemClassRegistry.RegisterXSClass(RQPackingListItemTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemTypeFilter');
  RemClassRegistry.RegisterXSClass(RQPackingListItemTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemTypeShort');
  RemClassRegistry.RegisterXSClass(RQPackingListItemTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPackingListItemTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPackingListItemTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPackingListItemTypeControllerSoapPort), 'http://ksoe.org/RQPackingListItemTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPackingListItemTypeControllerSoapPort), 'http://ksoe.org/RQPackingListItemTypeController/action/RQPackingListItemTypeController.%operationName%');


end.
