unit ENConnectionTariffEntryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENConnectionTariffController 
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

  ENConnectionTariffEntry            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionTariffEntryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionTariffEntry = class(TRemotable)
  private
    Fcode : Integer; 
    Fvalue : TXSDecimal;
    FstartDate : TXSDate;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FtariffRef : ENConnectionTariffRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property value : TXSDecimal read Fvalue write Fvalue; 
    property startDate : TXSDate read FstartDate write FstartDate;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property tariffRef : ENConnectionTariffRef read FtariffRef write FtariffRef; 
  end;
  
{
  ENConnectionTariffEntryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fvalue : TXSDecimal;
    FstartDate : TXSDate;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FtariffRef : ENConnectionTariffRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property value : TXSDecimal read Fvalue write Fvalue; 
    property startDate : TXSDate read FstartDate write FstartDate;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property tariffRef : ENConnectionTariffRef read FtariffRef write FtariffRef; 
  end;
}

  ENConnectionTariffEntryFilter = class(ENConnectionTariffEntry)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENConnectionTariffEntryShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fvalue : TXSDecimal;
    FstartDate : TXSDate;	
    FuserGen : WideString;
    FtariffRefCode : Integer; 
    FtariffRefName : WideString;
    FtariffRefShortname : WideString;
    FtariffRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property value : TXSDecimal read Fvalue write Fvalue; 
    property startDate : TXSDate read FstartDate write FstartDate;
    property userGen : WideString read FuserGen write FuserGen;

    property tariffRefCode : Integer read FtariffRefCode write FtariffRefCode; 
    property tariffRefName : WideString read FtariffRefName write FtariffRefName; 
    property tariffRefShortname : WideString read FtariffRefShortname write FtariffRefShortname; 
    property tariffRefUserGen : WideString read FtariffRefUserGen write FtariffRefUserGen; 
  end;

  ArrayOfENConnectionTariffEntryShort = array of ENConnectionTariffEntryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConnectionTariffEntryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConnectionTariffEntryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConnectionTariffEntryShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConnectionTariffEntryController/message/
  // soapAction: http://ksoe.org/ENConnectionTariffEntryController/action/ENConnectionTariffEntryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConnectionTariffEntryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConnectionTariffEntryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConnectionTariffEntryControllerSoapPort = interface(IInvokable)
  ['{0876F07A-3304-44E7-9341-C52EE24F6D38}']
    function  add(const aENConnectionTariffEntry: ENConnectionTariffEntry): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConnectionTariffEntry: ENConnectionTariffEntry); stdcall;
    function  getObject(const anObjectCode: Integer): ENConnectionTariffEntry; stdcall;
    function  getList: ENConnectionTariffEntryShortList; stdcall;
    function  getFilteredList(const aENConnectionTariffEntryFilter: ENConnectionTariffEntryFilter): ENConnectionTariffEntryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConnectionTariffEntryShortList; stdcall;
    function  getScrollableFilteredList(const aENConnectionTariffEntryFilter: ENConnectionTariffEntryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionTariffEntryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionTariffEntryShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENConnectionTariffEntryFilter: ENConnectionTariffEntryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENConnectionTariffEntry.Destroy;
  begin
    if Assigned(Fvalue) then
      value.Free;
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FtariffRef) then
      tariffRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENConnectionTariffEntryFilter.Destroy;
  begin
    if Assigned(Fvalue) then
      value.Free;
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FtariffRef) then
      tariffRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENConnectionTariffEntryFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENConnectionTariffEntryShort.Destroy;
  begin
    if Assigned(Fvalue) then
      value.Free;
    if Assigned(FstartDate) then
      startDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENConnectionTariffEntryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConnectionTariffEntry, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffEntry');
  RemClassRegistry.RegisterXSClass(ENConnectionTariffEntryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffEntryRef');
  RemClassRegistry.RegisterXSClass(ENConnectionTariffEntryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffEntryFilter');
  RemClassRegistry.RegisterXSClass(ENConnectionTariffEntryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffEntryShort');
  RemClassRegistry.RegisterXSClass(ENConnectionTariffEntryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffEntryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConnectionTariffEntryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConnectionTariffEntryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConnectionTariffEntryControllerSoapPort), 'http://ksoe.org/ENConnectionTariffEntryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConnectionTariffEntryControllerSoapPort), 'http://ksoe.org/ENConnectionTariffEntryController/action/ENConnectionTariffEntryController.%operationName%');


end.
