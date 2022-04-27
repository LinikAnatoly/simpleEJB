unit ENCalcAdditionalItemTypeController;

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

  ENCalcAdditionalItemType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCalcAdditionalItemTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCalcAdditionalItemType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENCalcAdditionalItemTypeFilter = class(TRemotable)
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

  ENCalcAdditionalItemTypeFilter = class(ENCalcAdditionalItemType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCalcAdditionalItemTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENCalcAdditionalItemTypeShort = array of ENCalcAdditionalItemTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCalcAdditionalItemTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCalcAdditionalItemTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCalcAdditionalItemTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCalcAdditionalItemTypeController/message/
  // soapAction: http://ksoe.org/ENCalcAdditionalItemTypeController/action/ENCalcAdditionalItemTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCalcAdditionalItemTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCalcAdditionalItemTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCalcAdditionalItemTypeControllerSoapPort = interface(IInvokable)
  ['{DCE79E6F-4F70-4966-9405-7025EBF7C5E1}']
    function add(const aENCalcAdditionalItemType: ENCalcAdditionalItemType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCalcAdditionalItemType: ENCalcAdditionalItemType); stdcall;
    function getObject(const anObjectCode: Integer): ENCalcAdditionalItemType; stdcall;
    function getList: ENCalcAdditionalItemTypeShortList; stdcall;
    function getFilteredList(const aENCalcAdditionalItemTypeFilter: ENCalcAdditionalItemTypeFilter): ENCalcAdditionalItemTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCalcAdditionalItemTypeShortList; stdcall;
    function getScrollableFilteredList(const aENCalcAdditionalItemTypeFilter: ENCalcAdditionalItemTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCalcAdditionalItemTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCalcAdditionalItemTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCalcAdditionalItemTypeFilter: ENCalcAdditionalItemTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCalcAdditionalItemTypeShort; stdcall;
  end;


implementation



  destructor ENCalcAdditionalItemTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCalcAdditionalItemType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcAdditionalItemType');
  RemClassRegistry.RegisterXSClass(ENCalcAdditionalItemTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcAdditionalItemTypeRef');
  RemClassRegistry.RegisterXSClass(ENCalcAdditionalItemTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcAdditionalItemTypeFilter');
  RemClassRegistry.RegisterXSClass(ENCalcAdditionalItemTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcAdditionalItemTypeShort');
  RemClassRegistry.RegisterXSClass(ENCalcAdditionalItemTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcAdditionalItemTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCalcAdditionalItemTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCalcAdditionalItemTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCalcAdditionalItemTypeControllerSoapPort), 'http://ksoe.org/ENCalcAdditionalItemTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCalcAdditionalItemTypeControllerSoapPort), 'http://ksoe.org/ENCalcAdditionalItemTypeController/action/ENCalcAdditionalItemTypeController.%operationName%');


end.
