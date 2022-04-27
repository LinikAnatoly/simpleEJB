unit ENAutoTiresHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENAutoTiresController 
   ,TKTransportRealController 
   ,ENTiresInstallPlacesController 
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

  ENAutoTiresHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAutoTiresHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAutoTiresHistory = class(TRemotable)
  private
    Fcode : Integer; 
    FinstallDate : TXSDate;
    FuninstallDate : TXSDate;
    Fdistance : TXSDecimal;
    FactInstallNumber : WideString;
    FactUninstallNumber : WideString;
    FreplacementReason : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FtiresRef : ENAutoTiresRef;
//???
    FtransportRealRef : TKTransportRealRef;
//???
    FinstallPlacesRef : ENTiresInstallPlacesRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property uninstallDate : TXSDate read FuninstallDate write FuninstallDate;
    property distance : TXSDecimal read Fdistance write Fdistance;
    property actInstallNumber : WideString read FactInstallNumber write FactInstallNumber;
    property actUninstallNumber : WideString read FactUninstallNumber write FactUninstallNumber;
    property replacementReason : WideString read FreplacementReason write FreplacementReason;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property tiresRef : ENAutoTiresRef read FtiresRef write FtiresRef; 
    property transportRealRef : TKTransportRealRef read FtransportRealRef write FtransportRealRef; 
    property installPlacesRef : ENTiresInstallPlacesRef read FinstallPlacesRef write FinstallPlacesRef; 
  end;
  
{
  ENAutoTiresHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FinstallDate : TXSDate;
    FuninstallDate : TXSDate;
    Fdistance : TXSDecimal;
    FreplacementReason : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FtiresRef : ENAutoTiresRef;
//???
    FtransportRealRef : TKTransportRealRef;
//???
    FinstallPlacesRef : ENTiresInstallPlacesRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property uninstallDate : TXSDate read FuninstallDate write FuninstallDate;
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property replacementReason : WideString read FreplacementReason write FreplacementReason;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property tiresRef : ENAutoTiresRef read FtiresRef write FtiresRef; 
    property transportRealRef : TKTransportRealRef read FtransportRealRef write FtransportRealRef; 
    property installPlacesRef : ENTiresInstallPlacesRef read FinstallPlacesRef write FinstallPlacesRef; 
  end;
}

  ENAutoTiresHistoryFilter = class(ENAutoTiresHistory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAutoTiresHistoryShort = class(TRemotable)
  private
    Fcode : Integer; 
    FinstallDate : TXSDate;	
    FuninstallDate : TXSDate;	
    Fdistance : TXSDecimal;
    FactInstallNumber : WideString;
    FactUninstallNumber : WideString;
    FreplacementReason : WideString;
    FtiresRefCode : Integer; 
    FtiresRefTypeName : WideString;
    FtiresRefGarageNumber : WideString;
    FtiresRefSerialNumber : WideString;
    FtiresRefFactory : WideString;
    FtiresRefPotencial : TXSDecimal;
    FtiresRefDistanceAll : TXSDecimal;
    FtiresRefNominal : WideString;
    FtransportRealRefCode : Integer; 
    FinstallPlacesRefCode : Integer; 
    FinstallPlacesRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property uninstallDate : TXSDate read FuninstallDate write FuninstallDate;
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property actInstallNumber : WideString read FactInstallNumber write FactInstallNumber;
    property actUninstallNumber : WideString read FactUninstallNumber write FactUninstallNumber;
    property replacementReason : WideString read FreplacementReason write FreplacementReason;

    property tiresRefCode : Integer read FtiresRefCode write FtiresRefCode; 
    property tiresRefTypeName : WideString read FtiresRefTypeName write FtiresRefTypeName; 
    property tiresRefGarageNumber : WideString read FtiresRefGarageNumber write FtiresRefGarageNumber; 
    property tiresRefSerialNumber : WideString read FtiresRefSerialNumber write FtiresRefSerialNumber; 
    property tiresRefFactory : WideString read FtiresRefFactory write FtiresRefFactory; 
    property tiresRefPotencial : TXSDecimal read FtiresRefPotencial write FtiresRefPotencial; 
    property tiresRefDistanceAll : TXSDecimal read FtiresRefDistanceAll write FtiresRefDistanceAll; 
    property tiresRefNominal : WideString read FtiresRefNominal write FtiresRefNominal; 
    property transportRealRefCode : Integer read FtransportRealRefCode write FtransportRealRefCode; //TKTransportRealRef read FtransportRealRefCode write FtransportRealRefCode; 
    property installPlacesRefCode : Integer read FinstallPlacesRefCode write FinstallPlacesRefCode; 
    property installPlacesRefName : WideString read FinstallPlacesRefName write FinstallPlacesRefName; 
  end;

  ArrayOfENAutoTiresHistoryShort = array of ENAutoTiresHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAutoTiresHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAutoTiresHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAutoTiresHistoryShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAutoTiresHistoryController/message/
  // soapAction: http://ksoe.org/ENAutoTiresHistoryController/action/ENAutoTiresHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAutoTiresHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAutoTiresHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAutoTiresHistoryControllerSoapPort = interface(IInvokable)
  ['{18fe18fe-18fe-18fe-18fe-18fe18fe18fe}']
    function  add(const aENAutoTiresHistory: ENAutoTiresHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAutoTiresHistory: ENAutoTiresHistory); stdcall;
    function  getObject(const anObjectCode: Integer): ENAutoTiresHistory; stdcall;
    function  getList: ENAutoTiresHistoryShortList; stdcall;
    function  getFilteredList(const aENAutoTiresHistoryFilter: ENAutoTiresHistoryFilter): ENAutoTiresHistoryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAutoTiresHistoryShortList; stdcall;
    function  getScrollableFilteredList(const aENAutoTiresHistoryFilter: ENAutoTiresHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAutoTiresHistoryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAutoTiresHistoryShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAutoTiresHistoryFilter: ENAutoTiresHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENAutoTiresHistory.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FtiresRef) then
      tiresRef.Free;
    if Assigned(FtransportRealRef) then
      transportRealRef.Free;
    if Assigned(FinstallPlacesRef) then
      installPlacesRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENAutoTiresHistoryFilter.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FtiresRef) then
      tiresRef.Free;
    if Assigned(FtransportRealRef) then
      transportRealRef.Free;
    if Assigned(FinstallPlacesRef) then
      installPlacesRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENAutoTiresHistoryFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENAutoTiresHistoryShort.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FtiresRefPotencial) then
      tiresRefPotencial.Free;
    if Assigned(FtiresRefDistanceAll) then
      tiresRefDistanceAll.Free;
    inherited Destroy;
  end; 
  
  destructor ENAutoTiresHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAutoTiresHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresHistory');
  RemClassRegistry.RegisterXSClass(ENAutoTiresHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresHistoryRef');
  RemClassRegistry.RegisterXSClass(ENAutoTiresHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresHistoryFilter');
  RemClassRegistry.RegisterXSClass(ENAutoTiresHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresHistoryShort');
  RemClassRegistry.RegisterXSClass(ENAutoTiresHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAutoTiresHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAutoTiresHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAutoTiresHistoryControllerSoapPort), 'http://ksoe.org/ENAutoTiresHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAutoTiresHistoryControllerSoapPort), 'http://ksoe.org/ENAutoTiresHistoryController/action/ENAutoTiresHistoryController.%operationName%');


end.
