unit ENElement2TKMaterialsTypeController;

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

  ENElement2TKMaterialsType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2TKMaterialsTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2TKMaterialsType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENElement2TKMaterialsTypeFilter = class(TRemotable)
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

  ENElement2TKMaterialsTypeFilter = class(ENElement2TKMaterialsType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENElement2TKMaterialsTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENElement2TKMaterialsTypeShort = array of ENElement2TKMaterialsTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENElement2TKMaterialsTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENElement2TKMaterialsTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENElement2TKMaterialsTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENElement2TKMaterialsTypeController/message/
  // soapAction: http://ksoe.org/ENElement2TKMaterialsTypeController/action/ENElement2TKMaterialsTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENElement2TKMaterialsTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENElement2TKMaterialsTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENElement2TKMaterialsTypeControllerSoapPort = interface(IInvokable)
  ['{6f0c6f0c-6f0c-6f0c-6f0c-6f0c6f0c6f0c}']
    function add(const aENElement2TKMaterialsType: ENElement2TKMaterialsType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENElement2TKMaterialsType: ENElement2TKMaterialsType); stdcall;
    function getObject(const anObjectCode: Integer): ENElement2TKMaterialsType; stdcall;
    function getList: ENElement2TKMaterialsTypeShortList; stdcall;
    function getFilteredList(const aENElement2TKMaterialsTypeFilter: ENElement2TKMaterialsTypeFilter): ENElement2TKMaterialsTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENElement2TKMaterialsTypeShortList; stdcall;
    function getScrollableFilteredList(const aENElement2TKMaterialsTypeFilter: ENElement2TKMaterialsTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENElement2TKMaterialsTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENElement2TKMaterialsTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENElement2TKMaterialsTypeFilter: ENElement2TKMaterialsTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENElement2TKMaterialsTypeShort; stdcall;
  end;


implementation



  destructor ENElement2TKMaterialsTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENElement2TKMaterialsType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2TKMaterialsType');
  RemClassRegistry.RegisterXSClass(ENElement2TKMaterialsTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2TKMaterialsTypeRef');
  RemClassRegistry.RegisterXSClass(ENElement2TKMaterialsTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2TKMaterialsTypeFilter');
  RemClassRegistry.RegisterXSClass(ENElement2TKMaterialsTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2TKMaterialsTypeShort');
  RemClassRegistry.RegisterXSClass(ENElement2TKMaterialsTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2TKMaterialsTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENElement2TKMaterialsTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENElement2TKMaterialsTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENElement2TKMaterialsTypeControllerSoapPort), 'http://ksoe.org/ENElement2TKMaterialsTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENElement2TKMaterialsTypeControllerSoapPort), 'http://ksoe.org/ENElement2TKMaterialsTypeController/action/ENElement2TKMaterialsTypeController.%operationName%');


end.
