unit ENSituationRPNController;

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

  ENSituationRPN            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSituationRPNRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSituationRPN = class(TRemotable)
  private
    Fcode : Integer;
    Fvalue : Integer;
    Fdescription : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property  value : Integer read Fvalue write Fvalue;
    property description : WideString read Fdescription write Fdescription;
  end;

{
  ENSituationRPNFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fvalue : Integer;
    Fdescription : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  value : Integer read Fvalue write Fvalue;
    property description : WideString read Fdescription write Fdescription;
  end;
}

  ENSituationRPNFilter = class(ENSituationRPN)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSituationRPNShort = class(TRemotable)
  private
    Fcode : Integer;
    Fvalue : Integer;
    Fdescription : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property  value : Integer read Fvalue write Fvalue;
    property description : WideString read Fdescription write Fdescription;

  end;

  ArrayOfENSituationRPNShort = array of ENSituationRPNShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSituationRPNShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSituationRPNShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSituationRPNShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSituationRPNController/message/
  // soapAction: http://ksoe.org/ENSituationRPNController/action/ENSituationRPNController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSituationRPNControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSituationRPNController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSituationRPNControllerSoapPort = interface(IInvokable)
  ['{E1DD8C59-0EBB-4277-A0F8-732E538F6488}']
    function add(const aENSituationRPN: ENSituationRPN): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSituationRPN: ENSituationRPN); stdcall;
    function getObject(const anObjectCode: Integer): ENSituationRPN; stdcall;
    function getList: ENSituationRPNShortList; stdcall;
    function getFilteredList(const aENSituationRPNFilter: ENSituationRPNFilter): ENSituationRPNShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSituationRPNShortList; stdcall;
    function getScrollableFilteredList(const aENSituationRPNFilter: ENSituationRPNFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSituationRPNShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSituationRPNShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSituationRPNFilter: ENSituationRPNFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSituationRPNShort; stdcall;
  end;


implementation



  destructor ENSituationRPNShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSituationRPN, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSituationRPN');
  RemClassRegistry.RegisterXSClass(ENSituationRPNRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSituationRPNRef');
  RemClassRegistry.RegisterXSClass(ENSituationRPNFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSituationRPNFilter');
  RemClassRegistry.RegisterXSClass(ENSituationRPNShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSituationRPNShort');
  RemClassRegistry.RegisterXSClass(ENSituationRPNShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSituationRPNShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSituationRPNShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSituationRPNShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSituationRPNControllerSoapPort), 'http://ksoe.org/ENSituationRPNController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSituationRPNControllerSoapPort), 'http://ksoe.org/ENSituationRPNController/action/ENSituationRPNController.%operationName%');


end.
