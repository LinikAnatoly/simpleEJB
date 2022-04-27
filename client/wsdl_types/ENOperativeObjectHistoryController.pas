unit ENOperativeObjectHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENOperativeObjectController 
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

  ENOperativeObjectHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENOperativeObjectHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENOperativeObjectHistory = class(TRemotable)
  private
    Fcode : Integer; 
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    Fname : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    Fmodify_time : Int64;
//???
    FobjectRef : ENOperativeObjectRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property name : WideString read Fname write Fname;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property objectRef : ENOperativeObjectRef read FobjectRef write FobjectRef; 
  end;
  
{
  ENOperativeObjectHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    Fname : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    Fmodify_time : Int64;
//???
    FobjectRef : ENOperativeObjectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property name : WideString read Fname write Fname;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property objectRef : ENOperativeObjectRef read FobjectRef write FobjectRef; 
  end;
}

  ENOperativeObjectHistoryFilter = class(ENOperativeObjectHistory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENOperativeObjectHistoryShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcontractNumber : WideString;
    FcontractDate : TXSDate;	
    Fname : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FobjectRefCode : Integer; 
    FobjectRefName : WideString;
    FobjectRefContractNumber : WideString;
    FobjectRefContractDate : TXSDate;
    FobjectRefPartnerCode : WideString;
    FobjectRefPartnerName : WideString;
    FobjectRefFinDocCode : WideString;
    FobjectRefFinDocID : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property name : WideString read Fname write Fname;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID; 

    property objectRefCode : Integer read FobjectRefCode write FobjectRefCode; 
    property objectRefName : WideString read FobjectRefName write FobjectRefName; 
    property objectRefContractNumber : WideString read FobjectRefContractNumber write FobjectRefContractNumber; 
    property objectRefContractDate : TXSDate read FobjectRefContractDate write FobjectRefContractDate; 
    property objectRefPartnerCode : WideString read FobjectRefPartnerCode write FobjectRefPartnerCode; 
    property objectRefPartnerName : WideString read FobjectRefPartnerName write FobjectRefPartnerName; 
    property objectRefFinDocCode : WideString read FobjectRefFinDocCode write FobjectRefFinDocCode; 
    property objectRefFinDocID : Integer read FobjectRefFinDocID write FobjectRefFinDocID; 
  end;

  ArrayOfENOperativeObjectHistoryShort = array of ENOperativeObjectHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENOperativeObjectHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENOperativeObjectHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENOperativeObjectHistoryShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENOperativeObjectHistoryController/message/
  // soapAction: http://ksoe.org/ENOperativeObjectHistoryController/action/ENOperativeObjectHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENOperativeObjectHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENOperativeObjectHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENOperativeObjectHistoryControllerSoapPort = interface(IInvokable)
  ['{6d7f6d7f-6d7f-6d7f-6d7f-6d7f6d7f6d7f}']
    function  add(const aENOperativeObjectHistory: ENOperativeObjectHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENOperativeObjectHistory: ENOperativeObjectHistory); stdcall;
    function  getObject(const anObjectCode: Integer): ENOperativeObjectHistory; stdcall;
    function  getList: ENOperativeObjectHistoryShortList; stdcall;
    function  getFilteredList(const aENOperativeObjectHistoryFilter: ENOperativeObjectHistoryFilter): ENOperativeObjectHistoryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENOperativeObjectHistoryShortList; stdcall;
    function  getScrollableFilteredList(const aENOperativeObjectHistoryFilter: ENOperativeObjectHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENOperativeObjectHistoryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENOperativeObjectHistoryShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENOperativeObjectHistoryFilter: ENOperativeObjectHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENOperativeObjectHistory.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FobjectRef) then
      objectRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENOperativeObjectHistoryFilter.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FobjectRef) then
      objectRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENOperativeObjectHistoryFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENOperativeObjectHistoryShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FobjectRefContractDate) then
      objectRefContractDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENOperativeObjectHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENOperativeObjectHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOperativeObjectHistory');
  RemClassRegistry.RegisterXSClass(ENOperativeObjectHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOperativeObjectHistoryRef');
  RemClassRegistry.RegisterXSClass(ENOperativeObjectHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOperativeObjectHistoryFilter');
  RemClassRegistry.RegisterXSClass(ENOperativeObjectHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOperativeObjectHistoryShort');
  RemClassRegistry.RegisterXSClass(ENOperativeObjectHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOperativeObjectHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENOperativeObjectHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENOperativeObjectHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENOperativeObjectHistoryControllerSoapPort), 'http://ksoe.org/ENOperativeObjectHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENOperativeObjectHistoryControllerSoapPort), 'http://ksoe.org/ENOperativeObjectHistoryController/action/ENOperativeObjectHistoryController.%operationName%');


end.
