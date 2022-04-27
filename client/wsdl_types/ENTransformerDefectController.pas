unit ENTransformerDefectController;

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

  ENTransformerDefect            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransformerDefectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransformerDefect = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENTransformerDefectFilter = class(TRemotable)
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

  ENTransformerDefectFilter = class(ENTransformerDefect)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTransformerDefectShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTransformerDefectShort = array of ENTransformerDefectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransformerDefectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransformerDefectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransformerDefectShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransformerDefectController/message/
  // soapAction: http://ksoe.org/ENTransformerDefectController/action/ENTransformerDefectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransformerDefectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransformerDefectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransformerDefectControllerSoapPort = interface(IInvokable)
  ['{3fb03fb0-3fb0-3fb0-3fb0-3fb03fb03fb0}']
    function add(const aENTransformerDefect: ENTransformerDefect): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransformerDefect: ENTransformerDefect); stdcall;
    function getObject(const anObjectCode: Integer): ENTransformerDefect; stdcall;
    function getList: ENTransformerDefectShortList; stdcall;
    function getFilteredList(const aENTransformerDefectFilter: ENTransformerDefectFilter): ENTransformerDefectShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransformerDefectShortList; stdcall;
    function getScrollableFilteredList(const aENTransformerDefectFilter: ENTransformerDefectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransformerDefectShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransformerDefectShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTransformerDefectFilter: ENTransformerDefectFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTransformerDefectShort; stdcall;
  end;


implementation



  destructor ENTransformerDefectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransformerDefect, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerDefect');
  RemClassRegistry.RegisterXSClass(ENTransformerDefectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerDefectRef');
  RemClassRegistry.RegisterXSClass(ENTransformerDefectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerDefectFilter');
  RemClassRegistry.RegisterXSClass(ENTransformerDefectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerDefectShort');
  RemClassRegistry.RegisterXSClass(ENTransformerDefectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerDefectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransformerDefectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransformerDefectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransformerDefectControllerSoapPort), 'http://ksoe.org/ENTransformerDefectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransformerDefectControllerSoapPort), 'http://ksoe.org/ENTransformerDefectController/action/ENTransformerDefectController.%operationName%');


end.
