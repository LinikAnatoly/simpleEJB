unit RQStorage2ENMolController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQStorageController 
   ,ENMolController 
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

  RQStorage2ENMol            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQStorage2ENMolRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQStorage2ENMol = class(TRemotable)
  private
    Fcode : Integer; 
    FuserGen : WideString;
    FdateEdit : TXSDateTime;	
    Fmodify_time : Int64;
//???
    FstorageRef : RQStorageRef;
//???
    FmolRef : ENMolRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property storageRef : RQStorageRef read FstorageRef write FstorageRef; 
    property molRef : ENMolRef read FmolRef write FmolRef; 
  end;
  
{
  RQStorage2ENMolFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FuserGen : WideString;
    FdateEdit : DateTime; 
    Fmodify_time : Int64;
//???
    FstorageRef : RQStorageRef;
//???
    FmolRef : ENMolRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property storageRef : RQStorageRef read FstorageRef write FstorageRef; 
    property molRef : ENMolRef read FmolRef write FmolRef; 
  end;
}

  RQStorage2ENMolFilter = class(RQStorage2ENMol)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQStorage2ENMolShort = class(TRemotable)
  private
    Fcode : Integer; 
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FstorageRefCode : Integer; 
    FstorageRefName : WideString;
    FstorageRefShortName : WideString;
    FstorageRefDescription : WideString;
    FstorageRefUserGen : WideString;
    FstorageRefDateEdit : TXSDateTime;	
    FmolRefCode : Integer; 
    FmolRefFinCode : WideString;
    FmolRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	

    property storageRefCode : Integer read FstorageRefCode write FstorageRefCode; 
    property storageRefName : WideString read FstorageRefName write FstorageRefName; 
    property storageRefShortName : WideString read FstorageRefShortName write FstorageRefShortName; 
    property storageRefDescription : WideString read FstorageRefDescription write FstorageRefDescription; 
    property storageRefUserGen : WideString read FstorageRefUserGen write FstorageRefUserGen; 
    property storageRefDateEdit : TXSDateTime read FstorageRefDateEdit write FstorageRefDateEdit; 
    property molRefCode : Integer read FmolRefCode write FmolRefCode; 
    property molRefFinCode : WideString read FmolRefFinCode write FmolRefFinCode; 
    property molRefName : WideString read FmolRefName write FmolRefName; 
  end;

  ArrayOfRQStorage2ENMolShort = array of RQStorage2ENMolShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQStorage2ENMolShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQStorage2ENMolShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQStorage2ENMolShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQStorage2ENMolController/message/
  // soapAction: http://ksoe.org/RQStorage2ENMolController/action/RQStorage2ENMolController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQStorage2ENMolControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQStorage2ENMolController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQStorage2ENMolControllerSoapPort = interface(IInvokable)
  ['{14201420-1420-1420-1420-142014201420}']
    function  add(const aRQStorage2ENMol: RQStorage2ENMol): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQStorage2ENMol: RQStorage2ENMol); stdcall;
    function  getObject(const anObjectCode: Integer): RQStorage2ENMol; stdcall;
    function  getList: RQStorage2ENMolShortList; stdcall;
    function  getFilteredList(const aRQStorage2ENMolFilter: RQStorage2ENMolFilter): RQStorage2ENMolShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQStorage2ENMolShortList; stdcall;
    function  getScrollableFilteredList(const aRQStorage2ENMolFilter: RQStorage2ENMolFilter; const aFromPosition: Integer; const aQuantity: Integer): RQStorage2ENMolShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQStorage2ENMolShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQStorage2ENMolFilter: RQStorage2ENMolFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor RQStorage2ENMol.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstorageRef) then
      storageRef.Free;
    if Assigned(FmolRef) then
      molRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQStorage2ENMolFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstorageRef) then
      storageRef.Free;
    if Assigned(FmolRef) then
      molRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQStorage2ENMolFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQStorage2ENMolShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstorageRefDateEdit) then
      storageRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor RQStorage2ENMolShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQStorage2ENMol, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorage2ENMol');
  RemClassRegistry.RegisterXSClass(RQStorage2ENMolRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorage2ENMolRef');
  RemClassRegistry.RegisterXSClass(RQStorage2ENMolFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorage2ENMolFilter');
  RemClassRegistry.RegisterXSClass(RQStorage2ENMolShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorage2ENMolShort');
  RemClassRegistry.RegisterXSClass(RQStorage2ENMolShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorage2ENMolShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQStorage2ENMolShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQStorage2ENMolShort');

  InvRegistry.RegisterInterface(TypeInfo(RQStorage2ENMolControllerSoapPort), 'http://ksoe.org/RQStorage2ENMolController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQStorage2ENMolControllerSoapPort), 'http://ksoe.org/RQStorage2ENMolController/action/RQStorage2ENMolController.%operationName%');


end.
