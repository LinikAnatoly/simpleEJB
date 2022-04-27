unit ENLineCableController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController 
   ,ENBelongingController 
   ,ENOwnerController 
   ,ENHighVoltageSellController 
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

  ENLineCable            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLineCableRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLineCable = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FlineLength : TXSDecimal;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FmainCustomersData : WideString;
    FmoreData : WideString;
    FlastRepairDate : TXSDate;
    FcableDescription : WideString;
    FdateGen : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fvoltagenominal : EPVoltageNominal;
//???
    Felement : ENElement;
//???
    FbelongingRef : ENBelongingRef;
//???
    FownerRef : ENOwnerRef;
//???
    FhighVoltageSell : ENHighVoltageSellRef;
    Fsubstationcellrefcode:Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property lineLength : TXSDecimal read FlineLength write FlineLength; 
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property mainCustomersData : WideString read FmainCustomersData write FmainCustomersData;
    property moreData : WideString read FmoreData write FmoreData;
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property cableDescription : WideString read FcableDescription write FcableDescription;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property voltagenominal : EPVoltageNominal read Fvoltagenominal write Fvoltagenominal; 
    property element : ENElement read Felement write Felement; 
    property belongingRef : ENBelongingRef read FbelongingRef write FbelongingRef; 
    property ownerRef : ENOwnerRef read FownerRef write FownerRef; 
    property highVoltageSell : ENHighVoltageSellRef read FhighVoltageSell write FhighVoltageSell;
    property substationcellrefcode : Integer read Fsubstationcellrefcode write Fsubstationcellrefcode;
  end;
  
{
  ENLineCableFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FlineLength : TXSDecimal;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FmainCustomersData : WideString;
    FmoreData : WideString;
    FlastRepairDate : TXSDate;
    FcableDescription : WideString;
    FdateGen : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fvoltagenominal : EPVoltageNominal;
//???
    Felement : ENElement;
//???
    FbelongingRef : ENBelongingRef;
//???
    FownerRef : ENOwnerRef;
//???
    FhighVoltageSell : ENHighVoltageSellRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property lineLength : TXSDecimal read FlineLength write FlineLength; 
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property mainCustomersData : WideString read FmainCustomersData write FmainCustomersData;
    property moreData : WideString read FmoreData write FmoreData;
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property cableDescription : WideString read FcableDescription write FcableDescription;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property voltagenominal : EPVoltageNominal read Fvoltagenominal write Fvoltagenominal; 
    property element : ENElement read Felement write Felement; 
    property belongingRef : ENBelongingRef read FbelongingRef write FbelongingRef; 
    property ownerRef : ENOwnerRef read FownerRef write FownerRef; 
    property highVoltageSell : ENHighVoltageSellRef read FhighVoltageSell write FhighVoltageSell; 
  end;
}

  ENLineCableFilter = class(ENLineCable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLineCableShort = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FlineLength : TXSDecimal;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FlastRepairDate : TXSDate;	
    FcableDescription : WideString;
    FvoltagenominalCode : Integer; 
    FelementCode : Integer; 
    FbelongingRefCode : Integer; 
    FbelongingRefName : WideString;
    FownerRefCode : Integer; 
    FhighVoltageSellCode : Integer; 
    FhighVoltageSellName : WideString;
    FhighVoltageSellNumberGen : WideString;
    FvoltageNominalValue: TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property lineLength : TXSDecimal read FlineLength write FlineLength; 
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property cableDescription : WideString read FcableDescription write FcableDescription;
    property voltagenominalCode : Integer read FvoltagenominalCode write FvoltagenominalCode; //EPVoltageNominalRef read FvoltagenominalCode write FvoltagenominalCode; 
    property elementCode : Integer read FelementCode write FelementCode; //ENElementRef read FelementCode write FelementCode; 
    property belongingRefCode : Integer read FbelongingRefCode write FbelongingRefCode; 
    property belongingRefName : WideString read FbelongingRefName write FbelongingRefName; 
    property ownerRefCode : Integer read FownerRefCode write FownerRefCode; //ENOwnerRef read FownerRefCode write FownerRefCode; 
    property highVoltageSellCode : Integer read FhighVoltageSellCode write FhighVoltageSellCode; 
    property highVoltageSellName : WideString read FhighVoltageSellName write FhighVoltageSellName; 
    property highVoltageSellNumberGen : WideString read FhighVoltageSellNumberGen write FhighVoltageSellNumberGen;
    property voltageNominalValue: TXSDecimal read FvoltageNominalValue write FvoltageNominalValue; 
  end;

  ArrayOfENLineCableShort = array of ENLineCableShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLineCableShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLineCableShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLineCableShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLineCableController/message/
  // soapAction: http://ksoe.org/ENLineCableController/action/ENLineCableController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLineCableControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLineCableController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLineCableControllerSoapPort = interface(IInvokable)
  ['{F6DBD2DF-092D-4216-A466-C807BEA03923}']
    function  add(const aENLineCable: ENLineCable): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLineCable: ENLineCable); stdcall;
    function  getObject(const anObjectCode: Integer): ENLineCable; stdcall;
    function  getList: ENLineCableShortList; stdcall;
    function  getFilteredList(const aENLineCableFilter: ENLineCableFilter): ENLineCableShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLineCableShortList; stdcall;
    function  getScrollableFilteredList(const aENLineCableFilter: ENLineCableFilter; const aFromPosition: Integer; const aQuantity: Integer): ENLineCableShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLineCableShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLineCableFilter: ENLineCableFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENLineCableShort; stdcall;
  end; 


implementation

  destructor ENLineCable.Destroy;
  begin
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(Fvoltagenominal) then
      voltagenominal.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FbelongingRef) then
      belongingRef.Free;
    if Assigned(FownerRef) then
      ownerRef.Free;
    if Assigned(FhighVoltageSell) then
      highVoltageSell.Free;
    inherited Destroy;
  end;

{  
  destructor ENLineCableFilter.Destroy;
  begin
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(Fvoltagenominal) then
      voltagenominal.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FbelongingRef) then
      belongingRef.Free;
    if Assigned(FownerRef) then
      ownerRef.Free;
    if Assigned(FhighVoltageSell) then
      highVoltageSell.Free;
    inherited Destroy;
  end; 
}

  destructor ENLineCableFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENLineCableShort.Destroy;
  begin
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENLineCableShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLineCable, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLineCable');
  RemClassRegistry.RegisterXSClass(ENLineCableRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLineCableRef');
  RemClassRegistry.RegisterXSClass(ENLineCableFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLineCableFilter');
  RemClassRegistry.RegisterXSClass(ENLineCableShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLineCableShort');
  RemClassRegistry.RegisterXSClass(ENLineCableShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLineCableShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLineCableShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLineCableShort');

  InvRegistry.RegisterInterface(TypeInfo(ENLineCableControllerSoapPort), 'http://ksoe.org/ENLineCableController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLineCableControllerSoapPort), 'http://ksoe.org/ENLineCableController/action/ENLineCableController.%operationName%');


end.
