unit ScanCountersController;

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
  // !:EPCalculatorShortList - "http://ksoe.org/ScanCountersControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/ScanCountersControllerService/type/"

  ScanCounters            = class;           { "http://ksoe.org/ScanCountersControllerService/type/" }
  ScanCountersDiagnosticLine = class;           { "http://ksoe.org/ScanCountersControllerService/type/" }
  ScanCountersDiagnostic  = class;           { "http://ksoe.org/ScanCountersControllerService/type/" }


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ScanCountersControllerService/type/
  // ************************************************************************ //
  ScanCountersRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ScanCountersControllerService/type/
  // ************************************************************************ //
  ScanCounters = class(TRemotable)
  private
    Fname : WideString;
    Finvnumber : WideString;
    Fserialnumber : WideString;
    FcodePodr : Integer;
    Fdt_vypusk:TXSDate;
    Fstr_name: WideString;
	  Fsum_st_nds :TXSDecimal;
	  Fkod_subsch_b:WideString;
    Fmol:WideString;
    Fnum_un: Integer;
    Ftype_counter : WideString;
    Fmol_name : WideString;
    Fphasity : TXSDecimal;
  published
    property name : WideString read Fname write Fname;
    property invnumber : WideString read Finvnumber write Finvnumber;
    property serialnumber : WideString read Fserialnumber write Fserialnumber;
    property  codePodr : Integer read FcodePodr write FcodePodr;
    property dt_vypusk:TXSDate read Fdt_vypusk write Fdt_vypusk;
    property str_name : WideString read Fstr_name write Fstr_name;
    property sum_st_nds : TXSDecimal read Fsum_st_nds write Fsum_st_nds;
    property kod_subsch_b : WideString read Fkod_subsch_b write Fkod_subsch_b;
    property mol : WideString read Fmol write Fmol;
    property num_un : Integer read Fnum_un write Fnum_un;
    property type_counter : WideString read Ftype_counter write Ftype_counter;
    property mol_name : WideString read Fmol_name write Fmol_name;
    property phasity : TXSDecimal read Fphasity write Fphasity;
  end;

  ScanCountersFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fname : WideString;
    Finvnumber : WideString;
    Fserialnumber : WideString;
    FcodePodr : Integer;
    Fdt_vypusk:TXSDate;
    Fmol:WideString;
    Fphasity : TXSDecimal;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property name : WideString read Fname write Fname;
    property invnumber : WideString read Finvnumber write Finvnumber;
    property serialnumber : WideString read Fserialnumber write Fserialnumber;
    property  codePodr : Integer read FcodePodr write FcodePodr;
    property dt_vypusk:TXSDate read Fdt_vypusk write Fdt_vypusk;
    property mol : WideString read Fmol write Fmol;
    property phasity : TXSDecimal read Fphasity write Fphasity;
  end;

  ScanCountersShort = class(TRemotable)
  private
    Fname : WideString;
    Finvnumber : WideString;
    Fserialnumber : WideString;
    FcodePodr : Integer;
    Fdt_vypusk:TXSDate;
    Fstr_name: WideString;
	  Fsum_st_nds :TXSDecimal;
	  Fkod_subsch_b:WideString;
    Fmol:WideString;
    Fnum_un : Integer;
    Ftype_counter : WideString;
    Fmol_name : WideString;
    Fphasity : TXSDecimal;
  published
    property name : WideString read Fname write Fname;
    property invnumber : WideString read Finvnumber write Finvnumber;
    property serialnumber : WideString read Fserialnumber write Fserialnumber;
    property codePodr : Integer read FcodePodr write FcodePodr;
    property dt_vypusk:TXSDate read Fdt_vypusk write Fdt_vypusk;
    property str_name : WideString read Fstr_name write Fstr_name;
    property sum_st_nds : TXSDecimal read Fsum_st_nds write Fsum_st_nds;
    property kod_subsch_b : WideString read Fkod_subsch_b write Fkod_subsch_b;
    property mol : WideString read Fmol write Fmol;
    property num_un : Integer read Fnum_un write Fnum_un;
    property type_counter : WideString read Ftype_counter write Ftype_counter;
    property mol_name : WideString read Fmol_name write Fmol_name;
    property phasity : TXSDecimal read Fphasity write Fphasity;
    
  end;

  ArrayOfScanCountersShort = array of ScanCountersShort;  // { "http://ksoe.org/ScanCountersControllerService/type/" }

  ScanCountersShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfScanCountersShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfScanCountersShort read Flist write Flist;
  end;

  ScanCountersDiagnosticLine = class(TRemotable)
  private
  Fname:WideString;
  FinvNumber:WideString;
  FserialNumber:WideString;
  Fkod_podr:WideString;
  Fdt_vypusk:TXSDate;
  FnameScan:WideString;
  FinvNumberScan:WideString;
  FserialNumberScan:WideString;
  Fdt_vypuskScan:TXSDate;
  Fnote:WideString;

  public
   // destructor Destroy; override;
  published
  property name:WideString read Fname write Fname;
  property invNumber:WideString read FinvNumber write FinvNumber;
  property serialNumber:WideString read FserialNumber write FserialNumber;
  property kod_podr:WideString read Fkod_podr write Fkod_podr;
  property dt_vypusk:TXSDate read Fdt_vypusk write Fdt_vypusk;
  property nameScan:WideString read FnameScan write FnameScan;
  property invNumberScan:WideString read FinvNumberScan write FinvNumberScan;
  property serialNumberScan:WideString read FserialNumberScan write FserialNumberScan;
  property dt_vypuskScan:TXSDate read Fdt_vypuskScan write Fdt_vypuskScan;
  property note:WideString read Fnote write Fnote;

 end;

 ArrayOfScanCountersDiagnosticLine = array of  ScanCountersDiagnosticLine;

  ScanCountersDiagnostic = class(TRemotable)
  private
    Flines: ArrayOfScanCountersDiagnosticLine;
    FisSuccessful: Integer;
  public
    destructor Destroy; override;
  published
    property lines: ArrayOfScanCountersDiagnosticLine read Flines write Flines;
    property isSuccessful: Integer read FisSuccessful write FisSuccessful;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ScanCountersController/message/
  // soapAction: http://ksoe.org/ScanCountersController/action/ScanCountersController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ScanCountersControllerSoapBinding
  // service   : ScanCountersControllerService
  // port      : ScanCountersController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ScanCountersControllerSoapPort = interface(IInvokable)
  ['{D1AC4CEF-F27A-44AF-8D8E-BCFF6026899C}']
    function  add(const aScanCounters: ScanCounters): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aScanCounters: ScanCounters); stdcall;
    function  getObject(const anObjectCode: Integer): ScanCounters; stdcall;
    function  getList: ScanCountersShortList; stdcall;
    function  getFilteredList(const aScanCountersFilter: ScanCountersFilter): ScanCountersShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ScanCountersShortList; stdcall;
    function  getScrollableFilteredList(const aScanCountersFilter: ScanCountersFilter; const aFromPosition: Integer; const aQuantity: Integer): ScanCountersShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ScanCountersShortList; stdcall;
    function  getScrollableFilteredListNet(const aScanCountersFilter: ScanCountersFilter; const aFromPosition: Integer; const aQuantity: Integer): ScanCountersShortList; stdcall;
    //    function  getCounterForChange(const isPlan: Integer; const aMol: WideString; const aInvNumber: WideString;const aOrderDate:TXSDate): ScanCountersShortList; stdcall;

    function  getCounterForChange(const aScanCountersFilter: ScanCountersFilter; const isPlan: Integer;const isMoveZKU: Integer;const rpcode: Integer): ScanCountersShortList; stdcall; overload;
    function  getCounterForChange(const aScanCountersFilter: ScanCountersFilter; const isPlan: Integer;const isMoveZKU: Integer;const rpcode: Integer;const isZoneCounter:Integer): ScanCountersShortList; stdcall; overload;

    function  getScrollableFilteredListNetForEnWorkOrderBytItem(const aScanCountersFilter: ScanCountersFilter; const aFromPosition: Integer; const aQuantity: Integer;const aWorkorderbytitemcode : Integer): ScanCountersShortList; stdcall;
	
	function  getCounterDateCheck(const anObjectCode: String): TXSDate; stdcall;
	
  end;


