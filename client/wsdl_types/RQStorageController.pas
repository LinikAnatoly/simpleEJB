unit RQStorageController;

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

  RQStorage            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQStorageRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQStorage = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FshortName : WideString;
    Fdescription : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;	
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property description : WideString read Fdescription write Fdescription;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
  end;
  
{
  RQStorageFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FshortName : WideString;
    Fdescription : WideString;
    FuserGen : WideString;
    FdateEdit : DateTime; 
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property description : WideString read Fdescription write Fdescription;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
  end;
}

  RQStorageFilter = class(RQStorage)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQStorageShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FshortName : WideString;
    Fdescription : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property description : WideString read Fdescription write Fdescription;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	

  end;

  ArrayOfRQStorageShort = array of RQStorageShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQStorageShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQStorageShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQStorageShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQStorageController/message/
  // soapAction: http://ksoe.org/RQStorageController/action/RQStorageController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQStorageControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQStorageController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQStorageControllerSoapPort = interface(IInvokable)
  ['{f0acf0ac-f0ac-f0ac-f0ac-f0acf0acf0ac}']
    function  add(const aRQStorage: RQStorage): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQStorage: RQStorage); stdcall;
    function  getObject(const anObjectCode: Integer): RQStorage; stdcall;
    function  getList: RQStorageShortList; stdcall;
    function  getFilteredList(const aRQStorageFilter: RQStorageFilter): RQStorageShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQStorageShortList; stdcall;
    function  getScrollableFilteredList(const aRQStorageFilter: RQStorageFilter; const aFromPosition: Integer; const aQuantity: Integer): RQStorageShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQStorageShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQStorageFilter: RQStorageFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor RQStorage.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

{  
  destructor RQStorageFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end; 
}

  destructor RQStorageFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQStorageShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor RQStorageShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQStorage, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorage');
  RemClassRegistry.RegisterXSClass(RQStorageRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageRef');
  RemClassRegistry.RegisterXSClass(RQStorageFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageFilter');
  RemClassRegistry.RegisterXSClass(RQStorageShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageShort');
  RemClassRegistry.RegisterXSClass(RQStorageShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQStorageShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQStorageShort');

  InvRegistry.RegisterInterface(TypeInfo(RQStorageControllerSoapPort), 'http://ksoe.org/RQStorageController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQStorageControllerSoapPort), 'http://ksoe.org/RQStorageController/action/RQStorageController.%operationName%');


end.
