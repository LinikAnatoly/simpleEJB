unit RQSpravDKPPController;

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

  RQSpravDKPP            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQSpravDKPPRef = class(TRemotable)
  private
    Fcode: Integer;
    Fname: wideString;
  published
    property code: Integer read Fcode write Fcode;
    property name: WideString read Fname write Fname;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQSpravDKPP = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQSpravDKPPFilter = class(TRemotable)
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

  RQSpravDKPPFilter = class(RQSpravDKPP)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQSpravDKPPShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQSpravDKPPShort = array of RQSpravDKPPShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQSpravDKPPShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQSpravDKPPShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQSpravDKPPShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQSpravDKPPController/message/
  // soapAction: http://ksoe.org/RQSpravDKPPController/action/RQSpravDKPPController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQSpravDKPPControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQSpravDKPPController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQSpravDKPPControllerSoapPort = interface(IInvokable)
['{90EDAFB0-7B54-42CD-8AB1-2FC618D11629}']
    function add(const aRQSpravDKPP: RQSpravDKPP): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQSpravDKPP: RQSpravDKPP); stdcall;
    function getObject(const anObjectCode: Integer): RQSpravDKPP; stdcall;
    function getList: RQSpravDKPPShortList; stdcall;
    function getFilteredList(const aRQSpravDKPPFilter: RQSpravDKPPFilter): RQSpravDKPPShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQSpravDKPPShortList; stdcall;
    function getScrollableFilteredList(const aRQSpravDKPPFilter: RQSpravDKPPFilter; const aFromPosition: Integer; const aQuantity: Integer): RQSpravDKPPShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQSpravDKPPShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQSpravDKPPFilter: RQSpravDKPPFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQSpravDKPPShort; stdcall;
  end;


implementation



  destructor RQSpravDKPPShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQSpravDKPP, 'http://ksoe.org/EnergyproControllerService/type/', 'RQSpravDKPP');
  RemClassRegistry.RegisterXSClass(RQSpravDKPPRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQSpravDKPPRef');
  RemClassRegistry.RegisterXSClass(RQSpravDKPPFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQSpravDKPPFilter');
  RemClassRegistry.RegisterXSClass(RQSpravDKPPShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQSpravDKPPShort');
  RemClassRegistry.RegisterXSClass(RQSpravDKPPShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQSpravDKPPShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQSpravDKPPShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQSpravDKPPShort');

  InvRegistry.RegisterInterface(TypeInfo(RQSpravDKPPControllerSoapPort), 'http://ksoe.org/RQSpravDKPPController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQSpravDKPPControllerSoapPort), 'http://ksoe.org/RQSpravDKPPController/action/RQSpravDKPPController.%operationName%');


end.