implementation

  
  
  destructor ScanCountersShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

 destructor ScanCountersDiagnostic.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flines)-1 do
     if Assigned(Flines[I]) then
       Flines[I].Free;
     SetLength(Flines, 0);
     inherited Destroy;
  end;


initialization

  RemClassRegistry.RegisterXSClass(ScanCounters, 'http://ksoe.org/ScanCountersControllerService/type/', 'ScanCounters');
  RemClassRegistry.RegisterXSClass(ScanCountersRef, 'http://ksoe.org/ScanCountersControllerService/type/', 'ScanCountersRef');
  RemClassRegistry.RegisterXSClass(ScanCountersFilter, 'http://ksoe.org/ScanCountersControllerService/type/', 'ScanCountersFilter');
  RemClassRegistry.RegisterXSClass(ScanCountersShort, 'http://ksoe.org/ScanCountersControllerService/type/', 'ScanCountersShort');
  RemClassRegistry.RegisterXSClass(ScanCountersShortList, 'http://ksoe.org/ScanCountersControllerService/type/', 'ScanCountersShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfScanCountersShort), 'http://ksoe.org/ScanCountersControllerService/type/', 'ArrayOfScanCountersShort');

  InvRegistry.RegisterInterface(TypeInfo(ScanCountersControllerSoapPort), 'http://ksoe.org/ScanCountersController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ScanCountersControllerSoapPort), 'http://ksoe.org/ScanCountersController/action/ScanCountersController.%operationName%');


end.
