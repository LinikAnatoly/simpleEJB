unit ENAgreementKindController;

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

  ENAgreementKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAgreementKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAgreementKind = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FuserGen : WideString;
    Fmodify_time : Int64;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
  end;

{
  ENAgreementKindFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FuserGen : WideString;
    Fmodify_time : Int64;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
  end;
}

  ENAgreementKindFilter = class(ENAgreementKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENAgreementKindShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FuserGen : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property userGen : WideString read FuserGen write FuserGen;

  end;

  ArrayOfENAgreementKindShort = array of ENAgreementKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAgreementKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAgreementKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAgreementKindShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAgreementKindController/message/
  // soapAction: http://ksoe.org/ENAgreementKindController/action/ENAgreementKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAgreementKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAgreementKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAgreementKindControllerSoapPort = interface(IInvokable)
  ['{0CA51D84-ECB7-4368-AD6F-6282430A4E55}']
    function add(const aENAgreementKind: ENAgreementKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAgreementKind: ENAgreementKind); stdcall;
    function getObject(const anObjectCode: Integer): ENAgreementKind; stdcall;
    function getList: ENAgreementKindShortList; stdcall;
    function getFilteredList(const aENAgreementKindFilter: ENAgreementKindFilter): ENAgreementKindShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAgreementKindShortList; stdcall;
    function getScrollableFilteredList(const aENAgreementKindFilter: ENAgreementKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAgreementKindShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAgreementKindShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENAgreementKindFilter: ENAgreementKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENAgreementKindShort; stdcall;
  end;


implementation



  destructor ENAgreementKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAgreementKind, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAgreementKind');
  RemClassRegistry.RegisterXSClass(ENAgreementKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAgreementKindRef');
  RemClassRegistry.RegisterXSClass(ENAgreementKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAgreementKindFilter');
  RemClassRegistry.RegisterXSClass(ENAgreementKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAgreementKindShort');
  RemClassRegistry.RegisterXSClass(ENAgreementKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAgreementKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAgreementKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAgreementKindShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAgreementKindControllerSoapPort), 'http://ksoe.org/ENAgreementKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAgreementKindControllerSoapPort), 'http://ksoe.org/ENAgreementKindController/action/ENAgreementKindController.%operationName%');


end.
