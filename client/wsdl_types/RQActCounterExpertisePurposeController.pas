unit RQActCounterExpertisePurposeController;

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

  RQActCounterExpertisePurpose            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQActCounterExpertisePurposeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQActCounterExpertisePurpose = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQActCounterExpertisePurposeFilter = class(TRemotable)
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

  RQActCounterExpertisePurposeFilter = class(RQActCounterExpertisePurpose)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQActCounterExpertisePurposeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQActCounterExpertisePurposeShort = array of RQActCounterExpertisePurposeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQActCounterExpertisePurposeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQActCounterExpertisePurposeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQActCounterExpertisePurposeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQActCounterExpertisePurposeController/message/
  // soapAction: http://ksoe.org/RQActCounterExpertisePurposeController/action/RQActCounterExpertisePurposeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQActCounterExpertisePurposeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQActCounterExpertisePurposeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQActCounterExpertisePurposeControllerSoapPort = interface(IInvokable)
  ['{1BC487CF-83ED-44DA-A75E-AAC1BAE45592}']
    function add(const aRQActCounterExpertisePurpose: RQActCounterExpertisePurpose): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQActCounterExpertisePurpose: RQActCounterExpertisePurpose); stdcall;
    function getObject(const anObjectCode: Integer): RQActCounterExpertisePurpose; stdcall;
    function getList: RQActCounterExpertisePurposeShortList; stdcall;
    function getFilteredList(const aRQActCounterExpertisePurposeFilter: RQActCounterExpertisePurposeFilter): RQActCounterExpertisePurposeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQActCounterExpertisePurposeShortList; stdcall;
    function getScrollableFilteredList(const aRQActCounterExpertisePurposeFilter: RQActCounterExpertisePurposeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQActCounterExpertisePurposeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQActCounterExpertisePurposeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQActCounterExpertisePurposeFilter: RQActCounterExpertisePurposeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQActCounterExpertisePurposeShort; stdcall;
  end;


implementation



  destructor RQActCounterExpertisePurposeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQActCounterExpertisePurpose, 'http://ksoe.org/EnergyproControllerService/type/', 'RQActCounterExpertisePurpose');
  RemClassRegistry.RegisterXSClass(RQActCounterExpertisePurposeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQActCounterExpertisePurposeRef');
  RemClassRegistry.RegisterXSClass(RQActCounterExpertisePurposeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQActCounterExpertisePurposeFilter');
  RemClassRegistry.RegisterXSClass(RQActCounterExpertisePurposeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQActCounterExpertisePurposeShort');
  RemClassRegistry.RegisterXSClass(RQActCounterExpertisePurposeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQActCounterExpertisePurposeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQActCounterExpertisePurposeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQActCounterExpertisePurposeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQActCounterExpertisePurposeControllerSoapPort), 'http://ksoe.org/RQActCounterExpertisePurposeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQActCounterExpertisePurposeControllerSoapPort), 'http://ksoe.org/RQActCounterExpertisePurposeController/action/RQActCounterExpertisePurposeController.%operationName%');


end.
