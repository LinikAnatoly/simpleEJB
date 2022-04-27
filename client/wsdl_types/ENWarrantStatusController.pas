unit ENWarrantStatusController;

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

  ENWarrantStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWarrantStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWarrantStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENWarrantStatusFilter = class(TRemotable)
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

  ENWarrantStatusFilter = class(ENWarrantStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENWarrantStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENWarrantStatusShort = array of ENWarrantStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWarrantStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWarrantStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWarrantStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWarrantStatusController/message/
  // soapAction: http://ksoe.org/ENWarrantStatusController/action/ENWarrantStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWarrantStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWarrantStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWarrantStatusControllerSoapPort = interface(IInvokable)
  ['{ac2dac2d-ac2d-ac2d-ac2d-ac2dac2dac2d}']
    function  add(const aENWarrantStatus: ENWarrantStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWarrantStatus: ENWarrantStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENWarrantStatus; stdcall;
    function  getList: ENWarrantStatusShortList; stdcall;
    function  getFilteredList(const aENWarrantStatusFilter: ENWarrantStatusFilter): ENWarrantStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWarrantStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENWarrantStatusFilter: ENWarrantStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWarrantStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWarrantStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENWarrantStatusFilter: ENWarrantStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENWarrantStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWarrantStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantStatus');
  RemClassRegistry.RegisterXSClass(ENWarrantStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantStatusRef');
  RemClassRegistry.RegisterXSClass(ENWarrantStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantStatusFilter');
  RemClassRegistry.RegisterXSClass(ENWarrantStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantStatusShort');
  RemClassRegistry.RegisterXSClass(ENWarrantStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWarrantStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWarrantStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWarrantStatusControllerSoapPort), 'http://ksoe.org/ENWarrantStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWarrantStatusControllerSoapPort), 'http://ksoe.org/ENWarrantStatusController/action/ENWarrantStatusController.%operationName%');


end.
