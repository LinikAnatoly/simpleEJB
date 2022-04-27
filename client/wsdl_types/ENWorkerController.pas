unit ENWorkerController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENManningTableController 
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

  ENWorker            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkerRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorker = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FtabNumber : WideString;
    FisMol : Integer; 
    FfinCode : Integer; 
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FmanningTable : ENManningTable;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property  isMol : Integer read FisMol write FisMol; 
    property  finCode : Integer read FfinCode write FfinCode; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property manningTable : ENManningTable read FmanningTable write FmanningTable; 
  end;

  ENWorkerFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FtabNumber : WideString;
    FisMol : Integer; 
    FfinCode : Integer; 
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FmanningTable : ENManningTable;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property  isMol : Integer read FisMol write FisMol; 
    property  finCode : Integer read FfinCode write FfinCode; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property manningTable : ENManningTable read FmanningTable write FmanningTable; 
  end;


  ENWorkerShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FtabNumber : WideString;
    FisMol : Integer; 
    FmanningTableCode : Integer; 
    FmanningTableName : WideString;
    FmanningTableDateStart : TXSDate;
    FmanningTableDateFinal : TXSDate;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property  isMol : Integer read FisMol write FisMol; 

    property manningTableCode : Integer read FmanningTableCode write FmanningTableCode; 
    property manningTableName : WideString read FmanningTableName write FmanningTableName; 
    property manningTableDateStart : TXSDate read FmanningTableDateStart write FmanningTableDateStart; 
    property manningTableDateFinal : TXSDate read FmanningTableDateFinal write FmanningTableDateFinal; 
  end;

  ArrayOfENWorkerShort = array of ENWorkerShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWorkerShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWorkerShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWorkerShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWorkerController/message/
  // soapAction: http://ksoe.org/ENWorkerController/action/ENWorkerController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWorkerControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWorkerController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWorkerControllerSoapPort = interface(IInvokable)
  ['{1d6c1d6c-1d6c-1d6c-1d6c-1d6c1d6c1d6c}']
    function  add(const aENWorker: ENWorker): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWorker: ENWorker); stdcall;
    function  getObject(const anObjectCode: Integer): ENWorker; stdcall;
    function  getList: ENWorkerShortList; stdcall;
    function  getFilteredList(const aENWorkerFilter: ENWorkerFilter): ENWorkerShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWorkerShortList; stdcall;
    function  getScrollableFilteredList(const aENWorkerFilter: ENWorkerFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkerShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWorkerShortList; stdcall;
  end; 


implementation

  destructor ENWorker.Destroy;
  begin
    if Assigned(FmanningTable) then
      manningTable.Free;
    inherited Destroy;
  end;
  
  destructor ENWorkerFilter.Destroy;
  begin
    if Assigned(FmanningTable) then
      manningTable.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENWorkerShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWorker, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorker');
  RemClassRegistry.RegisterXSClass(ENWorkerRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkerRef');
  RemClassRegistry.RegisterXSClass(ENWorkerFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkerFilter');
  RemClassRegistry.RegisterXSClass(ENWorkerShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkerShort');
  RemClassRegistry.RegisterXSClass(ENWorkerShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkerShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWorkerShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWorkerShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWorkerControllerSoapPort), 'http://ksoe.org/ENWorkerController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWorkerControllerSoapPort), 'http://ksoe.org/ENWorkerController/action/ENWorkerController.%operationName%');


end.
