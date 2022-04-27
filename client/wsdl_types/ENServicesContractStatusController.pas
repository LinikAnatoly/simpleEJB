unit ENServicesContractStatusController;

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

  ENServicesContractStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesContractStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesContractStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENServicesContractStatusFilter = class(TRemotable)
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

  ENServicesContractStatusFilter = class(ENServicesContractStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENServicesContractStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENServicesContractStatusShort = array of ENServicesContractStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesContractStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesContractStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesContractStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesContractStatusController/message/
  // soapAction: http://ksoe.org/ENServicesContractStatusController/action/ENServicesContractStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesContractStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesContractStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesContractStatusControllerSoapPort = interface(IInvokable)
  ['{806B58AB-2FC9-4FC3-831C-77A1D122DA24}']
    function  add(const aENServicesContractStatus: ENServicesContractStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesContractStatus: ENServicesContractStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENServicesContractStatus; stdcall;
    function  getList: ENServicesContractStatusShortList; stdcall;
    function  getFilteredList(const aENServicesContractStatusFilter: ENServicesContractStatusFilter): ENServicesContractStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesContractStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENServicesContractStatusFilter: ENServicesContractStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesContractStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesContractStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENServicesContractStatusFilter: ENServicesContractStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENServicesContractStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesContractStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractStatus');
  RemClassRegistry.RegisterXSClass(ENServicesContractStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractStatusRef');
  RemClassRegistry.RegisterXSClass(ENServicesContractStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractStatusFilter');
  RemClassRegistry.RegisterXSClass(ENServicesContractStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractStatusShort');
  RemClassRegistry.RegisterXSClass(ENServicesContractStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesContractStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesContractStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesContractStatusControllerSoapPort), 'http://ksoe.org/ENServicesContractStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesContractStatusControllerSoapPort), 'http://ksoe.org/ENServicesContractStatusController/action/ENServicesContractStatusController.%operationName%');


end.
