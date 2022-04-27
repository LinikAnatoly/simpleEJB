unit ENSettingsController;

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

  ENSettings            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSettingsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSettings = class(TRemotable)
  private
    Fcode : Integer;
    Fkey : WideString;
    Fcomment : WideString;
    FcurrentValue : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property key : WideString read Fkey write Fkey;
    property comment : WideString read Fcomment write Fcomment;
    property currentValue : WideString read FcurrentValue write FcurrentValue;
  end;

{
  ENSettingsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fkey : WideString;
    Fcomment : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property key : WideString read Fkey write Fkey;
    property comment : WideString read Fcomment write Fcomment;
  end;
}

  ENSettingsFilter = class(ENSettings)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSettingsShort = class(TRemotable)
  private
    Fcode : Integer;
    Fkey : WideString;
    Fcomment : WideString;
    FcurrentValue : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property key : WideString read Fkey write Fkey;
    property comment : WideString read Fcomment write Fcomment;
    property currentValue : WideString read FcurrentValue write FcurrentValue;
  end;

  ArrayOfENSettingsShort = array of ENSettingsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSettingsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSettingsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSettingsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSettingsController/message/
  // soapAction: http://ksoe.org/ENSettingsController/action/ENSettingsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSettingsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSettingsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSettingsControllerSoapPort = interface(IInvokable)
  ['{5D1B45A4-7F89-4999-96E3-0134F08C8D3C}']
    function add(const aENSettings: ENSettings): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSettings: ENSettings); stdcall;
    function getObject(const anObjectCode: Integer): ENSettings; stdcall;
    function getList: ENSettingsShortList; stdcall;
    function getFilteredList(const aENSettingsFilter: ENSettingsFilter): ENSettingsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSettingsShortList; stdcall;
    function getScrollableFilteredList(const aENSettingsFilter: ENSettingsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSettingsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSettingsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSettingsFilter: ENSettingsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSettingsShort; stdcall;
  end;


implementation



  destructor ENSettingsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSettings, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettings');
  RemClassRegistry.RegisterXSClass(ENSettingsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingsRef');
  RemClassRegistry.RegisterXSClass(ENSettingsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingsFilter');
  RemClassRegistry.RegisterXSClass(ENSettingsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingsShort');
  RemClassRegistry.RegisterXSClass(ENSettingsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSettingsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSettingsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSettingsControllerSoapPort), 'http://ksoe.org/ENSettingsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSettingsControllerSoapPort), 'http://ksoe.org/ENSettingsController/action/ENSettingsController.%operationName%');


end.
