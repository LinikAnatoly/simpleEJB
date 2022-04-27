unit ENManningTable2TKPositionController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENManningTableController 
   ,TKPositionController 
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

  ENManningTable2TKPosition            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENManningTable2TKPositionRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENManningTable2TKPosition = class(TRemotable)
  private
    Fcode : Integer; 
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FmanningTableRef : ENManningTableRef;
//???
    FtkpositionRef : TKPositionRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property manningTableRef : ENManningTableRef read FmanningTableRef write FmanningTableRef; 
    property tkpositionRef : TKPositionRef read FtkpositionRef write FtkpositionRef; 
  end;

  ENManningTable2TKPositionFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FmanningTableRef : ENManningTableRef;
//???
    FtkpositionRef : TKPositionRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property manningTableRef : ENManningTableRef read FmanningTableRef write FmanningTableRef; 
    property tkpositionRef : TKPositionRef read FtkpositionRef write FtkpositionRef; 
  end;


  ENManningTable2TKPositionShort = class(TRemotable)
  private
    Fcode : Integer; 
    FmanningTableRefCode : Integer; 
    FmanningTableRefName : WideString;
    FmanningTableRefDateStart : TXSDate;
    FmanningTableRefDateFinal : TXSDate;
    FtkpositionRefCode : Integer; 
    FtkpositionRefName : WideString;
    FtkpositionRefSafetyGroup : WideString;
    FtkpositionRefRank : WideString;
    FtkpositionRefShortName : WideString;
  published
    property  code : Integer read Fcode write Fcode; 

    property manningTableRefCode : Integer read FmanningTableRefCode write FmanningTableRefCode; 
    property manningTableRefName : WideString read FmanningTableRefName write FmanningTableRefName; 
    property manningTableRefDateStart : TXSDate read FmanningTableRefDateStart write FmanningTableRefDateStart; 
    property manningTableRefDateFinal : TXSDate read FmanningTableRefDateFinal write FmanningTableRefDateFinal; 
    property tkpositionRefCode : Integer read FtkpositionRefCode write FtkpositionRefCode; 
    property tkpositionRefName : WideString read FtkpositionRefName write FtkpositionRefName; 
    property tkpositionRefSafetyGroup : WideString read FtkpositionRefSafetyGroup write FtkpositionRefSafetyGroup; 
    property tkpositionRefRank : WideString read FtkpositionRefRank write FtkpositionRefRank; 
    property tkpositionRefShortName : WideString read FtkpositionRefShortName write FtkpositionRefShortName; 
  end;

  ArrayOfENManningTable2TKPositionShort = array of ENManningTable2TKPositionShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENManningTable2TKPositionShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENManningTable2TKPositionShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENManningTable2TKPositionShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENManningTable2TKPositionController/message/
  // soapAction: http://ksoe.org/ENManningTable2TKPositionController/action/ENManningTable2TKPositionController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENManningTable2TKPositionControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENManningTable2TKPositionController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENManningTable2TKPositionControllerSoapPort = interface(IInvokable)
  ['{b866b866-b866-b866-b866-b866b866b866}']
    function  add(const aENManningTable2TKPosition: ENManningTable2TKPosition): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENManningTable2TKPosition: ENManningTable2TKPosition); stdcall;
    function  getObject(const anObjectCode: Integer): ENManningTable2TKPosition; stdcall;
    function  getList: ENManningTable2TKPositionShortList; stdcall;
    function  getFilteredList(const aENManningTable2TKPositionFilter: ENManningTable2TKPositionFilter): ENManningTable2TKPositionShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENManningTable2TKPositionShortList; stdcall;
    function  getScrollableFilteredList(const aENManningTable2TKPositionFilter: ENManningTable2TKPositionFilter; const aFromPosition: Integer; const aQuantity: Integer): ENManningTable2TKPositionShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENManningTable2TKPositionShortList; stdcall;
  end; 


implementation

  destructor ENManningTable2TKPosition.Destroy;
  begin
    if Assigned(FmanningTableRef) then
      manningTableRef.Free;
    if Assigned(FtkpositionRef) then
      tkpositionRef.Free;
    inherited Destroy;
  end;
  
  destructor ENManningTable2TKPositionFilter.Destroy;
  begin
    if Assigned(FmanningTableRef) then
      manningTableRef.Free;
    if Assigned(FtkpositionRef) then
      tkpositionRef.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENManningTable2TKPositionShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENManningTable2TKPosition, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManningTable2TKPosition');
  RemClassRegistry.RegisterXSClass(ENManningTable2TKPositionRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManningTable2TKPositionRef');
  RemClassRegistry.RegisterXSClass(ENManningTable2TKPositionFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManningTable2TKPositionFilter');
  RemClassRegistry.RegisterXSClass(ENManningTable2TKPositionShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManningTable2TKPositionShort');
  RemClassRegistry.RegisterXSClass(ENManningTable2TKPositionShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManningTable2TKPositionShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENManningTable2TKPositionShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENManningTable2TKPositionShort');

  InvRegistry.RegisterInterface(TypeInfo(ENManningTable2TKPositionControllerSoapPort), 'http://ksoe.org/ENManningTable2TKPositionController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENManningTable2TKPositionControllerSoapPort), 'http://ksoe.org/ENManningTable2TKPositionController/action/ENManningTable2TKPositionController.%operationName%');


end.
